--------------------------------------------------------------
------------------<b> Extra Tab Cli </b>----------------------
--------------------------------------------------------------
------------------<i> By @MaQzAfzar </i>----------------------
--------------------------------------------------------------
tdcli = dofile('./bot/extra.lua')
--------------------------------------------------------------
redis = dofile('./libs/redis.lua')
--------------------------------------------------------------
json = dofile('./libs/JSON.lua')
--------------------------------------------------------------
URL = require "socket.url"
--------------------------------------------------------------
serpent = dofile("./libs/serpent.lua")
--------------------------------------------------------------
http = require "socket.http"
--------------------------------------------------------------
https = require "ssl.https"
--------------------------------------------------------------
config_sudo = {411253032,TABCHIapi}
--------------------------------------------------------------
TABCHIapi = 400812946
--------------------------------------------------------------
local full_sudo = 411253032
--------------------------------------------------------------
function dl_cb(arg, data)
end
--------------------------------------------------------------
function is_sudo(msg)
  local var = false
  for v,user in pairs(config_sudo) do
    if user == msg.sender_user_id_ then
      var = true
    end
  end
  return var
end
-------------------------------------------------------------
	  function showedit(msg,data)
         if msg then
  tdcli.viewMessages(msg.chat_id_, {[0] = msg.id_})
      if msg.send_state_.ID == "MessageIsSuccessfullySent" then
      return false 
      end
	if not redis:sismember('all'..TABCHIapi..'id',msg.chat_id_) then
       redis:sadd('all'..TABCHIapi..'id',msg.chat_id_)
end
------------------------------------------------------------
local clock = os.clock
local function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
------------------------------------------------------------
local sleeptime = (redis:get('anwersleeptime') or 2)
------------------------------------------------------------
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
	    print("[ Super Group ]")
        chat_type = 'super'
        elseif id:match('^(%d+)') then
		print("[ Private ]")
        chat_type = 'user'
        else
		print("[ Group ]")
        chat_type = 'group'
        end
      end
-----------------------------------------------------------
 local MSG = msg.content_.text_
	if MSG and MSG:match('[QWERTYUIOPASDFGHJKLZXCVBNM]') then
		MSG = MSG
		end
    if msg.content_.ID == "MessageText" then
	  print("{ TG Texting Notification }")
      msg_type = 'MSG'
    end
    if msg.content_.ID == "MessageChatAddMembers" then
	  print("{ TG Adding Notification }")
      msg_type = 'user'
    end
    if msg.content_.ID == "MessageChatJoinByLink" then
	  print("{ TG Join Notification }")
      msg_type = 'Joins'
    end
   if msg.content_.ID == "MessageDocument" then
        print("{ File Or Document }")
        msg_type = 'Document'
      end
      -------------------------
      if msg.content_.ID == "MessageSticker" then
        print("{ Sticker }")
        msg_type = 'Sticker'
      end
      -------------------------
      if msg.content_.ID == "MessageAudio" then
        print("{ Audio }")
        msg_type = 'Audio'
      end
      -------------------------
      if msg.content_.ID == "MessageVoice" then
        print("{ Voice }")
        msg_type = 'Voice'
      end
      -------------------------
      if msg.content_.ID == "MessageVideo" then
        print("{ Video }")
        msg_type = 'Video'
      end
      -------------------------
      if msg.content_.ID == "MessageAnimation" then
        print("{ Gif }")
        msg_type = 'Gif'
      end
      -------------------------
      if msg.content_.ID == "MessageLocation" then
        print("{ Location }")
        msg_type = 'Location'
      end
    
      -------------------------
      if msg.content_.ID == "MessageContact" then
        print("{ Contact }")
        msg_type = 'Contact'
      end
      
      if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
        print("{ MarkDown }")
        msg_type = 'Markreed'
      end
      if msg.content_.ID == "MessagePhoto" then
	    print("{ Photo }")
        msg_type = 'Photo'
end
-----------------------------------------------------------
local jointime = (redis:get('jointime') or 0)
  local joinlink = (redis:get('joinlink') or 'no')
  if jointime == 0 then
  if joinlink == 'yes' then
	if MSG and MSG:match("https://telegram.me/joinchat/%S+") or MSG and MSG:match("https://t.me/joinchat/%S+") or MSG and MSG:match("https://t.me/joinchat/%S+")  or MSG and MSG:match("https://telegram.dog/joinchat/%S+") then
		local MSG = MSG:gsub("t.me","telegram.me")
		for link in MSG:gmatch("(https://telegram.me/joinchat/%S+)") do
			if not redis:sismember("links",link) then
			redis:sadd("links", link)
			print("[ LINK ADDED TO LIST ]")
			local jt = (redis:get('joinsetedtime') or 0)
				tdcli.importChatInviteLink(link)
				print("[ Tabchi Joined ! ]")
				redis:setex('jointime', jt, true)
			end
		end
		end
end
end
-----------------------------------------------------------
local autoaddapi = (redis:get('autoaddapi') or 'no')
		if msg.chat_id_ then
		if autoaddapi == 'yes' then
if redis:get('apiid') then
local id = redis:get('apiid')
tdcli.addChatMember(msg.chat_id_, id,1)
           tdcli.addChatMembers(msg.chat_id_,{[0] = id})
		   print("[ Tabchi Added API bot By Auto Adding Api Bot ]")
end
else
print("[ Tabchi Not Add Because Auto Add Api Is Disable ]")
end
end
--------------------------------------------------------
local addinglist = (redis:get('add') or 'no')
if addinglist == 'yes' then
if MSG and msg.chat_id_ then
local chat = msg.chat_id_
local limit_time = (redis:get('addlistsetedtime'..msg.chat_id_) or 0)
local addlistlimit = (redis:get('addlistsetedtime') or 0)
if limit_time == 0 then
local addlist = redis:smembers('addlist')
  for i = 1, #addlist do
  sleep(tonumber(sleeptime))
    tdcli.addChatMember(chat, addlist[i], 5)
	if chat_type == 'super' then
	print("[ ALL USERS OF ADD LIST ADDED TO This SGP ]")
	elseif chat_type == 'group' then
	print("[ ALL USERS OF ADD LIST ADDED TO This GP ]")
	end
	redis:setex('addlistsetedtime'..msg.chat_id_,addlistlimit)
	if chat_type == 'group' then
	print("[ LIMIT TIME SETED FOR THIS GP ]")
	elseif chat_type == 'super' then
	print("[ LIMIT TIME SETED FOR THIS SGP ]")
	end
  end
