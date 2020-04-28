luagram = require 'luagram-client'
json = require 'libs/json'
config = require 'config'
redis = require 'redis'
db = redis.connect('127.0.0.1', 6379)
app = luagram.set_config{
  api_id = config.api_id,
  api_hash = config.api_hash,
  session_name = config.session_name,
  token = config.token,
}

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function createNewFile(path, data, md)
  file = io.open(path, md or 'w+')
  file:write(tostring(data))
  file:close()
end

function rank(user_id , chat_id)
  if user_id and app.in_array(config.owner_ids, user_id) then
    return 1
   elseif user_id and db:sismember(config.session_name .. 'sudos', user_id) then
     return 2
   elseif chat_id and user_id and db:sismember(config.session_name .. 'owners'.. chat_id, user_id) then
     return 3
   elseif chat_id and user_id and db:sismember(config.session_name .. 'admins'.. chat_id, user_id) then
     return 4
   elseif chat_id and user_id and db:sismember(config.session_name .. 'vips'.. chat_id, user_id) then
     return 5
   elseif user_id and db:sismember(config.session_name .. 'banall', user_id) then
     return 6
   elseif user_id and db:sismember(config.session_name .. 'tabchi', user_id) then
     return 7
   elseif not user_id and chat_id and db:sismember(config.session_name .. 'groups', chat_id) then
     return 0
  else
    return 10
  end
end

function setPluginStatus(...)
  local Manage = {...}
  local result = false
  if type(Manage[2]) == 'string' then
    if Manage[2]:match('/') then
      Manage[2] = Manage[2]
    elseif Manage[2]:match('.lua') then
      Manage[2] = 'plugins/'..Manage[2]
    else
      Manage[2] = 'plugins/'..Manage[2]..'.lua'
    end
  end
  if app.exists('data/data.json') then
    local data = io.open('data/data.json'):read('*a')
    plugin_data = json:decode(data)
  else
    plugin_data = {
      plugins = {
      }
    }
  end
  if type(Manage[1]) == 'string' and string.lower(Manage[1]) == 'add' then
    createNewFile(Manage[2], Manage[3])
    plugin_data.plugins[Manage[2]] = {
      active = false
    }
    result = true
  elseif type(Manage[1]) == 'string' and string.lower(Manage[1]) == 'delete' then
    if plugin_data.plugins[Manage[2]] then
      os.remove(Manage[2])
      plugin_data.plugins[Manage[2]] = nil
      result = true
    end
  elseif type(Manage[1]) == 'string' and string.lower(Manage[1]) == 'load' then
    local active = 0
    local deactive = 0
    local plugins = io.popen('ls -a plugins/*.lua') -- اضافه شدن پلاگین جدید
    for plugin_path in plugins:lines() do
      if not plugin_data.plugins[plugin_path] then
        plugin_data.plugins[plugin_path] = {
           active = false
         }
       end
     end
     for key, value in pairs(plugin_data.plugins) do -- حذف پلاگین حذف شده از پوشه پلاگین ها
       if not app.exists(key) then
         plugin_data.plugins[key] = nil
       elseif value.active then
         active = active + 1
       else
         deactive = deactive + 1
       end
     end
     result = {
       all = app.len(plugin_data.plugins),
       active = active,
       deactive = deactive
     }
  elseif type(Manage[1]) == 'string' and string.lower(Manage[1]) == 'deactive' then
    if plugin_data.plugins[Manage[2]] then
      plugin_data.plugins[Manage[2]].active = false
      result = true
    end
  elseif type(Manage[1]) == 'string' and string.lower(Manage[1]) == 'active' then
    if plugin_data.plugins[Manage[2]] and os.execute('lua5.3 '..Manage[2]) then
      plugin_data.plugins[Manage[2]].active = true
      result = true
    end

  elseif type(Manage[1]) == 'string' and string.lower(Manage[1]) == 'get' then
    if plugin_data.plugins[Manage[2]] then
      result = Manage[2]
    end
  end
  config.plugins = plugin_data.plugins
  table.sort(plugin_data)
  new_config = json:encode(plugin_data)
  createNewFile('data/data.json', new_config)
  return result
