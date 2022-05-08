dofile("html.lua")

print("Application Started")
baseServoPin = 1
leftServoPin = 2
rightServoPin = 3
clawServoPin = 4

pwm.setup(clawServoPin, 50, 20)
pwm.setup(leftServoPin, 50, 100)
pwm.setup(rightServoPin, 50, 100)
pwm.setup(baseServoPin, 50, 40)

pwm.start(clawServoPin)
pwm.start(leftServoPin)
pwm.start(rightServoPin)
pwm.start(baseServoPin)


-- Split Function
function mysplit (inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function setServoPos(pin, pos)
  print("Servo Position = " .. pos)
  dc = ((110/180)*pos) + 20
  print("Duty Cycle = " .. dc)
  pwm.setduty(pin, dc)
  return
end


srv = net.createServer(net.TCP)
srv:listen(80, function(conn) 
  conn:on('receive', function(client, request) 
    -- print(request)
    
    find = {string.find(request, 'slider')}
    if #find ~= 0 then
      args = string.sub(request, find[2]+2, #request)
      
      local servo = {}
      
      sl = mysplit(args, "&")
      servo.name = mysplit(sl[1], "=")[2]
      
      if (sl[2] ~= nil) then
        local n = 0
        for k, v in string.gmatch(sl[2], "(%w+)=(%w+)") do
          if string.match(k, "value") then
            servo.pos = tonumber(v)
          end
        end
      end

      if (servo.name == "clawServo") then
        setServoPos(clawServoPin, servo.pos)
      elseif (servo.name == "leftServo") then
        setServoPos(leftServoPin, servo.pos)
      elseif (servo.name == "rightServo") then
        setServoPos(rightServoPin, servo.pos)
      elseif (servo.name == "baseServo") then
        setServoPos(baseServoPin, servo.pos)
      else
        print("No servo changed")
      end
    end
    
    client:send(_html)
    conn:on("sent", function(c) c:close() end)
  end)
end)