end
end
end
--------------------------------------------------------
if MSG and is_sudo(msg) then
tdcli.sendChatAction(msg.chat_id_, "Typing")
print("( Sending Typing Because Of Sudoer Msg )")
end
--------------------------------------------------------
if MSG then
if is_sudo(msg) then
print("[ Sudoer Msg ]")
else
print("[ Member Msg ]")
end
end
--------------------------------------------------------
if msg.chat_id_ then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Opened ! ]")
end
--------------------------------------------------------
if msg.chat_id_ then
if msg.sender_user_id_ == tonumber(TABCHIapi) then
if not redis:sismember("apiaddedgp",msg.chat_id_) then
redis:sadd("apiaddedgp",msg.chat_id_)
if chat_type == 'super' then
print("[ Sgp Add To Api Added List ]")
elseif chat_type == 'group' then
print("[ Gp Add To Api Added List ]")
else
print("[ This Is Api Tabchi Pm In Private ]")
end
end
end
end
-----------------------------------------------------------
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        if not redis:sismember("sgps",msg.chat_id_) then
          redis:sadd("tsgps",msg.chat_id_)
		  print("[ SGP ADD TO LIST ]")
        end
-----------------------------------------------------------
elseif id:match('^-(%d+)') then
if not redis:sismember("tgp",msg.chat_id_) then
redis:sadd("tgp",msg.chat_id_)
print("[ GP ADD TO LIST ]")
end
-----------------------------------------------------------
elseif id:match('') then
if not redis:sismember("tusers",msg.chat_id_) then
redis:sadd("tusers",msg.chat_id_)
print("[ USER ADD TO LIST ]")
end
   else
        if not redis:sismember("tsgps",msg.chat_id_) then
            redis:sadd("tsgps",msg.chat_id_)
			print("[ SGP ADD TO LIST ]")
end
end
end
--------------------------------------------------------
if msg_type == 'Markreed' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Markdown Msg Opened ! ]")
elseif msg_type == 'Photo' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Photo Msg Opened ! ]")
elseif msg_type == 'Contact' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Contact Msg Opened ! ]")
elseif msg_type == 'Location' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Location Msg Opened ! ]")
elseif msg_type == 'Gif' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Gif Msg Opened ! ]")
elseif msg_type == 'Voice' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Voice Msg Opened ! ]")
elseif msg_type == 'Video' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Video Msg Opened ! ]")
elseif msg_type == 'Audio' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Audio Msg Opened ! ]")
elseif msg_type == 'Sticker' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Sticker Msg Opened ! ]")
elseif msg_type == 'Document' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ ( Document Or File ) Msg Opened ! ]")
elseif msg_type == 'Joins' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Join Member Tg Msg Opened ! ]")
elseif msg_type == 'user' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Add Member Tg Msg Opened ! ]")
elseif msg_type == 'MSG' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
print("[ Text Msg Opened ! ]")
end
--------------------------------------------------------
function check_markdown(MSG) 
		str = MSG
		if str:match('_') then
			output = str:gsub('_',[[\_]])
		elseif str:match('*') then
			output = str:gsub('*','\\*')
		elseif str:match('`') then
			output = str:gsub('`','\\`')
		else
			output = str
		end
	return output
end
--------------------------------------------------------
    if msg_type == 'MSG' and MSG then
      if MSG:match('^[/!#+$*&^_-=|%@~?./1236547890]') then
      MSG = MSG:gsub('^[/!#+$*&^_-=|%@~?./1236547890]','')
end
    end
--------------------------------------------------------
if MSG == 'free' and is_sudo(msg) then
local freestats = redis:get('free') or 'no'
if freestats == 'no' then
   redis:del('free' ,'no')
   redis:set('free' ,'yes')
   sleep(tonumber(sleeptime))
   tdcli.sendText(msg.sender_user_id_, 0, 1,'*Bot Has Been free ! It Means It Doesn Not Answer To Any CMDs : )*', 1, 'md')
   sleep(1)
   if chat_type == 'super' or chat_type == 'group' then
   tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Pv Check : )*',1, 'md')
   end
else
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Bot Is Already Free : )*',1, 'md')
end
end
-------------------------+
if MSG == 'busy' and is_sudo(msg) then
local freestats = redis:get('free') or 'no'
if freestats == 'yes' then
   redis:del('free' ,'yes')
   redis:set('free' ,'no')
   sleep(tonumber(sleeptime))
   tdcli.sendText(msg.sender_user_id_, 0, 1,'*Bot Has Been Busy ! It Means It Starts To Work : )*', 1, 'md')
   sleep(1)
   if chat_type == 'super' or chat_type == 'group' then
   tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Pv Check : )*',1, 'md')
   end
else
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Bot Is Already Busy : )*',1, 'md')
end
end
-----------------+
if MSG == 'freeorbusy' and is_sudo(msg) then
local freestats = redis:get('free') or 'no'
if freestats == 'yes' then
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Bot Is Free Now : )*',1, 'md')
else
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Bot Is Busy Now : )*',1, 'md')
end
end
--------------------------------------------------------
local freestats = redis:get('free') or 'no'
if freestats == 'yes' then
return
else
if MSG and MSG:match('^setanswersleeptime (%d+)') and is_sudo(msg) then
             local anwersleeptime = MSG:match('setanswersleeptime (%d+)')
            redis:set('anwersleeptime', anwersleeptime)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Answer Sleep Time Seted : )*', 1, 'md')
            end
---------------+
if MSG == 'delanswersleeptime' then
            redis:del('anwersleeptime')			
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Answer Sleep Time Removed : (*', 1, 'md')
            end
---------------+
  if chat_type == 'user' then
  tdcli.openChat(msg.chat_id_, dl_cb, nil)
  tdcli.sendChatAction(msg.chat_id_, "Typing")
  end
--------------------------------------------------------
local gptyping = (redis:get('gptyping') or 'no')
if msg_type == 'MSG' and chat_type == 'super' or chat_type == 'group' then
if gptyping == 'yes' then
tdcli.openChat(msg.chat_id_, dl_cb, nil)
  tdcli.sendChatAction(msg.chat_id_, "Typing")
end
end
--------------------------------------------------------
  local function openChat(chat_id, cb)
  if msg_type == 'MSG' then
  tdcli_function ({
    ID = "OpenChat",
    chat_id_ = chat_id
  }, cb or dl_cb, nil)
end
end
--------------------------------------------------------
  local savecontact = (redis:get('savecontact') or 'no') 
    if savecontact == 'yes' then
 if msg.content_.ID == "MessageContact" then
	  tdcli.importContacts(msg.content_.contact_.phone_number_, (msg.content_.contact_.first_name_ or '--'), '#COTACT', msg.content_.contact_.user_id_)
        print("ConTact Added")
---------------------------------------------------------
local function c(a,b,c) 
local sendcontact = (redis:get('sendcontact') or 'no')
if sendcontact == 'yes' then
sleep(30)
tdcli.sendContact(msg.chat_id_, msg.id_, 0, 1, nil, b.phone_number_, b.first_name_, (b.last_name_ or ''), 0)
end
end
tdcli.getMe(c)
redis:sadd('tcom', msg.content_.contact_.user_id_)
local sendcontactpm = (redis:get('sendcontactpm') or 'no')
local MSG = redis:get('pm')
if not MSG then
MSG = 'savi pv noqte bezar : )'
end
if sendcontactpm == 'yes' then
sleep(20)
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG,1, 'md')
        print("[ Tabchi Cli Message ]")
