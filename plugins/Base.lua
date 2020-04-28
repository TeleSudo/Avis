-- By @Abolfazl_le / @LuaError
function run(msg)
if msg.message then
local msg = msg.message
app.vardump(msg)
if msg.content.luagram == 'messageChatAddMembers' then
if app.in_array(msg.content.member_user_ids, app.getMe().id) then
app.sendText(msg.chat_id,msg.id,'𝐏𝐥𝐞𝐚𝐬𝐞 𝐀𝐝𝐦𝐢𝐧 𝐌𝐞 𝐅𝐢𝐫𝐬𝐭 𝐓𝐨 𝐔𝐬𝐞 𝐌𝐞.\nلطفا من را ادمین کنید')
end 
end
if msg.content.luagram == 'messageChatAddMembers'or msg.content.luagram == 'messageChatJoinByLink' then
if db:get(msg.chat_id..'Welcome:Status') =='On' then
if db:get(msg.chat_id..'GpWelcome') then
local WelcomeMessage = db:get(msg.chat_id..'GpWelcome')
else
if db:get(msg.chat_id..'Lang') == 'EN' then
local WelcomeMessage = '𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐎𝐮𝐫 𝐆𝐫𝐨𝐮𝐩!'
else
local WelcomeMessage = 'به گروه خوش آمدید'
end
app.sendText(msg.chat_id,msg.id,WelcomeMessage)
end
else 
return
end
end
if msg.content.text then
local input = msg.content.text.text
local text = (input or '')
-- SetLanguage
if text:match("^[Ss][Ee][Tt][Ll][Aa][Nn][Gg] (.*)$") or text:match("^تنظیم زبان (.*)$") and rank(msg.sender_user_id,msg.chat_id)<=4 then
local text2 = text:match("^[Ss][Ee][Tt][Ll][Aa][Nn][Gg] (.*)$") or text:match("^تنظیم زبان (.*)$")
if text2:match("^[Pp][Ee][Rr][Ss][Ii][Aa][Nn]$") or text2:match('^فارسی$') then
db:set(msg.chat_id..'Lang','FA')
app.sendText(msg.chat_id,msg.id,'زبان بر روی فارسی قرارگرفت.')
elseif text2:match('^[Ee][Nn][Gg][Ll][Ii][Ss][Hh]$') or text2:match('^انگلیسی$') then
db:set(msg.chat_id..'Lang','EN')
app.sendText(msg.chat_id,msg.id,'𝐋𝐚𝐧𝐠𝐮𝐚𝐠𝐞 𝐒𝐞𝐭 𝐎𝐧 𝐄𝐧𝐠𝐥𝐢𝐬𝐡!')
end
end
-- Config
if text:match('^[Cc][Oo][Nn][Ff][Ii][Gg]$') or text:match('^پیکربندی$') then
local gpinfo = app.getSupergroupFullInfo(msg.chat_id)
if gpinfo.administrator_count == 0 then
if db:get(msg.chat_id..'Lang') == "EN" then
app.sendText(msg.chat_id,msg.id,'𝐏𝐥𝐞𝐚𝐬𝐞 𝐀𝐝𝐦𝐢𝐧 𝐌𝐞 𝐅𝐢𝐫𝐬𝐭 𝐓𝐨 𝐔𝐬𝐞 𝐌𝐞!')
else
app.sendText(msg.chat_id,msg.id,'لطفا اول مرا ادمین کنید')
end
else
for i=1 , tonumber(gpinfo.administrator_count) do
local UserID = app.getChatAdministrators(msg.chat_id)
if UserID.administrators[i].is_owner == false then
db:sadd(config.session_name .. 'admins'.. msg.chat_id, UserID.administrators[i].user_id)
else
db:sadd(config.session_name .. 'owners'.. msg.chat_id, UserID.administrators[i].user_id)
end
end
if db:get(msg.chat_id..'Lang') == "EN" then
app.sendText(msg.chat_id,msg.id,'𝐀𝐥𝐥 𝐀𝐝𝐦𝐢𝐧𝐬 𝐍𝐨𝐰 𝐈𝐬 𝐒𝐞𝐭 . 𝐑𝐞𝐚𝐝𝐲 𝐓𝐨 𝐆𝐨!')
else
app.sendText(msg.chat_id,msg.id,'تمامی ادمین ها در ربات ست شدند')
end
end
end
-- Filter
if text:match('^[Ff][Ii][Ll][Tt][Ee][Rr] (.*)$') or text:match('^فیلتر (.*)$')  and rank(msg.sender_user_id,msg.chat_id)<=4 then
local FilterText = text:match('^[Ff][Ii][Ll][Tt][Ee][Rr] (.*)$') or text:match('^فیلتر (.*)$') 
if db:sismember(msg.chat_id..'Filter:Word',FilterText) then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐨𝐫𝐝 '..FilterText..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐧 𝐅𝐢𝐥𝐭𝐞𝐫𝐋𝐢𝐬𝐭!')
else
app.sendText(msg.chat_id,msg.id,'کلمه '..FilterText..' از قبل در لیست فیلتربود!')
end
else
db:sadd(msg.chat_id..'Filter:Word',FilterText)
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐨𝐫𝐝 '..FilterText..' 𝐀𝐝𝐞𝐝 𝐓𝐨 𝐅𝐢𝐥𝐭𝐞𝐫𝐋𝐢𝐬𝐭!')
else
app.sendText(msg.chat_id,msg.id,'کلمه '..FilterText..'به لیست فیلتر اضافه شد!')
end
end
end
-- RemFilter
if text:match('^[Rr][Ee][Mm][Ff][Ii][Ll][Tt][Ee][Rr] (.*)$') or text:match('^حذف فیلتر (.*)$')  and rank(msg.sender_user_id,msg.chat_id)<=4 then
local FilterText = text:match('^[Ff][Ii][Ll][Tt][Ee][Rr] (.*)$') or text:match('^حذف فیلتر (.*)$') 
if not db:sismember(msg.chat_id..'Filter:Word',FilterText) then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐨𝐫𝐝 '..FilterText..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐍𝐨𝐭 𝐎𝐧 𝐅𝐢𝐥𝐭𝐞𝐫𝐋𝐢𝐬𝐭!')
else
app.sendText(msg.chat_id,msg.id,'کلمه '..FilterText..' از قبل در لیست فیلتر نبود!')
end
else
db:srem(msg.chat_id..'Filter:Word',FilterText)
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐨𝐫𝐝 '..FilterText..' 𝐑𝐞𝐦𝐨𝐯𝐞 𝐅𝐫𝐨𝐦 𝐅𝐢𝐥𝐭𝐞𝐫𝐋𝐢𝐬𝐭!')
else
app.sendText(msg.chat_id,msg.id,'کلمه '..FilterText..' ازلیست فیلتر حذف شد!')
end
end
end
-- SetWelcome
if text:match('^[Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee] (.*)$') or text:match('^تنظیم خوشامدگویی (.*)$')  and rank(msg.sender_user_id,msg.chat_id)<=4 then
local WelcomeText = text:match('^[Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee] (.*)$')or text:match('^تنظیم خوشامدگویی (.*)$')
db:set(msg.chat_id..'GpWelcome')
if db:get(msg.chat_id..'Lang') =='EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐈𝐬 𝐒𝐞𝐭 :\n'..WelcomeText)
else
app.sendText(msg.chat_id,msg.id,'متن خوش آمدگویی ست شد :\n'..WelcomeText)
end
end
-- Pin
if text:match('^[Pp][Ii][Nn]*$') or text:match('^پین$')  and rank(msg.sender_user_id,msg.chat_id)<=4 then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'𝐎𝐤 𝐌𝐞𝐬𝐬𝐚𝐠𝐞 𝐇𝐚𝐬 𝐁𝐞𝐞𝐧 𝐏𝐢𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'پیام پین شد!')
end
app.pinChatMessage(msg.chat_id,msg.reply_to_message_id)
end
-- Unpin
if text:match('^[Uu][Nn][Pp][Ii][Nn]*$') or text:match('^حذف پین$')  and rank(msg.sender_user_id,msg.chat_id)<=4  then
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id,msg.id,'𝐎𝐤 𝐌𝐞𝐬𝐬𝐚𝐠𝐞 𝐇𝐚𝐬 𝐁𝐞𝐞𝐧 𝐔𝐧𝐏𝐢𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'پیام از پین در آمد!')
end
app.unpinChatMessage(msg.chat_id)
end
-- Welcome
if text:match('^[Ww][Ee][Ll][Cc][Oo][Mm][Ee] (.*)$') or text:match('^خوشامدگویی (.*)$')  and rank(msg.sender_user_id,msg.chat_id)<=4 then
local text2 = text:match('^[Ww][Ee][Ll][Cc][Oo][Mm][Ee] (.*)$') or text:match('^خوشامدگویی (.*)$')
if text2:match('^[Oo][Nn]$') then
if db:get(msg.chat_id..'Lang') =='EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐒𝐞𝐭 𝐎𝐧 𝐀𝐜𝐭𝐢𝐯𝐞!')
else
app.sendText(msg.chat_id,msg.id,'پیام خوش آمدگویی فعال شد!')
end
db:set(msg.chat_id..'Welcome:Status','On')
end
if text2:match('^[Oo][Ff][Ff]$') then
if db:get(msg.chat_id..'Lang') =='EN' then
app.sendText(msg.chat_id,msg.id,'𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐒𝐞𝐭 𝐎𝐧 𝐃𝐞𝐀𝐜𝐭𝐢𝐯𝐞!')
else
app.sendText(msg.chat_id,msg.id,'پیام خوش آمدگویی غیرفعال شد!')
end
db:set(msg.chat_id..'Welcome:Status','Off')
end
end
-- Ban
if text:match('^[Bb][Aa][Nn] @(%S+)$') or text:match('^بن @(%S+)$') and rank(msg.sender_user_id,msg.chat_id)<=4then
local UserName = text:match('^[Bb][Aa][Nn] @(%S+)$') or text:match('^بن @(%S+)$')
local UserIDBan = app.searchPublicChat(UserName).id
if rank(UserIDBan,msg.chat_id) <= 5 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐁𝐚𝐧 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی را بن کنم!')
end
else
if db:sismember(msg.chat_id..'Ban:Member',UserIDBan) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐁𝐚𝐧𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' ازقبل بن شده بود!')
end
else
db:sadd(msg.chat_id..'Ban:Member',UserIDBan)
app.setChatMemberStatus(msg.chat_id,UserIDBan,'banned',0)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐈𝐬 𝐁𝐚𝐧𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' بن شد!')
end
end
end
end
-- UnBan
if text:match('^[Uu][Nn][Bb][Aa][Nn] @(%S+)$') or text:match('^حذف بن @(%S+)$') and rank(msg.sender_user_id,msg.chat_id)<=4 then
local UserName = text:match('^[Uu][Nn][Bb][Aa][Nn] @(%S+)$') or text:match('^حذف بن @(%S+)$')
local UserIDBan = app.searchPublicChat(UserName).id
if rank(UserIDBan,msg.chat_id) <= 5 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐔𝐧𝐁𝐚𝐧 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی حذف بن کنم!')
end
else
if not db:sismember(msg.chat_id..'Ban:Member',UserIDBan) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐔𝐧𝐁𝐚𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' ازقبل حذف بن  شده بود!')
end
else
db:srem(msg.chat_id..'Ban:Member',UserIDBan)
app.setChatMemberStatus(msg.chat_id,UserIDBan,'restricted',{1,1,1,0,1,0,1,1,1})
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐈𝐬 𝐔𝐧𝐁𝐚𝐧𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' حذف بن شد!')
end
end
end
end
-- Mute
if text:match('^[Mm][Uu][Tt][Ee] @(%S+)$') or text:match('^سکوت @(%S+)$') and rank(msg.sender_user_id,msg.chat_id)<=4 then
local UserName = text:match('^[Mm][Uu][Tt][Ee] @(%S+)$') or text:match('^سکوت @(%S+)$')
local UserIDMute = app.searchPublicChat(UserName).id
if rank(UserIDMute,msg.chat_id) <= 5 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐌𝐮𝐭𝐞 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی را سکوت کنم!')
end
else
if db:sismember(msg.chat_id..'Mute:Member',UserIDMute) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' ازقبل سکوت شده بود!')
end
else
db:sadd(msg.chat_id..'Mute:Member',UserIDMute)
app.setChatMemberStatus(msg.chat_id,UserIDMute,'restricted',{0,0,0,0,0,0,0,0,0})
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐈𝐬 𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' سکوت شد!')
end
end
end
end
-- UnMute
if text:match('^[Uu][Nn][Mm][Uu][Tt][Ee] @(%S+)$') or text:match('^حذف سکوت @(%S+)$') and rank(msg.sender_user_id,msg.chat_id)<=4 then
local UserName = text:match('^[Uu][Nn][Mm][Uu][Tt][Ee] @(%S+)$') or text:match('^حذف سکوت @(%S+)$')
local UserIDMute = app.searchPublicChat(UserName).id
if rank(UserIDMute,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐔𝐧𝐌𝐮𝐭𝐞 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی حذف سکوت کنم!')
end
else
if not db:sismember(msg.chat_id..'Mute:Member',UserIDMute) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐔𝐧𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' ازقبل حذف سکوت شده بود!')
end
else
db:srem(msg.chat_id..'Mute:Member',UserIDMute)
app.setChatMemberStatus(msg.chat_id,UserIDMute,'restricted',{1,1,0,1,0,1,1,1})
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐈𝐬 𝐔𝐧𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' حذف سکوت شد!')
end
end
end
end
-- VIP
if text:match('^[Ss][Ee][Tt][Vv][Ii][Pp] @(%S+)$') or text:match('^ویژه @(%S+)$') and rank(msg.sender_user_id,msg.chat_id) <=4 then
local UserVipUsername = text:match('^[Ss][Ee][Tt][Vv][Ii][Pp] @(%S+)$') or text:match('^ویژه @(%S+)$')
local UserIDV = app.searchPublicChat(UserVipUsername).id
if rank(UserIDMute,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐒𝐞𝐭𝐕𝐈𝐏 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه را ویژه کنم!')
end
else
if db:sismember(msg.chat_id..'Vip:Member',UserIDV) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserVipUsername..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐕𝐢𝐩!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserVipUsername..' از قبل ویژه میباشد')
end
else
db:sadd(msg.chat_id..'Vip:Member',UserIDV)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserVipUsername..' 𝐈𝐬 𝐕𝐢𝐩 𝐍𝐨𝐰!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserVipUsername..' ویژه شد!')
end
end
end
end
-- RemVIP
if text:match('^[Rr][Ee][Mm][Vv][Ii][Pp] @(%S+)$') or text:match('^حذف ویژه @(%S+)$') and rank(msg.sender_user_id,msg.chat_id) <=4 then
local UserVipUsername = text:match('^[Rr][Ee][Mm][Vv][Ii][Pp] @(%S+)$') or text:match('^حذف ویژه @(%S+)$')
local UserIDV = app.searchPublicChat(UserVipUsername).id
if rank(UserIDMute,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐑𝐞𝐦𝐕𝐈𝐏 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه را حذف ویژه کنم!')
end
else
if not db:sismember(msg.chat_id..'Vip:Member',UserIDV) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserVipUsername..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐍𝐨𝐭 𝐕𝐢𝐩!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserVipUsername..' از قبل ویژه نمیباشد')
end
else
db:srem(msg.chat_id..'Vip:Member',UserIDV)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserVipUsername..' 𝐈𝐬 𝐍𝐨𝐭 𝐕𝐢𝐩 𝐍𝐨𝐰!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserVipUsername..' حذف ویژه شد!')
end
end
end
end
-- Promote
if text:match('^[Pp][Rr][Oo][Mm][Oo][Tt][Ee] @(%S+)$') or text:match('^ترفیع @(%S+)$') and rank(msg.sender_user_id,msg.chat_id) <=3 then
local UserName = text:match('^[Pp][Rr][Oo][Mm][Oo][Tt][Ee] @(%S+)$') or text:match('^ترفیع @(%S+)$')
local UserIDPromote = app.searchPublicChat(UserName).id
if rank(UserIDMute,msg.chat_id) <= 3 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐎𝐰𝐧𝐞𝐫𝐬 𝐎𝐧 𝐀𝐝𝐦𝐢𝐧𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم خودم/سازنده گروه را ادمین کنم!')
end
else
if db:sismember(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐏𝐫𝐨𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' از قبل ترفیع داده شده است')
end
else
db:sadd(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐈𝐬 𝐏𝐫𝐨𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' ترفیع دار شد!')
end
end
end
end
-- Demote
if text:match('^[Dd][Ee][Mm][Oo][Tt][Ee] @(%S+)$') or text:match('^تنزل @(%S+)$') and rank(msg.sender_user_id,msg.chat_id) <=4 then
local UserName = text:match('^[Dd][Ee][Mm][Oo][Tt][Ee] @(%S+)$') or text:match('^تنزل @(%S+)$')
local UserIDPromote = app.searchPublicChat(UserName).id
if not db:sismember(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐃𝐞𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' از قبل تنزل پیدا کرده بود')
end
else
db:srem(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserName..' 𝐈𝐬 𝐃𝐞𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserName..' تنزل پیدا کرد!')
end
end
end

--------------------------------------------------------------------------------------------------------
if msg.reply_to_message_id then
-- Ban
if text:match('^[Bb][Aa][Nn]$') or text:match('^بن$') and rank(msg.sender_user_id,msg.chat_id)<=4then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDBan = MSGSend.sender_user_id
if rank(UserIDBan,msg.chat_id) <= 5 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐁𝐚𝐧 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی را بن کنم!')
end
else
if db:sismember(msg.chat_id..'Ban:Member',UserIDBan) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDBan..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐁𝐚𝐧𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDBan..' ازقبل بن شده بود!')
end
else
db:sadd(msg.chat_id..'Ban:Member',UserIDBan)
app.setChatMemberStatus(msg.chat_id,UserIDBan,'banned',0)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDBan..' 𝐈𝐬 𝐁𝐚𝐧𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDBan..' بن شد!')
end
end
end
end
-- UnBan
if text:match('^[Uu][Nn][Bb][Aa][Nn]$') or text:match('^حذف بن$') and rank(msg.sender_user_id,msg.chat_id)<=4 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDBan = MSGSend.sender_user_id
if rank(UserIDBan,msg.chat_id) <= 5 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐔𝐧𝐁𝐚𝐧 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی حذف بن کنم!')
end
else
if not db:sismember(msg.chat_id..'Ban:Member',UserIDBan) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDBan..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐔𝐧𝐁𝐚𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDBan..' ازقبل حذف بن  شده بود!')
end
else
db:srem(msg.chat_id..'Ban:Member',UserIDBan)
app.setChatMemberStatus(msg.chat_id,UserIDBan,'restricted',{1,1,1,0,1,0,1,1,1})
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDBan..' 𝐈𝐬 𝐔𝐧𝐁𝐚𝐧𝐧𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDBan..' حذف بن شد!')
end
end
end
end
-- Mute
if text:match('^[Mm][Uu][Tt][Ee]$') or text:match('^سکوت$') and rank(msg.sender_user_id,msg.chat_id)<=4 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDMute = MSGSend.sender_user_id
if rank(UserIDMute,msg.chat_id) <= 5 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐌𝐮𝐭𝐞 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی را سکوت کنم!')
end
else
if db:sismember(msg.chat_id..'Mute:Member',UserIDMute) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDMute..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDMute..' ازقبل سکوت شده بود!')
end
else
db:sadd(msg.chat_id..'Mute:Member',UserIDMute)
app.setChatMemberStatus(msg.chat_id,UserIDMute,'restricted',{0,0,0,0,1,0,0,0,0})
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 @'..UserIDMute..' 𝐈𝐬 𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر @'..UserIDMute..' سکوت شد!')
end
end
end
end
-- UnMute
if text:match('^[Uu][Nn][Mm][Uu][Tt][Ee]$') or text:match('^حذف سکوت$') and rank(msg.sender_user_id,msg.chat_id)<=4 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDMute = MSGSend.sender_user_id
if rank(UserIDMute,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐔𝐧𝐌𝐮𝐭𝐞 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬/𝐕𝐢𝐩𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه / ممبرهای وی ای پی حذف سکوت کنم!')
end
else
if not db:sismember(msg.chat_id..'Mute:Member',UserIDMute) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDMute..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐔𝐧𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDMute..' ازقبل حذف سکوت شده بود!')
end
else
db:srem(msg.chat_id..'Mute:Member',UserIDMute)
app.setChatMemberStatus(msg.chat_id,UserIDMute,'restricted',{1,1,0,1,0,1,1,1})
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDMute..' 𝐈𝐬 𝐔𝐧𝐌𝐮𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDMute..' حذف سکوت شد!')
end
end
end
end
-- VIP
if text:match('^[Ss][Ee][Tt][Vv][Ii][Pp]') or text:match('^ویژه$') and rank(msg.sender_user_id,msg.chat_id) <=4 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDV = MSGSend.sender_user_id
if rank(UserIDMute,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐒𝐞𝐭𝐕𝐈𝐏 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه را ویژه کنم!')
end
else
if db:sismember(msg.chat_id..'Vip:Member',UserIDV) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDV..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐕𝐢𝐩!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDV..' از قبل ویژه میباشد')
end
else
db:sadd(msg.chat_id..'Vip:Member',UserIDV)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDV..' 𝐈𝐬 𝐕𝐢𝐩 𝐍𝐨𝐰!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDV..' ویژه شد!')
end
end
end
end
-- RemVIP
if text:match('^[Rr][Ee][Mm][Vv][Ii][Pp]$') or text:match('^حذف ویژه$') and rank(msg.sender_user_id,msg.chat_id) <=4 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDV = MSGSend.sender_user_id
if rank(UserIDMute,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐑𝐞𝐦𝐕𝐈𝐏 𝐀𝐝𝐦𝐢𝐧𝐬/𝐎𝐰𝐧𝐞𝐫𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم ادمین / سازنده گروه را حذف ویژه کنم!')
end
else
if not db:sismember(msg.chat_id..'Vip:Member',UserIDV) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDV..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐍𝐨𝐭 𝐕𝐢𝐩!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDV..' از قبل ویژه نمیباشد')
end
else
db:srem(msg.chat_id..'Vip:Member',UserIDV)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDV..' 𝐈𝐬 𝐍𝐨𝐭 𝐕𝐢𝐩 𝐍𝐨𝐰!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDV..' حذف ویژه شد!')
end
end
end
end
-- Promote
if text:match('^[Pp][Rr][Oo][Mm][Oo][Tt][Ee]$') or text:match('^ترفیع$') and rank(msg.sender_user_id,msg.chat_id) <=3 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDPromote = MSGSend.sender_user_id
if rank(UserIDMute,msg.chat_id) <= 3 then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐈 𝐂𝐚𝐧𝐭 𝐎𝐰𝐧𝐞𝐫𝐬 𝐎𝐧 𝐀𝐝𝐦𝐢𝐧𝐬!')
else
app.sendText(msg.chat_id,msg.id,'من نمیتوانم خودم/سازنده گروه را ادمین کنم!')
end
else
if db:sismember(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDPromote..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐈𝐬 𝐏𝐫𝐨𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDPromote..' از قبل ترفیع داده شده است')
end
else
db:sadd(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDPromote..' 𝐈𝐬 𝐏𝐫𝐨𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDPromote..' ترفیع دار شد!')
end
end
end
end
-- Demote
if text:match('^[Dd][Ee][Mm][Oo][Tt][Ee]$') or text:match('^تنزل$') and rank(msg.sender_user_id,msg.chat_id) <=4 then
local MSGSend = app.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserIDPromote = MSGSend.sender_user_id
if not db:sismember(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote) then
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDPromote..' 𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐃𝐞𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDPromote..' از قبل تنزل پیدا کرده بود')
end
else
db:srem(config.session_name .. 'admins'.. msg.chat_id,UserIDPromote)
if db:get(msg.chat_id..'Lang')=='EN'then
app.sendText(msg.chat_id,msg.id,'𝐎𝐊 𝐔𝐬𝐞𝐫 '..UserIDPromote..' 𝐈𝐬 𝐃𝐞𝐦𝐨𝐭𝐞𝐝!')
else
app.sendText(msg.chat_id,msg.id,'کاربر '..UserIDPromote..' تنزل پیدا کرد!')
end
end
end
end--- Reply
end --msg.content.text
end --msg.message
end --Function

return {
  run = run,
  filters = {
    'updateNewMessage',
    'updateNewChannelMessage',
	'updateEditedMessage'
  }
}
-- By @Abolfazl_le / @LuaError
