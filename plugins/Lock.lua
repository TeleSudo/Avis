-- By @Abolfazl_le / @LuaError 
function run(msg)
if msg.message then
if app.chat_type(msg.chat_id) == 'is_supergroup'  then
local msg = msg.message
local UserInfo = app.getUser(msg.sender_user_id)
if msg.content.text then
local input = msg.content.text.text
local text = (input or '')
if rank(msg.sender_user_id,msg.chat_id) <= 4 then
if text:match('^[Ll][Oo][Cc][Kk] (.*)$') or text:match('^قفل (.*)$') then
local text2 = text:match('^[Ll][Oo][Cc][Kk] (.*)$') or text:match('^قفل (.*)$')
-----LINK
if text2:match('^[Ll][Ii][Nn][Kk]$') or text2:match('^لینک$') then
if db:get(msg.chat_id..'Lock:Link') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟɪɴᴋ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لینک از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Link','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟɪɴᴋ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لینک فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----FORWARD
if text2:match('^[Ff][Oo][Rr][Ww][Aa][Rr][Dd]$') or text2:match('^فوروارد$') then
if db:get(msg.chat_id..'Lock:Forward') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴏʀᴡᴀʀᴅ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فوروارد از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Forward','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴏʀᴡᴀʀᴅ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فوروارد فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----MENTION
if text2:match('^[Mm][Ee][Nn][Tt][Ii][Oo][Nn]$') or text2:match('^منشن$') then
if db:get(msg.chat_id..'Lock:Mention') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴍᴇɴᴛɪᴏɴ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل منشن از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Mention','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴍᴇɴᴛɪᴏɴ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل منشن فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----Username
if text2:match('^[Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]$') or text2:match('^یوزرنیم$') then
if db:get(msg.chat_id..'Lock:Username') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴜꜱᴇʀɴᴀᴍᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل یوزرنیم از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Username','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴜꜱᴇʀɴᴀᴍᴇ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل یوزرنیم فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----TAG
if text2:match('^[Tt][Aa][Gg]$') or text2:match('^تگ$') then
if db:get(msg.chat_id..'Lock:Tag') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴀɢ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل تگ از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Tag','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴀɢ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل تگ فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----WEB
if text2:match('^[Ww][Ee][Bb]$') or text2:match('^وب$') then
if db:get(msg.chat_id..'Lock:Web') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴡᴇʙꜱɪᴛᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل وب از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Web','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴡᴇʙꜱɪᴛᴇ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل وب فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----JOIN
if text2:match('^[Jj][Oo][Ii][Nn]$') or text2:match('^ورود$') then
if db:get(msg.chat_id..'Lock:Join') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴊᴏɪɴ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ورود از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Join','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴊᴏɪɴ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ورود فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----TGSERVICE
if text2:match('^[Tt][Gg][Ss][Ee][Rr][Vv][Ii][Cc][Ee]$') or text2:match('^سرویس تلگرام$') then
if db:get(msg.chat_id..'Lock:TgService') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛɢꜱᴇʀᴠɪᴄᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سرویس تلگرام از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:TgService','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛɢꜱᴇʀᴠɪᴄᴇ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سرویس تلگرام فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----RoBot
if text2:match('^[Bb][Oo][Tt]$') or text2:match('^ربات$') then
if db:get(msg.chat_id..'Lock:Bot') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʀᴏʙᴏᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ربات از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Bot','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʀᴏʙᴏᴛ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ربات فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----LOCATION
if text2:match('^[Ll][Oo][Cc][Aa][Tt][Ii][Oo][Nn]$') or text2:match('^لوکیشن$') then
if db:get(msg.chat_id..'Lock:Location') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟᴏᴄᴀᴛɪᴏɴ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لوکیشن از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Location','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟᴏᴄᴀᴛɪᴏɴ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لوکیشن فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----INLINE
if text2:match('^[Ii][Nn][Ll][Ii][Nn][Ee]$') or text2:match('^اینلاین$') then
if db:get(msg.chat_id..'Lock:Inline') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɪɴʟɪɴᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل اینلاین از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Inline','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɪɴʟɪɴᴇ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل اینلاین فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----FARSI
if text2:match('^[Ff][Aa][Rr][Ss][Ii]$') or text2:match('^فارسی$') then
if db:get(msg.chat_id..'Lock:Farsi') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴀʀꜱɪ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فارسی از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Farsi','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴀʀꜱɪ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فارسی فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----ENGLISH
if text2:match('^[Ee][Nn][Gg][Ll][Ii][Ss][Hh]$') or text2:match('^انگلیسی$') then
if db:get(msg.chat_id..'Lock:English') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴇɴɢʟɪꜱʜ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل انگلیسی از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:English','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴇɴɢʟɪꜱʜ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل انگلیسی فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----PHOTO
if text2:match('^[Pp][Hh][Oo][Tt][Oo]$') or text2:match('^عکس$') then
if db:get(msg.chat_id..'Lock:Photo') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘʜᴏᴛᴏ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل عکس از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Photo','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘʜᴏᴛᴏ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل عکس فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----VIDEO
if text2:match('^[Vv][Ii][Dd][Ee][Oo]$') or text2:match('^ویدیو$') then
if db:get(msg.chat_id..'Lock:Video') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠɪᴅᴇᴏ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویدیو از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Video','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠɪᴅᴇᴏ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویدیو فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----GIF
if text2:match('^[Gg][Ii][Ff]$') or text2:match('^گیف$') then
if db:get(msg.chat_id..'Lock:Gif') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢɪꜰ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل گیف از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Gif','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢɪꜰ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل گیف فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----STICKER
if text2:match('^[Ss][Tt][Ii][Cc][Kk][Ee][Rr]$') or text2:match('^استیکر$') then
if db:get(msg.chat_id..'Lock:Sticker') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴛɪᴄᴋᴇʀ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل استیکر از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Sticker','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴛɪᴄᴋᴇʀ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل استیکر فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----VOICE
if text2:match('^[Vv][Oo][Ii][Cc][Ee]$') or text2:match('^ویس$') then
if db:get(msg.chat_id..'Lock:Voice') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠᴏɪᴄᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویس از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Voice','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠᴏɪᴄᴇ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویس فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----AUDIO
if text2:match('^[Aa][Uu][Dd][Ii][Oo]$') or text2:match('^اهنگ$') then
if db:get(msg.chat_id..'Lock:Audio') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴀᴜᴅɪᴏ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل آهنگ از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Audio','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴀᴜᴅɪᴏ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل آهنگ فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----TEXT
if text2:match('^[Tt][Ee][Xx][Tt]$') or text2:match('^متن$') then
if db:get(msg.chat_id..'Lock:Text') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴇxᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل متن از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Text','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴇxᴛ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل متن فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----GAME
if text2:match('^[Gg][Aa][Mm][Ee]$') or text2:match('^بازی$') then
if db:get(msg.chat_id..'Lock:Game') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢᴀᴍᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل بازی از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Game','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢᴀᴍᴇ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل بازی فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----CONTACT
if text2:match('^[Cc][Oo][Nn][Tt][Aa][Cc][Tt]$') or text2:match('^مخاطبین$') then
if db:get(msg.chat_id..'Lock:Contact') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴄᴏɴᴛᴀᴄᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل مخاطبین از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Contact','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴄᴏɴᴛᴀᴄᴛ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل مخاطبین فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----VIDEONOTE
if text2:match('^[Ss][Ee][Ll][Ff][Ii]$') or text2:match('^سلفی$') then
if db:get(msg.chat_id..'Lock:VideoNote') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴇʟꜰɪ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سلفی از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:VideoNote','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴇʟꜰɪ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سلفی فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----DOCUMENT
if text2:match('^[Dd][Oo][Cc][Uu][Mm][Ee][Nn][Tt]$') or text2:match('^فایل$') then
if db:get(msg.chat_id..'Lock:Document') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴅᴏᴄᴜᴍᴇɴᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فایل از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Document','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴅᴏᴄᴜᴍᴇɴᴛ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فایل فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
----POLL
if text2:match('^[Pp][Oo][Ll][Ll]$') or text2:match('^نظرسنجی$') then
if db:get(msg.chat_id..'Lock:Poll') == 'yes' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘᴏʟʟ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل نظرسنجی از قبل فعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Poll','yes')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘᴏʟʟ ɪꜱ ᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل نظرسنجی فعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end