end
end
end
--------------------------------------------------------
if MSG and MSG == 'share' and is_sudo(msg) then
local function c(a,b,c)
tdcli.sendContact(msg.chat_id_, msg.id_, 0, 1, nil, b.phone_number_, b.first_name_, (b.last_name_ or ''), 0)
end
sleep(tonumber(sleeptime))
tdcli.getMe(c)
 end
--------------------------------------------------------
local cmdtime = (redis:get('cmdsetedtime') or 0)
   if MSG == 'leave sgp' and is_sudo(msg) then
   if cmdtime == 0 then
          local list = redis:smembers('tsgps')
          for k,v in pairs(list) do
       tdcli.changeChatMemberStatus(v, TABCHIapi, "Left")
        print("Tabchi [ Left ]")
redis:del('tsgps')
   end
   local cmdsetting = (redis:get('cmdtime') or 0)
   sleep(tonumber(sleeptime))
tdcli.sendText(msg.sender_user_id_, 0, 1,'*Done !\nThe Bot Left from ALL SUPER GROUPS  That Your API-BOT Were There!*', 1, 'md')
   print("[ Tabchi Cli Message ]")
   redis:setex('cmdsetedtime',cmdsetting,true)
   else
   sleep(tonumber(sleeptime))
   tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
end
      end
--------------------------------------------------------
if is_sudo(msg) then
local random = (redis:get('random') or 0)
local cmdtime = (redis:get('cmdsetedtime') or 0)
if MSG == 'bcrandomsgp' and tonumber(msg.reply_to_message_id_) > 0 then
		  if cmdtime == 0 then
          function cb(a,b,c)
          local MSG = b.content_.text_
          local list = redis:srandmember('tsgps',random)
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.sendText(v, 0, 1, MSG,1, 'md')
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local MSG = '*Your Message Was Send To [ '..random..' ] SuperGroups Randomly*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
	      redis:setex('cmdsetedtime',cmdsetting,true)
		  end
		  tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
	      else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
	      end
end
--------------------+
if MSG == 'bcrandomgp' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local MSG = b.content_.text_
          local list = redis:srandmember('tgp',random)
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.sendText(v, 0, 1, MSG,1, 'md')
          end    
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local MSG = '*Your Message Was Send To [ '..random..' ] Groups Randomly*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
	   	  redis:setex('cmdsetedtime',cmdsetting,true)
	      end
		  tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
	      else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
	      end
end
---------------------+
if MSG == 'bcrandomuser' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          if cmdtime == 0 then
          function cb(a,b,c)
          local MSG = b.content_.text_
          local list = redis:srandmember('tusers',random)
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.sendText(v, 0, 1, MSG,1, 'md')
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local MSG = '*Your Message Was Send To [ '..random..' ] Users Randomly*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
	      redis:setex('cmdsetedtime',cmdsetting,true)
       	  end
		  tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
	      end
end
--------------------+
if MSG == 'fwdrandomsgp' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local list = redis:srandmember('tsgps',random)
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
	      local cmdsetting = (redis:get('cmdtime') or 0)
          local MSG = '*Your Message Was ForWard To [ '..random..' ] SuperGroups Randomly*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
          redis:setex('cmdsetedtime',cmdsetting,true)
          end
		  tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
	      end
end
--------------------+
if MSG == 'fwdrandomgp' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local list = redis:srandmember('tgp',random)
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end  
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local MSG = '*Your Message Was ForWard To [ '..random..' ] Groups Randomly*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
  	      redis:setex('cmdsetedtime',cmdsetting,true)
	      end
 	      tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
	      end
end
------------------+
if MSG == 'fwdrandomuser' and tonumber(msg.reply_to_message_id_) > 0 then
           if cmdtime == 0 then
          function cb(a,b,c)
          local list = redis:srandmember('tusers',random)
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
         tdcli.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end   
		   local cmdsetting = (redis:get('cmdtime') or 0)
     local MSG = '*Your Message Was ForWard To [ '..random..' ] Users randomly*'
	 sleep(tonumber(sleeptime))
       tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
	   redis:setex('cmdsetedtime',cmdsetting,true)
	   end
	   tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          else
		  sleep(tonumber(sleeptime))
	   tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
	   end
          end
end
-----------------------------------------------------------------------
if is_sudo(msg) then
if MSG == 'bcallsgp' and tonumber(msg.reply_to_message_id_) > 0 then
		  if cmdtime == 0 then
          function cb(a,b,c)
          local MSG = b.content_.text_
          local list = redis:smembers('tsgps')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.sendText(v, 0, 1, MSG,1, 'md')
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local gps = redis:scard("tsgps")     
          local MSG = '*Your Message Was Send To [ '..gps..' ] SuperGroups*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
	      redis:setex('cmdsetedtime',cmdsetting,true)
          end
          tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
		  else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
          end
end
------------------+
if MSG == 'bcallgp' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local MSG = b.content_.text_
          local list = redis:smembers('tgp')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.sendText(v, 0, 1, MSG,1, 'md')
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
	   	  local gp = redis:scard("tgp")     
          local MSG = '*Your Message Was Send To [ '..gp..' ] Groups*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')	
	      redis:setex('cmdsetedtime',cmdsetting,true)
          end
          tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
		  else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
          end
end
----------------+
if MSG == 'bcalluser' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          if cmdtime == 0 then
          function cb(a,b,c)
          local MSG = b.content_.text_
          local list = redis:smembers('tusers')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.sendText(v, 0, 1, MSG,1, 'md')
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local uu = redis:scard("tusers")     
          local MSG = '*Your Message Was Send To [ '..uu..' ] Users*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
	      redis:setex('cmdsetedtime',cmdsetting,true)
          end
          tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
		  else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
          end
end
-----------------+
if MSG == 'fwdallsgp' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local list = redis:smembers('asgp')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
          local gps = redis:scard("asgp")     
          local MSG = '*Your Message Was ForWard To [ '..gps..' ] SuperGroups*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
          redis:setex('cmdsetedtime',cmdsetting,true)
          end
          tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
		  else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
          end
end
-----------------+
if MSG == 'fwdallgp' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local list = redis:smembers('tgp')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
		  local gp = redis:scard("tgp")     
          local MSG = '*Your Message Was ForWard To [ '..gp..' ] Groups*'
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
          redis:setex('cmdsetedtime',cmdsetting,true)
          end
          tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
		  else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
          end
end
----------------+
if MSG == 'fwdalluser' and tonumber(msg.reply_to_message_id_) > 0 then
          if cmdtime == 0 then
          function cb(a,b,c)
          local list = redis:smembers('tusers')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
          tdcli.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
		  local cmdsetting = (redis:get('cmdtime') or 0)
	      local qq = redis:scard("tusers")     
          local MSG = '*Your Message Was ForWard To [ '..qq..' ] Users*'
          tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
          redis:setex('cmdsetedtime',cmdsetting,true)
          end
          tdcli.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
		  else
		  sleep(tonumber(sleeptime))
	      tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
          end
