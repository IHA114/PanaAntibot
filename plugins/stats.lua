
local function cerner(msg, matches)
redis:incr("allmsg")
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not redis:sismember("su",msg.chat_id_) then
redis:sadd("su",msg.chat_id_)
end
elseif id:match('-(%d+)') then
if not redis:sismember("gp",msg.chat_id_) then
redis:sadd("gp",msg.chat_id_)
end
elseif id:match('') then
if not redis:sismember("user",msg.chat_id_) then
redis:sadd("user",msg.chat_id_)
end
end
end
if matches[1] == 'stats' and is_sudo(msg) then
-------------------------------------------------
local allmsg = redis:get("allmsg")
-------------------------------------------------
local gps = redis:scard("su")
-------------------------------------------------
local gp = redis:scard("gp")
-------------------------------------------------
local user = redis:scard("user")
-------------------------------------------------
       return '>گزارش ربات: \n\n> تمام پیام های دریافتی : '..allmsg..'\n\n> تعداد سوپر گروه ها : '..gps..'\n\n> تعداد گروه ها : '..gp..'\n\n> کاربران پیوی: '..user..'\n'
end
if matches[1] == 'reset' and is_sudo(msg) then
redis:del("allmsg")
redis:del("su")
redis:del("gp")
redis:del("user")

return "has been reset"
end
end
return {
patterns ={ 
"^[/](stats)$",
"^[/](reset)$",
"(.*)",
}, 
  run = cerner
}

      