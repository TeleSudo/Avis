-- By @Abolfazl_le / @LuaError
function run(msg)
if msg.message then
local msg = msg.message

if msg.content.luagram == 'messageChatJoinByLink' or msg.content.luagram == 'messageChatAddMembers' then
if db:get(msg.chat_id..'Lock:TgService') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if rank(msg.sender_user_id,msg.chat_id)>= 5 then
if msg.content.text then
local input = msg.content.text.text
local text = (input or '')
if text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://telegram.me/%S+)") or text:match("(https://t.me/%S+)") or text:match("(https://t.me/joinchat/%S+)") then
if db:get(msg.chat_id..'Lock:Link') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if text:match("(https://www.%S+)") or text:match("(http://www.%S+)") or text:match("(www.%S+)") or text:match("(https://%S+)") then
if db:get(msg.chat_id..'Lock:Web') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if text:match("[a-zA-Z]") then
if db:get(msg.chat_id..'Lock:English') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if text:match("[\216-\219][\128-\191]") then
if db:get(msg.chat_id..'Lock:English') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if text:match("#") then
if db:get(msg.chat_id..'Lock:Tag') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if text:match("@") then
if db:get(msg.chat_id..'Lock:Username') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

end

if msg.content.luagram == 'textEntityTypeMentionName' then
if db:get(msg.chat_id..'Lock:Mention') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageText' then
if db:get(msg.chat_id..'Lock:Text') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messagePhoto' then
if db:get(msg.chat_id..'Lock:Photo') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageAnimation' then
if db:get(msg.chat_id..'Lock:Gif') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageVideo' then
if db:get(msg.chat_id..'Lock:Video') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageVoiceNote' then
if db:get(msg.chat_id..'Lock:Voice') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == "messageVideoNote" then
if db:get(msg.chat_id..'Lock:VideoNote') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageSticker' then
if db:get(msg.chat_id..'Lock:Sticker') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageContact' then
if db:get(msg.chat_id..'Lock:Contact') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageDocument' then
if db:get(msg.chat_id..'Lock:Document') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.forward_info then
if msg.forward_info.origin.luagram == 'messageForwardOriginUser' or msg.forward_info.origin.luagram == 'messageForwardOriginChannel' then
if db:get(msg.chat_id..'Lock:Forward') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
end

if msg.content.luagram == 'messageGame' then
if db:get(msg.chat_id..'Lock:Game') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageLocation' then
if db:get(msg.chat_id..'Lock:Location') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messagePoll' then
if db:get(msg.chat_id..'Lock:Poll') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if tonumber(msg.via_bot_user_id) ~= 0  then
if db:get(msg.chat_id..'Lock:Inline') == 'yes' then
app.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end

if msg.content.luagram == 'messageChatJoinByLink' or msg.content.luagram == 'messageChatAddMembers' then
if db:get(msg.chat_id..'Lock:Join') == 'yes' then
app.setChatMemberStatus(msg.chat_id,msg.sender_user_id,'banned')
end
end
end -- Rank
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