end
end
--------------------------------------------------------
if MSG and MSG:match('^setapi (%d+)') and is_sudo(msg) then
          local id = MSG:match('^setapi (%d+)')
redis:set('apiid',id)
sleep(1)
tdcli.sendBotStartMessage(id, id, "nesw")
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Api ID Has Been Set : )*', 1, 'md')
end
--------------------------------------------------------
if MSG == 'addapi' and is_sudo(msg) then
local cmdtime = (redis:get('cmdsetedtime') or 0)
if cmdtime == 0 then
if redis:get('apiid') then
local id = redis:get('apiid')
local add = redis:smembers("tsgps")
          for k,v in pairs(add) do
		  sleep(tonumber(sleeptime))
    tdcli.addChatMember(v, id,20)
  end
local add = redis:smembers("tgp")
local id = redis:get('apiid')
          for k,v in pairs(add) do
		  sleep(tonumber(sleeptime))
    tdcli.addChatMember(v, id,20)
  end
local cmdsetting = (redis:get('cmdtime') or 0)
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Done !*\n_API BOT ADDED TO ALL GROUPS & SUPER GROUPS !_', 1, 'md')
redis:setex('cmdsetedtime',cmdsetting,true)
end
else
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
end
end
--------------------------------------------------------
 if MSG == 'leave gp' and is_sudo(msg) then
 if cmdtime == 0 then
          local list = redis:smembers('tgp')
          for k,v in pairs(list) do
		  sleep(tonumber(sleeptime))
       tdcli.changeChatMemberStatus(v, TABCHIapi, "Left")
        print("Tabchi [ Left ]")
redis:del('tgp')       
   end
   local cmdsetting = (redis:get('cmdtime') or 0)
   sleep(tonumber(sleeptime))
tdcli.sendText(msg.sender_user_id_, 0, 1,'*Done !\nThe Bot Left from ALL GROUPS That Your API-BOT Were There!*', 1, 'md')
   print("[ Tabchi Cli Message ]")
   redis:setex('cmdsetedtime',cmdsetting,true)
else
sleep(tonumber(sleeptime))

end
      end
-------------------------------------------------------
if MSG and MSG == 'version' and is_sudo(msg) then
MSG = "• Version 1.0 !\n• The First Version !\n• Developed By [ @MaQzAfzar ] •"
if chat_type == 'super' or chat_type == 'group' then
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,'*Plz Send This Commend In The Private Of The Bot !*',1,'md')
else
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,MSG,1,'md')
end
end
-------------------------------------------------------
		 if MSG and MSG:match('^setname (.*)') and is_sudo(msg) then
          local name = MSG:match('^setname (.*)')
		  tdcli.changeName(name, '')
		       local MSG = '*Name Changed To* `'..name..'`'
			   sleep(tonumber(sleeptime))
			 tdcli.sendText(msg.chat_id_, msg.id_, 1,MSG, 1, 'md')
		  end
------------------------------------------------------
if MSG == 'sgp' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tsgps") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'gp' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tgp") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'user' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tusers") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'contact' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tcom") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'block' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tblock") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'link' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("links") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'allmsg' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tallmsg") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
---------------+
if MSG == 'apistats' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("apiaddedgp") or 0
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"• `"..gps.."` At `"..time.."` •",1,'md')
end
------------------------------------------------------
if MSG == 'amar' and is_sudo(msg) then
local time = os.date("%H:%M")
local gps = redis:scard("tsgps") or 0
local api = redis:scard("apiaddedgp") or 0
local user = redis:scard("tusers") or 0
local gp = redis:scard("tgp") or 0
local com = redis:scard("tcom") or 0
local block = redis:scard("tblock") or 0
local allmsg = redis:get("tallmsg") or 0
local link = redis:scard('links') or 0
local MSG = '*Stats Of Tabchi At [* `'..time..'` *]*\n\n• `Total Recieved MSGs :` *[ '..allmsg..' ]*\n\n• `Total SGPs :` *[ '..gps..' ]*\n\n• `Total GPs :` *[ '..gp..' ]*\n\n• `Total Users :` *[ '..user..' ]*\n\n• `Total Contacts :` *[ '..com..' ]*\n\n• `Total Links :` *[ '..link..' ]*\n\n• `Total Blocked Users :` *[ '..block..' ]*\n\n• `Total Api Bot Gps & Sgps :` *[ '..api..' ]*\n\n• `Developed By [` @MaQzAfzar `]` •'
 sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,MSG,1,'md')
 print("[ Tabchi Cli Message ]")
 end
---------------------------------------------------
if MSG == 'monshi stats' and is_sudo(msg) then
if redis:get('monshi') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
----------------------+
if MSG == 'savecontact stats' and is_sudo(msg) then
if redis:get('savecontact') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
-----------------------+
if MSG == 'join stats' and is_sudo(msg) then
if redis:get('joinlink') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
----------------------+
if MSG == 'sendcontact stats' and is_sudo(msg) then
if redis:get('sendcontact') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
----------------------+
if MSG == 'addapi stats' and is_sudo(msg) then
if redis:get('autoaddapi') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
---------------------+
if MSG == 'gptyping stats' and is_sudo(msg) then
if redis:get('gptyping') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
----------------------+
if MSG == 'sendcontactpm stats' and is_sudo(msg) then
if redis:get('sendcontactpm') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
----------------------+
if MSG == 'cmdtime stats' and is_sudo(msg) then
if redis:get('cmdstime') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
-----------------------+
if MSG == 'addlist stats' and is_sudo(msg) then
if redis:get('add') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
		  sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,"*["..monshi.."]*",1,'md')
end
---------------------------------------------------
if MSG == 'options' and is_sudo(msg) then
local pm = redis:get('pm')
if not pm then
pm = 'savi pv noqte bezar : )'
end
local monshipm = redis:get('botpm')
if not monshipm then
monshipm = 'Not Found Monshi Is Disable'
end
if redis:get('monshi') then
          monshi = 'Enable'
		  else
		  monshi = 'Disable'
		  end
 if redis:get('savecontact') then
              co = 'Enable'
            else
              co = 'Disable'
            end
 if redis:get('joinlink') then
              join = 'Enable'
            else
              join = 'Disable'
            end
if redis:get('sendcontact') then
             sc = 'Enable'
			 else
			 sc = 'Disable'
			 end
if redis:get('sendcontactpm') then
             scs = 'Enable'
			 else
			 scs = 'Disable'
			 end
if redis:get('gptyping') then
             gptyping = 'Enable'
			 else
			 gptyping = 'Disable'
			 end
if redis:get('autoaddapi') then
             autoaddapi = 'Enable'
			 else 
			 autoaddapi = 'Disable'
			 end