end

local function create_callback(...)
  local datas = {...}
  local result = {
    ['@'] = 'MIT',
  }
  for key = 1, #datas, 2 do
    result[datas[key]] = datas[key + 1]
  end
  return json:encode(result)
end


local function controllPlugins(ID, plugin_len)
  table.sort(config.plugins)
  local stop = ID * (9)
  local start = stop - 9
  local counter = 0
  local result = {
    type = 'inline',
    data = {}
  }
  for plugin_path , plugin_data in pairs(config.plugins) do
    local name = plugin_path:match('/(%S+)')
    local emoji = plugin_data.active and 'ON' or 'OFF'
    if counter < stop and start <= counter then
      result.data[#result.data + 1] = {
        {text = name , data = name},
        {text = emoji , data = create_callback('_', 'setStatus', 'name', name, 'ID', ID)},
        {text = '🗑' , data = create_callback('_', 'delPlugin', 'name', name, 'ID', ID)}
      }
    end
    counter = counter + 1
  end
  if ID == 1 and plugin_len <= 10 then
    result.data[#result.data + 1] = {
      {text = '◄ Back' , data = create_callback('_', 'Menu')}
    }
  elseif ID == 1 and plugin_len > 10 then
    result.data[#result.data + 1] = {
      {text = 'Next ►' , create_callback('_', 'Plugins', 'ID', ID + 1)}
    }
    result.data[#result.data + 1] = {
      {text = '◄ Back' , data = create_callback('_', 'Menu')},
    }
  elseif counter >= plugin_len then
    result.data[#result.data + 1] = {
      {text = '◄ Back' , data = create_callback('_', 'Plugins', 'ID', ID + 1)}
    }
  else
    result.data[#result.data + 1] = {
      {text = '◄ Back' , data = create_callback('_', 'Plugins', 'ID', ID - 1)}
    }
    result.data[#result.data + 1] = {
      {text = 'Next ►' , data = create_callback('_', 'Plugins', 'ID', ID + 1)}
    }
  end
  return app.replyMarkup(result)
end

