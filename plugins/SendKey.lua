-- By @Abolfazl_le / @LuaError
local function main(update)
if update.message then
local msg = update.message
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
end -- Rank
end -- Is_Supergroup

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
