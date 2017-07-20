 function run(msg, matches) 
if matches[1] == "openchat" and is_sudo(msg) then 
local chat = redis:smembers('su')
  for i=1, #chat do
  tdcli.openChat(chat[i])
  end
  --tdcli.sendMessage(msg.chat_id_, msg.id_, 1,"گروه ها بازنگری شدند" 1,'md')  
  tdcli.sendMessage(msg.chat_id_, msg.id_, 1,"*reloaded chat*", 1, 'md')     
  end
  end

return { 
  patterns = {"^[!/#](openchat)$"}, 
run = run 
}