function ManagePlugins(msg)
  local plugins_info = setPluginStatus('load') --// reload bots
  if msg.message then
    local msg = msg.message
    if msg.date + 10 <= os.time() then
      return false
    end --// old message
    if msg.content.text and rank(msg.sender_user_id) <= 2 then
      if string.lower(msg.content.text.text) == 'plugin' then
        local reply_markup = app.replyMarkup{
          type = 'inline',
          data = {
            {
              {text = '• Plugin Manager', data = create_callback('_', 'Plugins', 'ID', 1)}
            },
            {
              {text = '• Add Plugin', data = create_callback('_', 'AddHelp')}
            },
            {
              {text = 'Close', data = create_callback('_', 'Close')},
            }
          }
        }
        app.sendText(msg.chat_id, msg.id, '• [ '..plugins_info.all..' ] Total Plugins Found 🔍\n✅ %{Active, c} : [ '..plugins_info.active..' ]\n⚠️ %{DeActive, c} : [ '..plugins_info.deactive..' ]', 'lg', false, false, false, false, reply_markup)
      elseif string.lower(msg.content.text.text):match('^+pl (%S+) (%S+)$') and msg.reply_to_message_id > 0 then
        local name, active = string.lower(msg.content.text.text):match('^+pl (%S+) (%S+)$')
        local get_plugin_message = app.getMessage(msg.chat_id, msg.reply_to_message_id)
        local get_plugin = setPluginStatus('get', name)
        if get_plugin then
          app.sendDocument(msg.sender_user_id, 0, get_plugin, '• %{Backup ,b} '..name,'lg')
        end
        if get_plugin_message.content.document then
          repeat
             download = app.downloadFile(get_plugin_message.content.document.document.id)
          until #download['local'].path ~= 0
          local plugin = io.open(download['local'].path)
          if plugin then
            local plugin_code = plugin:read('*a')
            if active == 'on' then
              setPluginStatus('add', name, plugin_code)
              if setPluginStatus('active', name) then
                app.sendText(msg.chat_id, msg.id, '• Plugin %{SuccessFully,b} Added and Enabled ✅\n\n%{Plugin inFo, b}:\n\n• Name : '..name..'.lua\n• Size : '..round(get_plugin_message.content.document.document.size / 1000, 2)..' KB','lg')
              else
                setPluginStatus('delete', name)
                app.sendText(msg.chat_id, msg.id, '• Plugin %{'..name..'.lua,b} Removed From Server , Because Bug in Your Script !','lg')
              end
            elseif active == 'off' then
              setPluginStatus('add', name, plugin_code)
              app.sendText(msg.chat_id, msg.id, '• Plugin SuccessFully Added ✅\n\n•• %{Plugin inFo, b}:\n\n• Name : '..name..'.lua\n• Size : '..round(get_plugin_message.content.document.document.size / 1000, 2)..' KB','lg')
            end
          end
        end
      end
    end
  elseif msg.payload then
    local callback = app.base64_decode(msg.payload.data)
    if callback:match('{.*}') then
      callback = json:decode(callback)
    else
      return false
    end
    if callback['@'] ~= 'MIT' then
      return false
    end
    local panel_message = app.getMessage(msg.chat_id,msg.message_id)
    if rank(msg.sender_user_id) > 2 then
      app.answerCallbackQuery(msg.id, '• You Do Not Have access !', true)
    elseif app.getMessage(msg.chat_id, panel_message.reply_to_message_id).sender_user_id ~= msg.sender_user_id then
      app.answerCallbackQuery(msg.id, '• Panel Not Controlled By You !', true)
    else

      if callback._ == 'Close' then
        local function MultiEdit(arg)
          app.editMessageText(arg.chat_id, arg.message_id, '• Closing Panel ... ' .. config.emojis[arg.counter])
          if arg.counter < 10 then
            arg.counter = arg.counter + 1
            app.set_timer(1, MultiEdit, arg)
          else
            app.deleteMessages(arg.chat_id, arg.message_id)
            app.deleteMessages(arg.chat_id, arg.request_id)
          end
        end
        app.set_timer(1, MultiEdit, {chat_id = msg.chat_id, message_id = msg.message_id, counter = 1, request_id = panel_message.reply_to_message_id})
      end

      if callback._ == 'AddHelp' then
        local reply_markup = app.replyMarkup{
          type = 'inline',
          data = {
            {
              {text = '◄ Back' , data = create_callback('_', 'Menu')}
            }
          }
        }
        app.editMessageText(msg.chat_id, msg.message_id, '• %{For Add New Plugin And Edit Plugin, b}, With Reply On File\n\n• +pl name ON \n• +pl name OFF ', 'lg', true, false, reply_markup)
      end

      if callback._ == 'setStatus' and callback.name and callback.ID then
        local get_plugin = setPluginStatus('get', callback.name)
        if not get_plugin then
          app.answerCallbackQuery(msg.id, '• Your Plugin Not Found !')
        elseif config.plugins[get_plugin].active then
          setPluginStatus('deactive', callback.name)
          app.answerCallbackQuery(msg.id, '• Plugin '..callback.name..' SuccessFully Disabled !')
        elseif not config.plugins[get_plugin].active then
          if setPluginStatus('active', callback.name) then
            app.answerCallbackQuery(msg.id, '• Plugin '..callback.name..' SuccessFully Enabled !')
          else
            app.answerCallbackQuery(msg.id, '• Plugin '..callback.name..' Has a Problem !',true)
          end
        end
        local reply_markup = controllPlugins(callback.ID, plugins_info.all)
        app.editMessageText(msg.chat_id, msg.message_id, '• [ '..plugins_info.all..' ] Total Plugins Found 🔍\n✅ %{Active, c} : [ '..plugins_info.active..' ]\n⚠️ %{DeActive, c} : [ '..plugins_info.deactive..' ]', 'lg', true, false, reply_markup)
      end

      if callback._ == 'finalDelete' and callback.name and callback.ID then
        local get_plugin = setPluginStatus('get', callback.name)
        if not get_plugin then
          app.answerCallbackQuery(msg.id, '• Your Plugin Not Found !')
        else
          app.sendDocument(msg.sender_user_id, 0, get_plugin, '• %{Backup ,b} '..callback.name,'lg')
          setPluginStatus('delete', callback.name)
          app.answerCallbackQuery(msg.id, '• Plugin '..callback.name..' SuccessFully Removed !', true)
        end
        local reply_markup = controllPlugins(callback.ID, plugins_info.all)
        local plugins_info = setPluginStatus('load')
        app.editMessageText(msg.chat_id, msg.message_id, '• [ '..plugins_info.all..' ] Total Plugins Found 🔍\n✅ %{Active, c} : [ '..plugins_info.active..' ]\n⚠️ %{DeActive, c} : [ '..plugins_info.deactive..' ]', 'lg', true, false, reply_markup)
      end

      if callback._ == 'delPlugin' and callback.name and callback.ID then
        local reply_markup = app.replyMarkup{
          type = 'inline',
          data = {
            {
              {text = 'Yes , %100' , data = create_callback('_', 'finalDelete', 'name', callback.name, 'ID', callback.ID)}
            },
            {
              {text = '◄ Back' , data = create_callback('_', 'Plugins', 'ID', callback.ID)}
            }
          }
        }
        app.editMessageText(msg.chat_id, msg.message_id,  '%{Are you sure you want to remove the, b} [ '..callback.name..' ] %{plugin, b} ?', 'lg', true, false, reply_markup)
      end

      if callback._ == 'Plugins' and callback.ID then
        local reply_markup = controllPlugins(callback.ID, plugins_info.all)
        app.editMessageText(msg.chat_id, msg.message_id, '• [ '..plugins_info.all..' ] Total Plugins Found 🔍\n✅ %{Active, c} : [ '..plugins_info.active..' ]\n⚠️ %{DeActive, c} : [ '..plugins_info.deactive..' ]', 'lg', true, false, reply_markup)
      end

      if callback._ == 'Menu'then
        local reply_markup = app.replyMarkup{
          type = 'inline',
          data = {
            {
              {text = '• Plugin Manager', data = create_callback('_', 'Plugins', 'ID', 1)}
            },
            {
              {text = '• Add Plugin', data = create_callback('_', 'AddHelp')}
            },
            {
              {text = 'Close', data = create_callback('_', 'Close')},
            }
          }
        }
        app.editMessageText(msg.chat_id, msg.message_id,  '• [ '..plugins_info.all..' ] Total Plugins Found 🔍\n✅ %{Active, c} : [ '..plugins_info.active..' ]\n⚠️ %{DeActive, c} : [ '..plugins_info.deactive..' ]', 'lg', true, false, reply_markup)
      end
    end
  end
end
local filter_update = {
  'updateNewMessage',
  'updateNewCallbackQuery'
}
app.add_events(ManagePlugins,filter_update)
--/////////////////////////////////////////-- base
function main(update)
  for plugin_path, value in pairs(config.plugins) do
    if value.active then
      local plugin = loadfile(plugin_path)()
      if (update.luagram and plugin.filters and app.in_array(plugin.filters,  update.luagram)) or not plugin.filters then
        xpcall(plugin.run, print, update)
      end
    end
  end
end
luagram.run(main)