end -- End OF LOCK
--------------------------------------------------
    ---------------U N L O C K ---------------
--------------------------------------------------

if text:match('^[Uu][Nn][Ll][Oo][Cc][Kk] (.*)$') or text:match('^بازکردن (.*)$') then
local text2 = text:match('^[Uu][Nn][Ll][Oo][Cc][Kk] (.*)$') or text:match('^بازکردن (.*)$')
-----LINK
if text2:match('^[Ll][Ii][Nn][Kk]$') or text2:match('^لینک$') then
if db:get(msg.chat_id..'Lock:Link') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟɪɴᴋ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لینک از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Link','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟɪɴᴋ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لینک غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----FORWARD
if text2:match('^[Ff][Oo][Rr][Ww][Aa][Rr][Dd]$') or text2:match('^فوروارد$') then
if db:get(msg.chat_id..'Lock:Forward') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴏʀᴡᴀʀᴅ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فوروارد از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Forward','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴏʀᴡᴀʀᴅ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فوروارد غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----MENTION
if text2:match('^[Mm][Ee][Nn][Tt][Ii][Oo][Nn]$') or text2:match('^منشن$') then
if db:get(msg.chat_id..'Lock:Mention') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴍᴇɴᴛɪᴏɴ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل منشن از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Mention','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴍᴇɴᴛɪᴏɴ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل منشن غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----Username
if text2:match('^[Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]$') or text2:match('^یوزرنیم$') then
if db:get(msg.chat_id..'Lock:Username') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴜꜱᴇʀɴᴀᴍᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل یوزرنیم از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Username','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴜꜱᴇʀɴᴀᴍᴇ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل یوزرنیم غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----TAG
if text2:match('^[Tt][Aa][Gg]$') or text2:match('^تگ$') then
if db:get(msg.chat_id..'Lock:Tag') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴀɢ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل تگ از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Tag','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴀɢ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل تگ غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----WEB
if text2:match('^[Ww][Ee][Bb]$') or text2:match('^وب$') then
if db:get(msg.chat_id..'Lock:Web') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴡᴇʙꜱɪᴛᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل وب از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Web','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴡᴇʙꜱɪᴛᴇ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل وب غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----JOIN
if text2:match('^[Jj][Oo][Ii][Nn]$') or text2:match('^ورود$') then
if db:get(msg.chat_id..'Lock:Join') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴊᴏɪɴ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ورود از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Join','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴊᴏɪɴ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ورود غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----TGSERVICE
if text2:match('^[Tt][Gg][Ss][Ee][Rr][Vv][Ii][Cc][Ee]$') or text2:match('^سرویس تلگرام$') then
if db:get(msg.chat_id..'Lock:TgService') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛɢꜱᴇʀᴠɪᴄᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سرویس تلگرام از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:TgService','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛɢꜱᴇʀᴠɪᴄᴇ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سرویس تلگرام غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----RoBot
if text2:match('^[Bb][Oo][Tt]$') or text2:match('^ربات$') then
if db:get(msg.chat_id..'Lock:Bot') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʀᴏʙᴏᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ربات از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Bot','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʀᴏʙᴏᴛ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ربات غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----LOCATION
if text2:match('^[Ll][Oo][Cc][Aa][Tt][Ii][Oo][Nn]$') or text2:match('^لوکیشن$') then
if db:get(msg.chat_id..'Lock:Location') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟᴏᴄᴀᴛɪᴏɴ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لوکیشن از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Location','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ʟᴏᴄᴀᴛɪᴏɴ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل لوکیشن غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----INLINE
if text2:match('^[Ii][Nn][Ll][Ii][Nn][Ee]$') or text2:match('^اینلاین$') then
if db:get(msg.chat_id..'Lock:Inline') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɪɴʟɪɴᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل اینلاین از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Inline','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɪɴʟɪɴᴇ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل اینلاین غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----FARSI
if text2:match('^[Ff][Aa][Rr][Ss][Ii]$') or text2:match('^فارسی$') then
if db:get(msg.chat_id..'Lock:Farsi') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴀʀꜱɪ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فارسی از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Farsi','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜰᴀʀꜱɪ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فارسی غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----ENGLISH
if text2:match('^[Ee][Nn][Gg][Ll][Ii][Ss][Hh]$') or text2:match('^انگلیسی$') then
if db:get(msg.chat_id..'Lock:English') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴇɴɢʟɪꜱʜ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل انگلیسی از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:English','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴇɴɢʟɪꜱʜ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل انگلیسی غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----PHOTO
if text2:match('^[Pp][Hh][Oo][Tt][Oo]$') or text2:match('^عکس$') then
if db:get(msg.chat_id..'Lock:Photo') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘʜᴏᴛᴏ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل عکس از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Photo','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘʜᴏᴛᴏ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل عکس غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----VIDEO
if text2:match('^[Vv][Ii][Dd][Ee][Oo]$') or text2:match('^ویدیو$') then
if db:get(msg.chat_id..'Lock:Video') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠɪᴅᴇᴏ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویدیو از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Video','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠɪᴅᴇᴏ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویدیو غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----GIF
if text2:match('^[Gg][Ii][Ff]$') or text2:match('^گیف$') then
if db:get(msg.chat_id..'Lock:Gif') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢɪꜰ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل گیف از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Gif','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢɪꜰ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل گیف غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----STICKER
if text2:match('^[Ss][Tt][Ii][Cc][Kk][Ee][Rr]$') or text2:match('^استیکر$') then
if db:get(msg.chat_id..'Lock:Sticker') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴛɪᴄᴋᴇʀ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل استیکر از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Sticker','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴛɪᴄᴋᴇʀ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل استیکر غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----VOICE
if text2:match('^[Vv][Oo][Ii][Cc][Ee]$') or text2:match('^ویس$') then
if db:get(msg.chat_id..'Lock:Voice') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠᴏɪᴄᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویس از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Voice','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴠᴏɪᴄᴇ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل ویس غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----AUDIO
if text2:match('^[Aa][Uu][Dd][Ii][Oo]$') or text2:match('^اهنگ$') then
if db:get(msg.chat_id..'Lock:Audio') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴀᴜᴅɪᴏ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل آهنگ از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Audio','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴀᴜᴅɪᴏ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل آهنگ غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----TEXT
if text2:match('^[Tt][Ee][Xx][Tt]$') or text2:match('^متن$') then
if db:get(msg.chat_id..'Lock:Text') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴇxᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل متن از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Text','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴛᴇxᴛ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل متن غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----GAME
if text2:match('^[Gg][Aa][Mm][Ee]$') or text2:match('^بازی$') then
if db:get(msg.chat_id..'Lock:Game') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢᴀᴍᴇ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل بازی از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Game','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ɢᴀᴍᴇ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل بازی غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----CONTACT
if text2:match('^[Cc][Oo][Nn][Tt][Aa][Cc][Tt]$') or text2:match('^مخاطبین$') then
if db:get(msg.chat_id..'Lock:Contact') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴄᴏɴᴛᴀᴄᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل مخاطبین از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Contact','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴄᴏɴᴛᴀᴄᴛ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل مخاطبین غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----VIDEONOTE
if text2:match('^[Ss][Ee][Ll][Ff][Ii]$') or text2:match('^سلفی$') then
if db:get(msg.chat_id..'Lock:VideoNote') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴇʟꜰɪ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سلفی از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:VideoNote','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ꜱᴇʟꜰɪ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل سلفی غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
-----DOCUMENT
if text2:match('^[Dd][Oo][Cc][Uu][Mm][Ee][Nn][Tt]$') or text2:match('^فایل$') then
if db:get(msg.chat_id..'Lock:Document') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴅᴏᴄᴜᴍᴇɴᴛ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فایل از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Document','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴅᴏᴄᴜᴍᴇɴᴛ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل فایل غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
----POLL
if text2:match('^[Pp][Oo][Ll][Ll]$') or text2:match('^نظرسنجی$') then
if db:get(msg.chat_id..'Lock:Poll') == 'no' then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘᴏʟʟ ɪꜱ ᴀʟʀᴇᴀᴅʏ ᴅᴇᴀᴄᴛɪᴠᴇ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل نظرسنجی از قبل غیرفعال بود!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
else
db:set(msg.chat_id..'Lock:Poll','no')
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'📍ʟᴏᴄᴋ ᴘᴏʟʟ ɪꜱ ᴅᴇᴀᴄᴛɪᴠᴇ ɴᴏᴡ!\n👤ᴄᴏᴍᴍᴀɴᴅ ʙʏ '..UserInfo.first_name)
else
app.sendText(msg.chat_id,msg.id,'📍قفل نظرسنجی غیرفعال شد!\n👤ارسال دستور توسط '..UserInfo.first_name)
end
end
end
end -- End OF UNLOCK
end -- Rank
end -- Is_Supergroup
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