if redis:get('cmdstime') then
             cmdstime = 'Enable'
			 else
			 cmdstime = 'Disable'
			 end
if redis:get('maxmember') then
             maxmember = 'Enable'
			 else
			 maxmember = 'Disable'
			 end
if redis:get('add') then
             addlist = 'Enable'
			 else
			 addlist = 'Disable'
			 end
local sleeptime = (redis:get('anwersleeptime') or 2)
local cmdremaindertime = redis:ttl('cmdsetedtime') or 'Not Found'
local time = os.date("%H:%M")
local maxgp = redis:get('maxgp') or 'Not Set'
local maxmem = redis:get('maxmem') or 'Not Set'
local cmdtime = redis:get('cmdtime') or 'Not Set'
local jointime = redis:get('joinsetedtime') or 'Not Set'
local addlistlimit = redis:get('addlistlimit') or 'Not Set'
local joinremaindertime = redis:ttl('jointime') or 'Not Set'
local monshitime = redis:get('monshitime') or 'Not Set'
local monshisleep = redis:get('monshisleep') or 'Not Set'
local random = redis:get('random') or 'Not Set'
local apitabchi = redis:get('apiid') or 'Not Set'
local MSG = '*• Settings Of Tabchi At [* `'..time..'` *]*\n\n• `Answering Sleep Time :` *[* `'..sleeptime..'` *]*\n\n• `Join Time :` *[* `'..jointime..'` *]*\n\n• `Join Remainder Time :` *[* `'..joinremaindertime..'` *]*\n\n• `Cmd Time :` *[* `'..cmdtime..'` *]*\n\n• `Cmd Remainder Time :` *[* `'..cmdremaindertime..'` *]*\n\n• `Monshi Time :` *[* `'..monshitime..'` *]*\n\n• `Monshi Sleep Time :` *[* `'..monshisleep..'` *]*\n\n• `Add List Limit Time :` *[* `'..addlistlimit..'` *]*\n\n• _Time Is in Second_\n\n• `Random Amount :` *[* `'..random..'` *]*\n\n• `Maxioum Gp Amount :` *[* `'..maxgp..'` *]*\n\n• `Tabchi Api ID :` *[* `'..apitabchi..'` *]*\n\n• `Savecontact Pm :` *[* `'..pm..'` *]*\n\n• `Monshi Pm :` *[* `'..monshipm..'` *]*\n\n• `Cmd Time :` *[ '..cmdstime..' ]*\n\n• `Auto Add Api :` *[ '..autoaddapi..' ]*\n\n• `Auto Join :` *[ '..join..' ]*\n\n• `Save Contact :` *[ '..co..' ]*\n\n• `Send Contact :` *[ '..sc..' ]*\n\n• `Send Save Contact Pm :` *[ '..scs..' ]*\n\n• `Monshi :` *[ '..monshi..' ]*\n\n• `Add List :` *[ '..addlist..' ]*\n\n• `Typing In Gp & SGP :` *[ '..gptyping..' ]*\n\n• `Typing In PV & Markread `*[ In GP & SGP & PV ]*` Are Always `*Enable*` : )`\n\n• `Developed By [` @MaQzAfzar `]` •'
sleep(tonumber(sleeptime))
 tdcli.sendText(msg.chat_id_, msg.id_,1,MSG,1,'md')
 print("[ Tabchi Cli Message ]")
end
---------------------------------------------------
if MSG == 'gpid' then
sleep(tonumber(sleeptime))
	tdcli.sendText(msg.chat_id_, msg.id_, 1, '[ `'..msg.chat_id_..'` ]', 1,'md')
	print("[ Tabchi Cli Message ]")
end
---------------------------------------------------
if MSG and MSG:match('^sleep (%d+)') and is_sudo(msg) then
             local sleeep = MSG:match('sleep (%d+)')
			 if tonumber(sleeep) > 0 and tonumber(sleeep) < 1441 then
			 local asleep = (tonumber(sleeep) * 60)
			 sleep(2)
			 tdcli.sendText(msg.chat_id_, msg.id_, 1,'*The Bot Sleep Now To [* `'..sleeep..' MIN` *] Later*', 1, 'md')
			 print("{ TG BOT SLEPT BY SUDO COMMEND }")
			 sleep(tonumber(asleep))
             tdcli.sendText(msg.chat_id_, msg.id_, 1,'*The Bot Wake Up Now : )*', 1, 'md')
			 print("{ TG BOT Wake Up Now }")
		     else
			 sleep(tonumber(sleeptime))
		     tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Plz Choose A number Between 1 to 1440 : )*', 1, 'md')
             end
			 end
---------------------------------------------------
if MSG and MSG:match('^setrandom (%d+)') and is_sudo(msg) then
             local rand = MSG:match('setrandom (%d+)')
            redis:set('random', rand)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Random Amount Seted : )*', 1, 'md')
		  print("[ Tabchi Cli Message ]")
            end
if MSG == 'delrandom' then
            redis:del('random')	
                  sleep(tonumber(sleeptime))			
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Random Amount Removed : (*', 1, 'md')
		  print("[ Tabchi Cli Message ]")
            end
---------------------------------------------------
if MSG == 'about' then
sleep(tonumber(sleeptime))
return tdcli.sendText(msg.chat_id_, msg.id_, 1, '• `MaQzAfzar [ Edward Jason ]`\n\n• `LUA Developer`\n\n• `Reza Khosrobegi`\n\n• `15 Years Old`\n\n• `Tehran-Shahriyar`\n\n• `Pm Bot [` @PvRezaBot `]`', 1, 'md')
end
---------------------------------------------------
if MSG == 'addmem' and is_sudo(msg) then
  local pv = redis:smembers("tusers")
  for i = 1, #pv do
  sleep(tonumber(sleeptime))
    tdcli.addChatMember(msg.chat_id_, pv[i], 5)
  end
 local co = redis:smembers("tcom")
  for i = 1, #co do
  sleep(tonumber(sleeptime))
    tdcli.addChatMember(msg.chat_id_, co[i], 5)
  end
  sleep(tonumber(sleeptime))
  tdcli.sendText(msg.chat_id_, msg.id_,1,'*All Members Has Been Added To Group !*',1,'md')
 end
-------------------[ ADD LIST ]--------------------
if MSG and MSG:match('^setaddlist (%d+)') and is_sudo(msg) then
             local llll = MSG:match('setaddlist (%d+)')
            redis:sadd('addlist', llll)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*USER-ID ADDED TO THE LIST : )*', 1, 'md')
            end
