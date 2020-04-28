-- By @Abolfazl_le / @LuaError
function run (msg)
if msg.message then
local msg = msg.message
--------------
if msg.content.luagram == 'messageSticker' then
db:incr(msg.chat_id..'Sticker:Num'..msg.sender_user_id)
end
--------------
if msg.content.luagram == 'messagePhoto' then
db:incr(msg.chat_id..'Photo:Num'..msg.sender_user_id)
end
--------------
if msg.content.luagram == 'messageVoiceNote' then
db:incr(msg.chat_id..'Voice:Num'..msg.sender_user_id)
end
--------------
if msg.content.luagram == 'messageAnimation' then
db:incr(msg.chat_id..'Gif:Num'..msg.sender_user_id)
end
--------------
if msg.content.luagram == 'messageVideo' then
db:incr(msg.chat_id..'Video:Num'..msg.sender_user_id)
end
if msg.content.text then
local input = msg.content.text.text
local text = (input or '')
--------------
if msg.content.text.text then
db:incr(msg.chat_id..'Text:Num'..msg.sender_user_id)
end
--------------
if text:match('^[Mm][Ee]$')then
local UserInfo = app.getUser(msg.sender_user_id)
local photo = app.getUserProfilePhotos(msg.sender_user_id)
local TextNum = db:get(msg.chat_id..'Text:Num'..msg.sender_user_id) or 0
local StickerNum = db:get(msg.chat_id..'Sticker:Num'..msg.sender_user_id) or 0
local PhotoNum = db:get(msg.chat_id..'Photo:Num'..msg.sender_user_id) or 0
local VoiceNum = db:get(msg.chat_id..'Voice:Num'..msg.sender_user_id) or 0
local GifNum = db:get(msg.chat_id..'Gif:Num'..msg.sender_user_id) or 0
local VideoNum = db:get(msg.chat_id..'Video:Num'..msg.sender_user_id) or 0
app.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, '▫️Your id:'..msg.sender_user_id..'\n▫️Your Name :'..UserInfo.first_name..'\n▫️Your Username :@'..UserInfo.username..'\n👤Your Message Send\n🔸Text Number :'..TextNum..'\n🔸Sticker Number :'..StickerNum..'\n🔸Photo Number :'..PhotoNum..'\n🔸Video Number :'..VideoNum..'\n🔸Gif Number :'..GifNum..'\n🔸Voice Number :'..VoiceNum)
end
---------------------------------------------------------------
if msg.content.text.text then
db:incr(msg.chat_id..'Gp:TextNum')
end
--------------
if text:match('^[Gg][Pp][Ii][Nn][Ff][Oo]$') then
local gpinfo = app.getSupergroupFullInfo(msg.chat_id)
app.vardump(gpinfo)
print(gpinfo.member_count)
app.sendText(msg.chat_id,msg.id,'❕Your Group Info \n♦️Group ID :'..msg.chat_id..'\n♦️Number Of Member :'..gpinfo.member_count..'\n♦️Number Of Admin :'..gpinfo.administrator_count..'\n♦️Ban Number :'..gpinfo.banned_count..'\n♦️Group Info :'..gpinfo.description)
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