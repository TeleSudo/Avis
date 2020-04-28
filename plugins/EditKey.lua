-- By @Abolfazl_le / @LuaError
HelpMessage = dofile('./data/Help.lua')
local function main(msg)
if msg.payload and msg.payload.data then
local callback = app.base64_decode(msg.payload.data)
--------------------------------------------------------
app.answerCallbackQuery(callback_query_id, text, show_alert)
if string.match(callback, '^Lock (%S+)$') then 
local lock_name = string.match(callback, '^Lock (%S+)$')
if db:get(msg.chat_id..'Lock:'..lock_name) =='yes' then 
db:set(msg.chat_id..'Lock:'..lock_name,'no')
else
db:set(msg.chat_id..'Lock:'..lock_name,'yes')
end 
callback = 'Locks'
end 
--------------------
if string.match(callback, '^Lock2 (%S+)$') then 
local lock_name = string.match(callback, '^Lock2 (%S+)$')
if db:get(msg.chat_id..'Lock:'..lock_name) =='yes' then 
db:set(msg.chat_id..'Lock:'..lock_name,'no')
else
db:set(msg.chat_id..'Lock:'..lock_name,'yes')
end 
callback = 'Locks2'
end 
--------------------
if string.match(callback, '^Mute (%S+)$') then 
local lock_name = string.match(callback, '^Mute (%S+)$')
if db:get(msg.chat_id..'Lock:'..lock_name) =='yes' then 
db:set(msg.chat_id..'Lock:'..lock_name,'no')
else
db:set(msg.chat_id..'Lock:'..lock_name,'yes')
end 
callback = 'Mutes'
end
--------------------------------------------------------
if callback == 'Panel' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Locks', data = 'Locks'}, {text = '• Media',  data = 'Mutes'}
},
{
{text = '• Filters',  data = 'Filters'}, {text = '• Force Add',  data = 'ForceAdd'}
},
{
{text = '• Spam Settings',  data = 'SpamS'}, {text = '• Welcome',  data = 'Welcome'}
},
{
{text = '• ALL List',  data = 'Lists'}, {text = '• Support',  data = 'Support'}
},
{
{text = 'Close',  data = 'Close'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  '🇮🇷 𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐑𝐨𝐛𝐨𝐭 𝐏𝐚𝐧𝐞𝐥\n 𝐘𝐨𝐮 𝐂𝐚𝐧 𝐂𝐨𝐧𝐭𝐫𝐨𝐥 𝐑𝐨𝐛𝐨𝐭 𝐖𝐢𝐭𝐡 𝐓𝐡𝐢𝐬 𝐏𝐚𝐧𝐞𝐥', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Help' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Lock', data = 'LockHelp'}, {text = '• UnLock',  data = 'UnLockHelp'}
},
{
{text = '• Base', data = 'BaseHelp'}, {text = '• Fun',  data = 'FunHelp'}
},
{
{text = 'Close',  data = 'Close'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id, '🇮🇷 𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐑𝐨𝐛𝐨𝐭 𝐇𝐞𝐥𝐩 𝐏𝐚𝐧𝐞𝐥\n 𝐘𝐨𝐮 𝐂𝐚𝐧 𝐒𝐞𝐞 𝐇𝐞𝐥𝐩 𝐅𝐨𝐫 𝐑𝐨𝐛𝐨𝐭 𝐖𝐢𝐭𝐡 𝐓𝐡𝐢𝐬 𝐏𝐚𝐧𝐞𝐥' , 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == "Close" and rank(msg.sender_user_id,msg.chat_id) <= 4 then
app.editMessageText(msg.chat_id, msg.message_id,  '• 𝑮𝒐𝒐𝒅𝒃𝒚𝒆', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Lists' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Owners List', data = 'OwnersList'}, {text = '• Admins List',  data = 'AdminList'}
},
{
{text = '• Vip List',  data = 'VipList'}
},
{
{text = '• Ban List', data = 'BanList'}, {text = '• Mute List',  data = 'MuteList'}
},
{
{text = 'Back',  data = 'Panel'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  '🇮🇷 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑳𝒊𝒔𝒕𝒔 𝑷𝒂𝒏𝒆𝒍 \n 𝒀𝒐𝒖 𝑪𝒂𝒏 𝑪𝒐𝒏𝒕𝒓𝒐𝒍 𝑨𝒍𝒍 𝑮𝒓𝒐𝒖𝒑 𝑳𝒊𝒔𝒕 𝑭𝒓𝒐𝒎 𝑯𝒆𝒓𝒆', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'OwnersList' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local res = {}
local OwnerListD = db:smembers(config.session_name .. 'owners'.. msg.chat_id)
if #OwnerListD == 0 then
OwnersText = ''
else
for key, value in pairs(OwnerListD) do 
local user = app.getUser(value)
table.insert(res, user.user_name or user.first_name)
OwnersText = table.concat(res, '\n')
end 
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'OwnerClear'}, 
},
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  '𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑶𝒘𝒏𝒆𝒓𝒔 𝑳𝒊𝒔𝒕 𝑶𝒇 𝑮𝒓𝒐𝒖𝒑 \n 𝑯𝒆𝒓𝒆 𝒀𝒐𝒖 𝑪𝒂𝒏 𝑺𝒆𝒆 𝑨𝒍𝒍 𝑶𝒘𝒏𝒆𝒓𝒔/𝑶𝒘𝒏𝒆𝒓 \n 𝑶𝒘𝒏𝒆𝒓/𝑶𝒘𝒏𝒆𝒓𝒔 𝑨𝒓𝒆 \n\n'..OwnersText, 'html', false, false, reply_markup)
end

