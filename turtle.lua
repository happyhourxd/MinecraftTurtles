print("What should the turtle do? 'replace', 'mine', or 'replace floor'?")
task = read()


hasGps = false
X, Y, Z = gps.locate()
if X ~= nil then
    hasGps = true
end    


if task == "mine" then
    print("What size should I mine?")
    print("Enter length:")
    L = tonumber(read())
    print("Enter width:")
    W = tonumber(read())
    print("Enter height:")
    H = tonumber(read())

    _G.arg = {L, W, H}
    shell.run("blockManipulation/mine.lua")  -- Execute "mine.lua"
    -- Continue after "mine.lua" has finished executing
    shell.run("blockManipulation/returnWOGPS.lua")  -- Execute "return.lua"
elseif (task == "replace") then
    print("What size should I replace?")
    print("Enter length:")
    L = tonumber(read())
    print("Enter width:")
    W = tonumber(read())
    print("Enter height:")
    H = tonumber(read())


    _G.arg = {L, W, H + 1}
    turtle.digDown()
    turtle.down()
    shell.run("blockManipulation/mine.lua")  -- Execute "mine.lua"
    -- Continue after "mine.lua" has finished executing
    shell.run("blockManipulation/returnWOGPS.lua")  -- Execute "return.lua"
    -- Continue after "return.lua" has finished executing
    turtle.up()
    print("please echange blocks")
    read()
    shell.run("blockManipulation/replace.lua")  -- Execute "replace.lua"
    turtle.up()
    shell.run("blockManipulation/returnWOGPS")
else
    print("What size should I replace?")
    print("Enter length:")
    L = tonumber(read())
    print("Enter width:")
    W = tonumber(read())
    print("Enter height:")
    H = tonumber(read())


    _G.arg = {L, W, H+1}
    turtle.digDown()
    turtle.down()
    shell.run("blockManipulation/mine.lua")  -- Execute "mine.lua"
    -- Continue after "mine.lua" has finished executing
    shell.run("blockManipulation/returnWOGPS.lua")  -- Execute "return.lua"
    -- Continue after "return.lua" has finished executing
    turtle.up()
    print("please echange blocks")
    read()
    _G.arg = {L,W,1}
    shell.run("blockManipulation/replace.lua")  -- Execute "replace.lua"
    turtle.up()
    shell.run("blockManipulation/returnWOGPS")