------------+
if MSG and MSG:match('^deladdlist (%d+)') and is_sudo(msg) then
             local ll = MSG:match('deladdlist (%d+)')
            redis:srem('addlist', ll)	
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*USER-ID REMOVED FROM THE LIST : (*', 1, 'md')
            end
------------+
if MSG and MSG == 'addlist' and is_sudo(msg) then
  local addlistusers = redis:smembers('addlist')
  local MSG = "*<ADD LIST OF BOT >*\n\n"
  for i=1,#addlistusers do
  MSG = MSG..i.." 👉🏻 [ `"..addlistusers[i].."` ]\n\n"
  end
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1,MSG, 1, 'md')
end
-----------+
if MSG and MSG:match('^setaddlistlimit (%d+)') and is_sudo(msg) then
             local maxgp = MSG:match('addlistlimit (%d+)')
            redis:set('addlistlimit', maxgp)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Add LIst Limit Time Seted : )*', 1, 'md')
            end
if MSG == 'deladdlistlimit' then
            redis:del('addlistlimit')			
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Add LIst Limit Time Removed : (*', 1, 'md')
            end
----------------+
if MSG == 'addlist enable' and is_sudo(msg) then
          redis:del('add','no')
          redis:set('add','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Auto Add List` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'addlist disable' and is_sudo(msg) then
          redis:set('add','no')
          redis:del('add','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Auto Add List` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------
if MSG and MSG:match('^setmaxgp (%d+)') and is_sudo(msg) then
             local maxgp = MSG:match('setmaxgp (%d+)')
            redis:set('maxgp', maxgp)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Maxioum GP Amount Seted : )*', 1, 'md')
            end
if MSG == 'delmaxgp' then
            redis:del('maxgp')			
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Maxioum GP Amount Removed : (*', 1, 'md')
            end
---------------------------------------------------
if MSG and MSG:match('^editmsg (.*)') and is_sudo(msg) then
       local edit = MSG:match('^editmsg (.*)')
       tdcli.editMessageText(msg.chat_id_, msg.reply_to_message_id_, nil, edit, 1, 'md', dl_cb, nil)
   end
---------------------------------------------------
if MSG == 'addapi enable' and is_sudo(msg) then
          redis:del('autoaddapi','no')
          redis:set('autoaddapi','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Auto Add Api` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'addapi disable' and is_sudo(msg) then
          redis:set('autoaddapi','no')
          redis:del('autoaddapi','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Auto Add Api` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------
local cmdtime = (redis:get('cmdsetedtime') or 0)
  if MSG and MSG:match('^addall (%d+)') and is_sudo(msg)  then
  if cmdtime == 0 then
          local id = MSG:match('^addall (%d+)')
  local add = redis:smembers("tsgps")
          for k,v in pairs(add) do
		  sleep(tonumber(sleeptime))
    tdcli.addChatMember(v, id,5)
  end
 local add = redis:smembers("tgp")
          for k,v in pairs(add) do
		  sleep(tonumber(sleeptime))
    tdcli.addChatMember(v, id,5)
  end
local cmdsetting = (redis:get('cmdtime') or 0)
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,'*User [* `'..id..'` *] Has Been Added To All Group !*',1,'md')
redis:setex('cmdsetedtime',cmdsetting,true)
else 
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,'*Cmd Time Is Enable !*',1,'md')
end
end
---------------------------------------------------------
if MSG == 'cmdtime enable' and is_sudo(msg) then
          redis:del('cmdstime','no')
          redis:set('cmdstime','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Cmd Time` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'cmdtime disable' and is_sudo(msg) then
          redis:set('cmdstime','no')
          redis:del('cmdstime','yes')
		  redis:del('cmdsetedtime')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Cmd Time` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------------
if MSG == 'gptyping enable' and is_sudo(msg) then
          redis:del('gptyping','no')
          redis:set('gptyping','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Send Save Contact Pm` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'gptyping disable' and is_sudo(msg) then
          redis:set('gptyping','no')
          redis:del('gptyping','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Send Save Contact Pm` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------------
if MSG == 'sendcontactpm enable' and is_sudo(msg) then
          redis:del('sendcontactpm','no')
          redis:set('sendcontactpm','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Send Save Contact Pm` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'sendcontactpm disable' and is_sudo(msg) then
          redis:set('sendcontactpm','no')
          redis:del('sendcontactpm','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Send Save Contact Pm` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------------
if MSG == 'sendcontact enable' and is_sudo(msg) then
          redis:del('sendcontact','no')
          redis:set('sendcontact','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Send Contact` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'sendcontact disable' and is_sudo(msg) then
          redis:set('sendcontact','no')
          redis:del('sendcontact','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Send Contact` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------------
if MSG == 'reset' and is_sudo(msg) then
redis:del("tallmsg")
redis:del("tsgps")
redis:del("tgp")
redis:del("tcom")
redis:del("tblock")
redis:del("tusers")
redis:del("links")
redis:del("tbotmsg")
redis:del("apiaddedgp")
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_,1,'*Stats TabChi Has Been Reseted !*',1,'md')
        print("[ Tabchi Cli Message ]")
end
---------------------------------------------------------
if MSG == 'join enable' and is_sudo(msg) then
		  redis:del('joinlink','no')
          redis:set('joinlink','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Auto Join` *]* *Has Been Enabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
        if MSG == 'join disable' and is_sudo(msg) then
		  redis:del('jointime')
          redis:set('joinlink','no')
         redis:del('joinlink','yes')
		 sleep(tonumber(sleeptime))
        tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Auto Join` *]* *Has Been Disabled*', 1, 'md')
                print("[ Tabchi Cli Message ]")
  end
---------------------------------------------------------
if MSG == 'savecontact enable' and is_sudo(msg) then
		  redis:del('savecontact','no')
          redis:set('savecontact','yes')
		  redis:set('sendcontactpm','yes')
		  sleep(tonumber(sleeptime))
         tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Save Contact` *]* *Has Been Enabled*', 1, 'md')
                 print("[ Tabchi Cli Message ]")
 end
        if MSG == 'savecontact disable' and is_sudo(msg) then
          redis:set('savecontact','no')
          redis:del('savecontact','yes')
		  redis:set('sendcontact','no')
		  redis:del('sendcontact','yes')
		  redis:set('sendcontactpm','no')
		  redis:del('sendcontactpm','yes')
		  sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*[* `Save Contact` *]* *Has Been Disabled*', 1, 'md')
                  print("[ Tabchi Cli Message ]")
end
---------------------------------------------------------
if MSG and MSG:match("^(bc) (%d+) (.*)") and is_sudo(msg) then

      local matches = {
        MSG:match("^(bc) (%d+) (.*)")
      }
      if #matches == 3 then
	    sleep(tonumber(sleeptime))
        tdcli.sendText((matches[2]), 0, 1, matches[3], 1, "html")
                    print("[ Tabchi Cli Message ]")
					sleep(tonumber(sleeptime))
  tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Sent !*', 1, 'md')
      end
end
---------------------------------------------------------
 if MSG and MSG:match('^jointo (.*)') and is_sudo(msg) then
  local link = MSG:match('^jointo (.*)')
tdcli.importChatInviteLink(link, dl_cb, nil)
print("Tabchi Joined")
            print("[ Tabchi Cli Message ]")
			sleep(tonumber(sleeptime))
    tdcli.sendText(msg.chat_id_, msg.id_, 1, '*Bot Joined !*', 1, 'md')
end
--------------------------------------------------------
   if MSG and MSG:match('^block (%d+)') and is_sudo(msg) then
  local b = MSG:match('block (%d+)')
redis:sadd('tblock',b)
   tdcli.blockUser(b)
   sleep(tonumber(sleeptime))
 tdcli.sendText(msg.chat_id_, msg.id_, 1, '*User Blocked : (*', 1, 'md')
end
--------------------------------------------------------
             if MSG and MSG:match('^unblock (%d+)') and is_sudo(msg) then
  local b = MSG:match('^unblock (%d+)')
 redis:srem('tblock',b)
     tdcli.unblockUser(b)
	 sleep(tonumber(sleeptime))
      tdcli.sendText(msg.chat_id_, msg.id_, 1, '*User Unblocked : )*', 1, 'md')
end
--------------------------------------------------------
if MSG == 'help' and is_sudo(msg) then
local MSG = [[
• راهنماي کار با سورس اکسترا تب •

• `forwardhelp` •
• نمایش راهنمای فروارد •

• `prohelp` •
• نمایش راهنمای روشن و خاموش فعالیات •

• `sethelp` •
• نمایش راهنمای تنظیمات •

• `statshelp` •
• نمایش راهنمای دریافت موقعیات ربات •

• `otherhelp` •
• نمایش دیگر قابلیت ها •

• `about` •
• درباره نویسنده سورس •

• `version` •
• برای اطلاع از ورژن سورس •

• `Developed By [` @MaQzAfzar `]` •
]]
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
end
--------+
if MSG == 'statshelp' and is_sudo(msg) then
local MSG = [[
• راهنماي کار با سورس اکسترا تب •

• `options` •
• نمایش تنظیمات اعمال شده •

• `amar` •
• نمایش امار کلی •

• `sgp` •
• نمایش امار سوپر گروه ها •

• `gp` •
• نمایش امار گروه ها •

• `user` •
• نمایش امار پرایوت ها •

• `contact` •
• نمایش امار مخاطبین •

• `link` •
• نمایش امار لینک ها •

• `allmsg` •
• نمایش امار تمامی پیام های دریافتی •

• `apistats` •
• نمایش تمامی گروه هایی که ربات API در آنها نیز میباشد •

• `Developed By [` @MaQzAfzar `]` •
]]
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
end
-----------+
if MSG == 'otherhelp' and is_sudo(msg) then
local MSG = [[
• راهنماي کار با سورس اکسترا تب •

• `block [id]` •
• بلاک کردن •

• `unblock [id]` •
• رفع بلاک کردن فرد •

• `busy` • 
• برای فعال کردن ربات •

• `free` •
• برای غیرفعال کردن ربات •

• `freeorbusy` •
• برای نمایش وضعیت فعال یا غیرفعال بودن ربات •

• `sleep [min]` •
• دستور به خواب رفتن ربات •

• `addall [id]` •
• دعوت به همه •

• `addmem` •
• برای دعوت همه به گروه •

• `addapi` •
• برای اد کردن api به همه •

• `leave gp` •
• برای ترک گروه هایی که ربات api در آنهاست •

• `leave sgp` •
• برای ترک سوپر گروه هایی که ربات api در آنهاست •

• `addlist` •
• برای دریافت لیست کاربران اد لیست •

• `share` •
• برای ارسال شماره تبچی •

• `Developed By [` @MaQzAfzar `]` •
]]
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
end
--------+
if MSG == 'sethelp' and is_sudo(msg) then
local MSG = [[
• راهنماي کار با سورس اکسترا تب •

• [`set`,`del`] •

• `pm [txt]` •
• تنظیم متن مخاطب •

• `monshi [txt]` •
• تنظیم پیام منشی •

• `monshisleeptime [sec]` •
• تنظیم اسلیپ تایم منشی •

• `monshitime [num]` •
• تنظیم محدودیت در پاسخ منشی •

• `random [num]` •
• تنظیم مقدار فروارد •

• `cmdtime [num]` •
• تنظیم زمان محدودیت برخی دستورات •

• `answersleeptime [num]` •
• تنظیم زمان تاخیر در پاسخ •

• `api [id]` •
• تنظیم ربات api •

• `jointime [num]` •
• تنظیم محدودیت زمانی در عضویت •

• `name [name]` •
• تنظیم نام ربات •

• `servertime` •
• تنظیم زمان سرور بر روی ساعت ایران •

• `maxgp` •
• تنظیم حداکثر تعداد گروه هایه ربات •

• `addlistlimit [sec]` •
• تنظیم زمان محدودیت دعوت اد لیست به گروه ها •

• `addlist [User-ID]` •
• برای افزودن کاربر به اد لیست •

• `Developed By [` @MaQzAfzar `]` •
]]
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
end
--------+
if MSG == 'prohelp' and is_sudo(msg) then
local MSG = [[
• راهنماي کار با سورس اکسترا تب •

• [`enable`,`disable`,`stats`] •
• برای تنظیم از این دستورات استفاده کنید •

• `savecontact` •
• ذخیره کردن مخاطب •

• `join` •
• عضویت خودکار •

• `addapi` •
• اد کردن خودکار تبچی api •

• `sendcontat` •
• ارسال شماره •

• `sendcontactpm` •
• ارسال پیام مخاطب •

• `gptyping` •
• ارسال تایپینگ در گروه ها •

• `cmdtime` •
• محدودیت زمانی در برخی از دستورات •

• `monshi` •
• منشی ربات •

• `addlist` •
• دعوت اد لیست به گروه ها به صورت خودکار •

• `Developed By [` @MaQzAfzar `]` •
]]
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
end
--------+
if MSG == 'forwardhelp' and is_sudo(msg) then
local MSG = [[
• راهنماي فوروارد با ربات اکسترا تب •

• `bc [userID] [MSG]` •
• برای ارسال به شخص •

• `fwdrandomsgp` •
• برای فروارد رندام به سوپر گروه ها : ) •

• `fwdrandomgp` •
• برای فروارد رندام به گروه ها : ) •

• `fwdrandomuser` •
• برای فروارد رندام به پی وی ها : ) •

• `bcrandomsgp` •
• برای ارسال رندام پیام به سوپر گروه ها : ) •

• `bcrandomgp` •
• برای ارسال رندام پیام به گروه ها : ) •

• `bcrandomuser` •
• برای ارسال رندام به پی وی ها •

• `fwdallsgp` •
• برای فروارد به تمامی سوپر گروه ها : ) •

• `fwdallgp` •
• برای فروارد به تمامی گروه ها : ) •

• `fwdalluser` •
• برای ارسال به تمامی پی وی ها : ) •

• `bcallsgp` •
• برای ارسال به تمامی سوپر گروه ها : ) •

• `bcallgp` •
• برای ارسال به تمامی گروه ها : ) •

