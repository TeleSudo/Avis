-- By @Abolfazl_le / @LuaError
function run(msg)
if msg.message then
local msg = msg.message
if msg.content.text then
if msg.content.text.text == 'ping' then
app.sendText(msg.chat_id, msg.id, 'pong')
end
end
end
end
return {
  run = run, 
  filters = {
    'updateNewMessage',
    'updateNewChannelMessage'
  }
}
-- By @Abolfazl_le / @LuaError