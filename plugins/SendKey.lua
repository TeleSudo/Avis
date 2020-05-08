-- By @Abolfazl_le / @LuaError
HelpMessage = dofile('./data/Help.lua')
local function main(update)
if update.message then
local msg = update.message
if msg.content.luagram == 'messageSticker' then
db:incr(msg.chat_id..'Sticker:Num')
end
--------------
if msg.content.luagram == 'messagePhoto' then
db:incr(msg.chat_id..'Photo:Num')
end
--------------
if msg.content.luagram == 'messageVoiceNote' then
db:incr(msg.chat_id..'Voice:Num')
end
--------------
if msg.content.luagram == 'messageAnimation' then
db:incr(msg.chat_id..'Gif:Num')
end
--------------
if msg.content.luagram == 'messageVideo' then
db:incr(msg.chat_id..'Video:Num')
end
--------------
if msg.content.luagram == 'messageChatAddMembers' or  msg.content.luagram == 'messageChatJoinByLink' then
db:incr(msg.chat_id..'Add:Num')
end
--------------
if msg.content.luagram == 'messageChatDeleteMember' then
db:incr(msg.chat_id..'Rem:Num')
end
--------------
if msg.content.text then
if msg.content.text.text then
db:incr(msg.chat_id..'Text:Num')
end
end
--------------
if msg.content.text then
if app.chat_type(msg.chat_id) == 'is_supergroup'  then
local input = msg.content.text.text
local text = (input or '')
if rank(msg.sender_user_id,msg.chat_id) <= 4 then
if text:match('^[Pp][Aa][Nn][Ee][Ll]$') or text:match('^پنل$') then
local gpinfo = app.getSupergroupFullInfo(msg.chat_id)
if gpinfo.administrator_count == 0 then
app.sendText(msg.chat_id,msg.id,'𝐏𝐥𝐞𝐚𝐬𝐞 𝐀𝐝𝐦𝐢𝐧 𝐌𝐞 𝐅𝐢𝐫𝐬𝐭 𝐓𝐨 𝐔𝐬𝐞 𝐌𝐞.\nلطفا مرا ادمین کنید')
else
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
app.sendText(msg.chat_id, msg.id, '🇮🇷 𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐑𝐨𝐛𝐨𝐭 𝐏𝐚𝐧𝐞𝐥\n 𝐘𝐨𝐮 𝐂𝐚𝐧 𝐂𝐨𝐧𝐭𝐫𝐨𝐥 𝐑𝐨𝐛𝐨𝐭 𝐖𝐢𝐭𝐡 𝐓𝐡𝐢𝐬 𝐏𝐚𝐧𝐞𝐥', 'html', false, false, false, false, reply_markup)
end
end
if text:match('^[Hh][Ee][Ll][Pp]$') or text:match('^راهنما$') then
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
app.sendText(msg.chat_id, msg.id, '🇮🇷 𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐑𝐨𝐛𝐨𝐭 𝐇𝐞𝐥𝐩 𝐏𝐚𝐧𝐞𝐥\n 𝐘𝐨𝐮 𝐂𝐚𝐧 𝐒𝐞𝐞 𝐇𝐞𝐥𝐩 𝐅𝐨𝐫 𝐑𝐨𝐛𝐨𝐭 𝐖𝐢𝐭𝐡 𝐓𝐡𝐢𝐬 𝐏𝐚𝐧𝐞𝐥', 'html', false, false, false, false, reply_markup)
end
if text:match('^[Ss][Tt][Aa][Tt][Uu][Ss]$') or text:match('^وضعیت$') then
local TextNum = db:get(msg.chat_id..'Text:Num') or '0'
local PhotoNum = db:get(msg.chat_id..'Photo:Num') or '0'
local VideoNum = db:get(msg.chat_id..'Video:Num') or '0'
local StickerNum = db:get(msg.chat_id..'Sticker:Num') or '0'
local GifNum = db:get(msg.chat_id..'Gif:Num') or '0'
local VoiceNum = db:get(msg.chat_id..'Voice:Num') or '0'
local AddNum = db:get(msg.chat_id..'Add:Num') or '0'
local DelNum = db:get(msg.chat_id..'Rem:Num') or '0'
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Text Number', data = 'TextNumber'}, {text =(TextNum),  data = 'TextNumberData'}
},
{
{text = '• Photo Number', data = 'PhotoNumber'}, {text =(PhotoNum),  data = 'PhotoNumberData'}
},
{
{text = '• Video Number', data = 'VideoNumber'}, {text =(VideoNum),  data = 'VideoNumberData'}
},
{
{text = '• Sticker Number', data = 'StickerNumber'}, {text =(StickerNum),  data = 'StickerNumberData'}
},
{
{text = '• Gif Number', data = 'GifNumber'}, {text =(GifNum),  data = 'GifNumberData'}
},
{
{text = '• Voice Number', data = 'VoiceNumber'}, {text =(VoiceNum),  data = 'VoiceNumberData'}
},
{
{text = '• New Add Member', data = 'AddNumber'}, {text =(AddNum),  data = 'AddNumberData'}
},
{
{text = '• Left & Kicked Member', data = 'RemNumber'}, {text =(DelNum),  data = 'RemNumberData'}
},
{
{text = '• Close', data = 'Close'},
}
}
}
app.sendText(msg.chat_id, msg.id, '🇮🇷 Welcome To Group Status', 'html', false, false, false, false, reply_markup)
end 
end -- Rank
if text:match('^[Ss][Hh][Ee][Ll][Pp]$') and rank(msg.sender_user_id,msg.chat_id) <=2 then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Close', data = 'Close'}
},
}
}
if db:get(msg.chat_id..'Lang') == 'EN' then
app.sendText(msg.chat_id, msg.id, HelpMessage.HelpSudoEN, 'html', false, false, false, false, reply_markup)
else

app.sendText(msg.chat_id, msg.id, HelpMessage.HelpSudoFA, 'html', false, false, false, false, reply_markup)
end
end

end-- Is_Supergroup

if msg.content.text then
local input = msg.content.text.text
local text = (input or '')
if app.chat_type(msg.chat_id) == 'is_private' then
if text:match('^/[Ss][Tt][Aa][Rr][Tt]$') then
local reply_markup = app.replyMarkup{
type = 'inline',
data = {
{
{text = '• Add Me ➕ ', url = 'http://t.me/'..config.robot_username..'?startgroup=new'}, {text = '• Channel ', url = 'http://t.me/'..config.channel}
},
{
{text = '• Owner ', url = 'http://t.me/'..config.o_username}, {text = '• Support Group ', url = config.gplink}
},
}
}
app.sendText(msg.chat_id,msg.id,'سلام به ربات آنتی اسپم رایگان خوش آمدید \n از طریق دکمه زیر من را به گروه خود اضافه کرده و بعد از آن مرا ادمین کنید!\n فراموش نشود بعد از ادمین کردن کلمه \n config \n را ارسال کنید تا من همه ادمین هارا شناسایی کنم!\n فراموش نشود اول مرا ادمین کنید بعد دستور را ارسال کنید', 'html', false, false, false, false, reply_markup)	
end
end --is_private
end-- ms.content.text

end
end
end
return {
  run = main,
  filters = {
    'updateNewMessage',
    'updateNewChannelMessage'
  }
}
-- By @Abolfazl_le / @LuaError