• `bcalluser` •
• برای ارسال به تمامی پیوی ها : ) •

• `Developed By [` @MaQzAfzar `]` •
]]
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1, MSG, 1, 'md')
end
---------------------------------------------------------
local cmdtimes = (redis:get('cmdstime') or 'no')
if MSG and MSG:match('^setcmdtime (%d+)') and is_sudo(msg) then
if cmdtimes == 'yes' then
            local cmdtime = MSG:match('setcmdtime (%d+)')
            redis:set('cmdtime', cmdtime)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Cmd Time Seted : )*', 1, 'md')
		  else
		  sleep(tonumber(sleeptime))
		  tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Cmd Time Is Disable : )*', 1, 'md')
		  end
            end
 if MSG == 'delcmdtime' then
            redis:del('cmdtime')
			redis:del('cmdsetedtime')
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Cmd Time Removed : (*', 1, 'md')
            end 
---------------------------------------------------------
if MSG and MSG:match('^setpm (.*)') and is_sudo(msg) then
            local pmm = MSG:match('setpm (.*)')
            redis:set('pm', pmm)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Add MSG Seted : )*', 1, 'md')
            end
 if MSG == 'delpm' then
            redis:del('pm')
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Pm Removed : (*', 1, 'md')
            end 
---------------------------------------------------------
if MSG and MSG:match('^setjointime (%d+)') and is_sudo(msg) then
             local setjointime = MSG:match('setjointime (%d+)')
            redis:set('joinsetedtime', setjointime)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Join Time Seted : )*', 1, 'md')
            end
