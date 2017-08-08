 function run(msg, matches) 
if matches[1] == "open" and is_sudo(msg) then 
  local text = matches[2]
  tdcli.openChat(text)
  tdcli.sendMessage(msg.chat_id_, msg.id_, 1,"*group "..text.."has been reloaded*", 1, 'md')     
  end
  end

return { 
  patterns = {"^[!/#](open) (.*)$"}, 
run = run 
}
