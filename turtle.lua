print("What should the turtle do? 'replace' or 'mine'?")
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
else
    print("What size should I replace?")
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
    -- Continue after "return.lua" has finished executing
    turtle.up()
    print("please echange blocks")
    read()
    shell.run("blockManipulation/replace.lua")  -- Execute "replace.lua"
    shell.run("blockManipulation/returnWOGPS")
end
    