------------------------
if callback == 'AdminList' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local res = {}
local ListAdminsD = db:smembers(config.session_name .. 'admins'.. msg.chat_id)
if #ListAdminsD == 0 then
AdminText = ''
else
for key, value in pairs(ListAdminsD) do 
local user = app.getUser(value)
table.insert(res, user.user_name or user.first_name)
AdminText = table.concat(res, '\n')
end
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'AdminClear'}, 
},
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  '𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑨𝒅𝒎𝒊𝒏𝒔 𝑳𝒊𝒔𝒕 𝑶𝒇 𝑮𝒓𝒐𝒖𝒑 \n 𝑯𝒆𝒓𝒆 𝒀𝒐𝒖 𝑪𝒂𝒏 𝑺𝒆𝒆 𝑨𝒍𝒍 𝑨𝒅𝒎𝒊𝒏/𝑨𝒅𝒎𝒊𝒏𝒔 \n 𝑨𝒅𝒎𝒊𝒏/𝑨𝒅𝒎𝒊𝒏𝒔𝑨𝒓𝒆 \n\n'..AdminText, 'html', false, false, reply_markup)
end
------------------------
if callback == 'VipList' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local res = {}
local ListVIP = db:smembers(msg.chat_id..'Vip:Member')
if #ListVIP == 0 then
VipText = ''
else
for key, value in pairs(ListVIP) do 
local user = app.getUser(value)
table.insert(res, user.user_name or user.first_name)
VipText = table.concat(res, '\n')
end
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'VipClear'}, 
},
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  '𝙒𝙚𝙡𝙘𝙤𝙢𝙚 𝙏𝙤 𝙑𝙞𝙥 𝙇𝙞𝙨𝙩 𝙊𝙛 𝙂𝙧𝙤𝙪𝙥 \n 𝙃𝙚𝙧𝙚 𝙔𝙤𝙪 𝘾𝙖𝙣 𝙎𝙚𝙚 𝘼𝙡𝙡 𝘼𝙙𝙢𝙞𝙣/𝘼𝙙𝙢𝙞𝙣𝙨 \n 𝙑𝙞𝙥/𝙑𝙞𝙥𝙨 𝘼𝙧𝙚 \n\n'..VipText, 'html', false, false, reply_markup)
end
------------------------
if callback == 'BanList' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local res = {}
local ListBan = db:smembers(msg.chat_id..'Ban:Member')
if #ListBan == 0 then
TextBan = ''
else
for key, value in pairs(ListBan) do 
local user = app.getUser(value)
table.insert(res, user.user_name or user.first_name)
TextBan = table.concat(res, '\n')
end
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'BanClear'}, 
},
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'All Vip Members Are : \n'..TextBan, 'html', false, false, reply_markup)
end
------------------------
if callback == 'MuteList' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local res = {}
local ListMute = db:smembers(msg.chat_id..'Mute:Member')
if #ListMute == 0 then
MuteText = ''
else
for key, value in pairs(ListMute) do 
local user = app.getUser(value)
table.insert(res, user.user_name or user.first_name)
MuteText = table.concat(res, '\n')
end
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'MuteClear'}, 
},
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'All Mute Members Are : \n'..MuteText, 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'AdminClear' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
db:del(config.session_name .. 'admins'.. msg.chat_id)
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Admins All Cleared', 'html', false, false, reply_markup)
end
------------------------
if callback == 'OwnerClear' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
db:del(config.session_name .. 'owners'.. msg.chat_id)
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Admins All Cleared', 'html', false, false, reply_markup)
end
------------------------
if callback == 'VipClear' and rank(msg.sender_user_id,msg.chat) <= 4 then
db:del(msg.chat_id..'Vip:Member')
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Vip Members Are All Cleared', 'html', false, false, reply_markup)
end
------------------------
if callback == 'BanClear' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
db:del(msg.chat_id..'Ban:Member')
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  ' Ban Member All Cleared', 'html', false, false, reply_markup)
end
------------------------
if callback == 'MuteClear' and rank(msg.sender_user_id,msg.chat_id) <=4 then
db:del(msg.chat_id..'Mute:Member')
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Lists'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Mute Members Are All Cleared', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Welcome' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'GpWelcome') then
WelcomeText = db:get(msg.chat_id..'GpWelcome')
else
WelcomeText = "Not Set Yet"
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'WelcomeClear'}, 
},
{
{text = 'Back',  data = 'Panel'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Group Welcome Message : \n'..WelcomeText, 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Filters' and rank(msg.sender_user_id,msg.chat_id) <= 4 then
local FilterText = 'List Of Filter :\n'
local ListFilter = db:smembers(msg.chat_id..'Filter:Word')
for key, value in pairs(ListFilter) do
FilterText = FilterText..key.." - "..value.." \n"
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Clear', data = 'FilterClear'}, 
},
{
{text = 'Back',  data = 'Panel'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,FilterText, 'html', false, false, reply_markup)
end
-----------------------
if callback == 'FilterClear' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
db:del(msg.chat_id..'Filter:Word')
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Panel'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'All Filter Word Cleared!', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Locks' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lock:Link') =='yes' then
lock_link = "ON"
else
lock_link = "OFF"
end
if db:get(msg.chat_id..'Lock:Forward') =='yes' then
lock_forward = "ON"
else
lock_forward = "OFF"
end
if db:get(msg.chat_id..'Lock:Mention') =='yes' then
lock_mention = "ON"
else
lock_mention = "OFF"
end
if db:get(msg.chat_id..'Lock:Username') =='yes' then
lock_username = "ON"
else
lock_username = "OFF"
end
if db:get(msg.chat_id..'Lock:Tag') =='yes' then
lock_tag = "ON"
else
lock_tag = "OFF"
end
if db:get(msg.chat_id..'Lock:Web') =='yes' then
lock_web = "ON"
else
lock_web = "OFF"
end
if db:get(msg.chat_id..'Lock:Join') =='yes' then
lock_join = "ON"
else
lock_join = "OFF"
end
if db:get(msg.chat_id..'Lock:TgService') =='yes' then
lock_tgservice = "ON"
else
lock_tgservice = "OFF"
end
if db:get(msg.chat_id..'Lock:Bot') =='yes' then
lock_bot = "ON"
else
lock_bot = "OFF"
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Lock Link : ', data = 'Lock LinkData'},{text =(lock_link), data = 'Lock Link'}
},
{
{text = '• Lock Forward :',  data = 'Lock ForwardData'},{text =(lock_forward), data = 'Lock Forward'}
},
{
{text = '• Lock Mention :',  data = 'Lock MentionData'},{text =(lock_mention), data = 'Lock Mention'}
},
{
{text = '• Lock Username :',  data = 'Lock UsernameData'},{text =(lock_username), data = 'Lock Username'}
},
{
{text = '• Lock Tag :',  data = 'Lock TagData'},{text =(lock_tag), data = 'Lock Tag'}
},
{
{text = '• Lock Web :',  data = 'Lock WebData'},{text =(lock_web), data = 'Lock Web'}
},
{
{text = '• Lock Join :',  data = 'Lock JoinData'},{text =(lock_join), data = 'Lock Join'}
},
{
{text = '• Lock TgService :',  data = 'Lock TgServiceData'},{text =(lock_tgservice), data = 'Lock TgService'}
},
{
{text = '• Lock Bot :',  data = 'Lock BotData'},{text =(lock_bot), data = 'Lock Bot'}
},
{
{text = 'Back', data = 'Panel'}, {text = 'Next', data = 'Locks2'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Lock Menu Page One ', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Locks2' and rank(msg.sender_user_id ,msg.chat_id) <= 4  then
if db:get(msg.chat_id..'Lock:Location') =='yes' then
lock_location = "ON"
else
lock_location = "OFF"
end
if db:get(msg.chat_id..'Lock:Inline') =='yes' then
lock_inline = "ON"
else
lock_inline = "OFF"
end
if db:get(msg.chat_id..'Lock:Farsi') =='yes' then
lock_farsi = "ON"
else
lock_farsi = "OFF"
end
if db:get(msg.chat_id..'Lock:English') =='yes' then
lock_english = "ON"
else
lock_english = "OFF"
end
if db:get(msg.chat_id..'Lock:Poll') =='yes' then
lock_poll = "ON"
else
lock_poll = "OFF"
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Lock Location : ', data = 'Lock LocationData'},{text =(lock_location), data = 'Lock2 Location'}
},
{
{text = '• Lock Inline :',  data = 'Lock InlineData'},{text =(lock_inline), data = 'Lock2 Inline'}
},
{
{text = '• Lock Farsi :',  data = 'Lock FarsiData'},{text =(lock_farsi), data = 'Lock2 Farsi'}
},
{
{text = '• Lock English :',  data = 'Lock EnglishData'},{text =(lock_english), data = 'Lock2 English'}
},
{
{text = '• Lock Poll :',  data = 'Lock PollData'},{text =(lock_poll), data = 'Lock2 Poll'}
},
{
{text = 'Back', data = 'Locks'}, {text = 'First Page', data = 'Panel'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Lock Menu Page 2 ', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'Mutes' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
if db:get(msg.chat_id..'Lock:Photo') == "yes" then
mute_photo = "ON"
else
mute_photo = "OFF"
end
if db:get(msg.chat_id..'Lock:Video') == "yes" then
mute_video = "ON"
else
mute_video = "OFF"
end
if db:get(msg.chat_id..'Lock:Gif') == "yes" then
mute_gif = "ON"
else
mute_gif = "OFF"
end
if db:get(msg.chat_id..'Lock:Sticker') == "yes" then
mute_sticker = "ON"
else
mute_sticker = "OFF"
end
if db:get(msg.chat_id..'Lock:Voice') == "yes" then
mute_voice = "ON"
else
mute_voice = "OFF"
end
if db:get(msg.chat_id..'Lock:Audio') == "yes" then
mute_audio = "ON"
else
mute_audio = "OFF"
end
if db:get(msg.chat_id..'Lock:Text') == "yes" then
mute_text = "ON"
else
mute_text = "OFF"
end
if db:get(msg.chat_id..'Lock:Game') == "yes" then
mute_game = "ON"
else
mute_game = "OFF"
end
if db:get(msg.chat_id..'Lock:Contact') == "yes" then
mute_contact = "ON"
else
mute_contact = "OFF"
end
if db:get(msg.chat_id..'Lock:VideoNote') == "yes" then
mute_videonote = "ON"
else
mute_videonote = "OFF"
end
if db:get(msg.chat_id..'Lock:Document') == "yes" then
mute_document = "ON"
else
mute_document = "OFF"
end
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Mute Photo : ', data = 'Mute PhotoData'},{text =(mute_photo), data = 'Mute Photo'}
},
{
{text = '• Mute Video :',  data = 'Mute VideoData'},{text =(mute_video), data = 'Mute Video'}
},
{
{text = '• Mute Gif :',  data = 'Mute GifData'},{text =(mute_gif), data = 'Mute Gif'}
},
{
{text = '• Mute Sticker :',  data = 'Mute StickerData'},{text =(mute_sticker), data = 'Mute Sticker'}
},
{
{text = '• Mute Voice :',  data = 'Mute VoiceData'},{text =(mute_voice), data = 'Mute Voice'}
},
{
{text = '• Mute Audio :',  data = 'Mute AudioData'},{text =(mute_audio), data = 'Mute Audio'}
},
{
{text = '• Mute Text :',  data = 'Mute TextData'},{text =(mute_text), data = 'Mute Text'}
},
{
{text = '• Mute Game :',  data = 'Mute GameData'},{text =(mute_game), data = 'Mute Game'}
},
{
{text = '• Mute Contact :',  data = 'Mute ContactData'},{text =(mute_contact), data = 'Mute Contact'}
},
{
{text = '• Mute VideoNote :',  data = 'Mute VideoNoteData'},{text =(mute_videonote), data = 'Mute VideoNote'}
},
{
{text = '• Mute Document :',  data = 'Mute DocumentData'},{text =(mute_document), data = 'Mute Document'}
},
{
{text = 'Back', data = 'Panel'},
}
}
}
app.editMessageText(msg.chat_id, msg.message_id,  'Mute Panel Page 1', 'html', false, false, reply_markup)
end
--------------------------------------------------------
if callback == 'LockHelp' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Help'},{text = 'Next',  data = 'LockHelp2'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpLockEN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpLockFA, 'html', false, false, reply_markup)
end
end
---------------------------
if callback == 'LockHelp2' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'LockHelp'},{text = 'Next',  data = 'LockHelp3'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpLock2EN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpLock2FA, 'html', false, false, reply_markup)
end
end
---------------------------
if callback == 'LockHelp3' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'LockHelp'},{text = 'Help Menu',  data = 'Help'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpLock3EN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpLock3FA, 'html', false, false, reply_markup)
end
end
----------------------------------------------------------
if callback == 'UnLockHelp' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'Help'},{text = 'Next',  data = 'UnLockHelp2'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpUnLockEN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpUnLockFA, 'html', false, false, reply_markup)
end
end
---------------------------
if callback == 'UnLockHelp2' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'LockHelp'},{text = 'Next',  data = 'UnLockHelp3'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpUnLock2EN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpUnLock2FA, 'html', false, false, reply_markup)
end
end
---------------------------
if callback == 'UnLockHelp3' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Back',  data = 'LockHelp'},{text = 'Help Menu',  data = 'Help'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpUnLock3EN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpUnLock3FA, 'html', false, false, reply_markup)
end
end
---------------------------
if callback == 'BaseHelp' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Help Menu',  data = 'Help'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpBaseEN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpBaseFA, 'html', false, false, reply_markup)
end
end
---------------------------
if callback == 'FunHelp' and rank(msg.sender_user_id ,msg.chat_id) <= 4 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = 'Help Menu',  data = 'Help'}
}
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpFunEN, 'html', false, false, reply_markup)
else
app.editMessageText(msg.chat_id, msg.message_id, HelpMessage.HelpFunFA, 'html', false, false, reply_markup)
end
end
--------------------------------------------------------
if callback == 'Support' and rank(msg.sender_user_id,msg.chat_id)<=4 then
app.answerCallbackQuery(callback_query_id, 'Contact To @LuaErrorTM', show_alert)
end
end
end	  
return {
  run = main,
  filters = {
    'updateNewCallbackQuery'
  }
}
-- By @Abolfazl_le / @LuaError
