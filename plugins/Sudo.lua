-- By @Abolfazl_le / @LuaError
function run(msg)
if msg.message then
local msg = msg.message
if msg.content.text then
local input = msg.content.text.text
local text = (input or '')
if rank(msg.sender_user_id,msg.chat_id)<=2 then
if text:match('^[Bb][Oo][Tt] [Ss][Tt][Aa][Tt][Uu][Ss]$') or text:match('^آمار ربات$') then
local PrivateChat = tostring(db:scard('pv')) 
local GroupChat = tostring(db:scard('group'))
local SuperGroupChat = tostring(db:scard('supergroup'))
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Private Number', data = 'PVNumber'}, {text =(PrivateChat),  data = 'PrivateNumberData'}
},
{
{text = '• Group Number', data = 'GroupNumber'}, {text =(GroupChat),  data = 'GroupNumberData'}
},
{
{text = '• SuperGroup Number', data = 'SuperGroupNumber'}, {text =(SuperGroupChat),  data = 'SuperGroupNumberData'}
},
{
{text = '• Close', data = 'Close'},
}
}
}
app.sendText(msg.chat_id, msg.id, '🇮🇷 Welcome To Robot Status', 'html', false, false, false, false, reply_markup)
end
if msg.reply_to_message_id then
if text:match('^[Aa][Dd][Dd][Ss][Uu][Dd][Oo]$') or text:match('^افزودن مالک$') then
local Message = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDSudo = Message.sender_user_id
if db:sismember(config.session_name .. 'sudos',UserIDSudo) then
app.sendText(msg.chat_id,msg.id,'User '..UserIDSudo..'ALlready Is Sudo')
else
db:sadd(config.session_name .. 'sudos',UserIDSudo)
app.sendText(msg.chat_id,msg.id,'User '..UserIDSudo..' Added To Sudo')
end
end
if text:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo]$') or text:match('^حذف مالک$') then
local Message = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDSudo = Message.sender_user_id
if not db:sismember(config.session_name .. 'sudos',UserIDSudo) then
app.sendText(msg.chat_id,msg.id,'User '..UserIDSudo..' Not In SudoList To Remove')
else
db:srem(config.session_name .. 'sudos',UserIDSudo)
app.sendText(msg.chat_id,msg.id,'User '..UserIDSudo..' Rem From Sudo')
end
end
if text:match('^[Ss][Ee][Nn][Dd]$')  or text:match('^ارسال$')then
local dbNumber = db:smembers('Robot:GroupList')
for key, value in pairs(dbNumber) do
app.forwardMessages(value, msg.chat_id, msg.reply_to_message_id, nil, nil, nil, true)
end
end
if text:match('^[Ff][Oo][Rr][Ww][Aa][Rr][Dd]$') or text:match('^فوروارد$') then
local dbNumber = db:smembers('Robot:GroupList')
for key, value in pairs(dbNumber) do
app.forwardMessages(value, msg.chat_id, msg.reply_to_message_id, nil, nil, nil, false)
end
end
end -- Reply
-------------------------------------------

end -- Rank
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
