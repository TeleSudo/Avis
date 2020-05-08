-- By @Abolfazl_le / @LuaError
function run (msg)
if msg.message then
local msg = msg.message
if app.chat_type(msg.chat_id) == 'is_supergroup'  then
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
if photo.total_count >0 then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, '▫️Your id:'..msg.sender_user_id..'\n▫️Your Name :'..UserInfo.first_name..'\n▫️Your Username :@'..UserInfo.username)
else
app.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, '▫️آیدی شما:'..msg.sender_user_id..'\n▫️نام شما :'..UserInfo.first_name..'\n▫️یوزرنیم شما :@'..UserInfo.username)
end
else
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'▫️Your id:'..msg.sender_user_id..'\n▫️Your Name :'..UserInfo.first_name..'\n▫️Your Username :@'..UserInfo.username)
else
app.sendText(msg.chat_id,msg.id,'▫️آیدی شما:'..msg.sender_user_id..'\n▫️نام شما :'..UserInfo.first_name..'\n▫️یوزرنیم شما :@'..UserInfo.username)
end
end
end
---------------------------------------------------------------
if msg.content.text.text then
db:incr(msg.chat_id..'Gp:TextNum')
end
---------------------------
if text:match('^[Gg][Pp][Ii][Nn][Ff][Oo]$') then
local gpinfo = app.getSupergroupFullInfo(msg.chat_id)
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'❕Your Group Info \n♦️Group ID :'..msg.chat_id..'\n♦️Number Of Member :'..gpinfo.member_count..'\n♦️Number Of Admin :'..gpinfo.administrator_count..'\n♦️Ban Number :'..gpinfo.banned_count..'\n♦️Group Info :'..gpinfo.description)
else
app.sendText(msg.chat_id,msg.id,'❕اطلاعات گروه شما \n♦️ایدی گروه: :'..msg.chat_id..'\n♦️تعداد کاربران گروه :'..gpinfo.member_count..'\n♦️تعداد ادمین ها :'..gpinfo.administrator_count..'\n♦️تعداد کاربران بن شده :'..gpinfo.banned_count..'\n♦️Group Info :'..gpinfo.description)
end
end
---------------------------
if text:match('^[Ii][Nn][Ff][Oo]$') then
local MessageID = msg.sender_user_id
local Rank = db:get(msg.chat_id..'User.Title'..MessageID) or ''
local TextNum = db:get(msg.chat_id..'Text:Num'..msg.sender_user_id) or 0
local StickerNum = db:get(msg.chat_id..'Sticker:Num'..msg.sender_user_id) or 0
local PhotoNum = db:get(msg.chat_id..'Photo:Num'..msg.sender_user_id) or 0
local VoiceNum = db:get(msg.chat_id..'Voice:Num'..msg.sender_user_id) or 0
local GifNum = db:get(msg.chat_id..'Gif:Num'..msg.sender_user_id) or 0
local VideoNum = db:get(msg.chat_id..'Video:Num'..msg.sender_user_id) or 0
local MsgTextEN = '\n🎫Your Title :'..Rank..'\n👤Your Message Send\n🔸Text Number :'..TextNum..'\n🔸Sticker Number :'..StickerNum..'\n🔸Photo Number :'..PhotoNum..'\n🔸Video Number :'..VideoNum..'\n🔸Gif Number :'..GifNum..'\n🔸Voice Number :'..VoiceNum
local MsgTextFA = '\n🎫عنوان شما :'..Rank..'\n👤تعداد مسیج های ارسالی\n🔸تعداد متن :'..TextNum..'\n🔸تعداد استیکر :'..StickerNum..'\n🔸تعداد عکس :'..PhotoNum..'\n🔸تعداد ویدیو :'..VideoNum..'\n🔸تعداد گیف :'..GifNum..'\n🔸تعداد ویس :'..VoiceNum
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,MsgTextEN)
else
app.sendText(msg.chat_id,msg.id,MsgTextFA)
end
end
---------------------------
if msg.reply_to_message_id then
if (text:match('^[Ss][Ee][Tt][Tt][Ii][Tt][Ll][Ee] (.*)$') or text:match('^تنظیم عنوان (.*)$')) and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local Title = text:match('^[Ss][Ee][Tt][Tt][Ii][Tt][Ll][Ee] (.*)$') or text:match('^تنظیم عنوان (.*)$')
local Message = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local MessageID = Message.sender_user_id
db:set(msg.chat_id..'User.Title'..MessageID,Title)
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'Ok User Title Now Set On : '..Title)
else
app.sendText(msg.chat_id,msg.id,'عنوان کاربر به '..Title..' تغییر کرد!')
end

end
end -- Reply

end -- msg.content.text
end -- Is_Supergroup
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