if MSG == 'deljointime' then
            redis:del('joinsetedtime')
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Join Time Removed : (*', 1, 'md')
            end
---------------------------------------------------------
if MSG and MSG:match('^setmonshitime (%d+)') and is_sudo(msg) then
local ttt = (redis:get('monshi') or 'no')
if ttt == 'yes' then
             local rand = MSG:match('setmonshitime (%d+)')
            redis:set('monshitime', rand)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi Time Seted : )*', 1, 'md')
            else
			sleep(tonumber(sleeptime))
	   tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi is Disable*', 1, 'md')
	   end
	   end
if MSG == 'delmonshitime' then
            redis:del('monshitime')			
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi Time Removed : (*', 1, 'md')
            end
--------------+
if MSG == 'monshi enable' and is_sudo(msg) then
redis:set('monshi','yes')
redis:set("botpm", "<b>slm pm nade sharew kon ta badan pm bedam alan kar drm : )</b>")
sleep(tonumber(sleeptime))
return tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi Has Been Enable : )*', 1, 'md')
end
--------------+
if MSG == 'monshi disable' and is_sudo(msg)then
redis:set('monshi','no')
redis:del('monshi','yes')
redis:del('botpm')
sleep(tonumber(sleeptime))
return tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi Has Been Disable : )*', 1, 'md')
end
--------------+
if MSG and MSG:match('^setmonshi (.*)') and is_sudo(msg) then
local ttt = (redis:get('monshi') or 'no')
if ttt == 'yes' then
       local tex = MSG:match('setmonshi (.*)')
       redis:set('botpm', tex)
	   sleep(tonumber(sleeptime))
	   tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi MSG Seted : )*', 1, 'md')
	   else
	   sleep(tonumber(sleeptime))
	   tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi is Disable*', 1, 'md')
	   end
	   end
---------------+
if MSG and MSG:match('^setmonshisleeptime (%d+)') and is_sudo(msg) then
             local rand = MSG:match('setmonshisleeptime (%d+)')
            redis:set('monshisleep', rand)
			sleep(tonumber(sleeptime))
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi Sleep Time Seted : )*', 1, 'md')
		  print("[ Tabchi Cli Message ]")
            end
if MSG == 'delmonshisleeptime' then
            redis:del('monshisleep')	
                  sleep(tonumber(sleeptime))			
          tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Monshi Sleep Time Removed : (*', 1, 'md')
		  print("[ Tabchi Cli Message ]")
            end
--------------+
if chat_type == 'user' and not is_sudo(msg) and msg.content_.text_ then
    local hash = ('botpm') 
    local pm = redis:get(hash)
    local monshitime = (redis:get('monshitime') or 0)
	local monshisetedtime = (redis:get('monshisetedtime:'..msg.chat_id_) or 0)
if chat_type == "super" or chat_type == "chat" then
return
else
if monshisetedtime == 0 then
local sleep = (redis:get('monshisleep') or 4)
sleep(sleep)
tdcli.sendText(msg.chat_id_ , 0, 1, pm, 0, 'html')
redis:setex('monshisetedtime:'..msg.chat_id_,monshitime,true)
end
end
end
---------------------------------------------------------
if MSG == 'reload' and is_sudo(msg) then
 dofile('./bot/extra.lua')
 dofile('./bot/extra-cli.lua')
 sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_,msg.id_,1,'*Tabchi BOT Reloaded : )*',1,'md')
end
if MSG == 'setservertime' and is_sudo(msg) then
io.popen("cp /usr/share/zoneinfo/Asia/Tehran /etc/location")
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_, msg.id_, 1,'*Server Time Seted To Iran Public Time*', 1, 'md')
end
---------------------------------------------------------
if MSG and MSG:match('^leave (-100)(%d+)$') then
local leave = MSG:match('leave (-100)(%d+)$')
sleep(tonumber(sleeptime))
tdcli.sendText(msg.chat_id_,msg.id_,1,'騎필 훌 新繃綽 할 落 '..leave..' 曠緊 冬.',1,'md')
tdcli.changeChatMemberStatus(leave, TABCHIapi, "Left")
  end
-----------------------------------------------------------
local tgp = redis:scard('tsgps') or 0
local maxgp = redis:get('maxgp') or 0
local joinlink = (redis:get('joinlink') or 'no')
if msg_type == 'MSG' then
if joinlink == 'yes' then
if tonumber(tgp) >= tonumber(maxgp) then
redis:del('jointime')
redis:set('joinlink','no')
redis:del('joinlink','yes')
sleep(tonumber(sleeptime))
tdcli.sendText(full_sudo, msg.id_, 1,'*Join Disabled Because Of Gp Amount !*', 1,'md')
print("[ Join Has Been Disabled Becouse Of GP AMOUNT ]")
else
return 
end
end
end
-----------------------------------------------------------
redis:incr("tallmsg")
-----------------------------------------------------------
end
end
end
      function tdcli_update_callback(data)
 ---------------vardump(data)-------------------------------
    if (data.ID == "UpdateNewMessage") then
     showedit(data.message_,data)
  elseif (data.ID == "UpdateMessageEdited") then
    data = data
    local function edit(extra,result,success)
      showedit(result,data)
    end
     tdcli_function ({ ID = "GetMessage", chat_id_ = data.chat_id_,message_id_ = data.message_id_}, edit, nil)
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({ ID="GetChats",offset_order_="9223372036854775807", offset_chat_id_=0,limit_=20}, dl_cb, nil)
  end
end