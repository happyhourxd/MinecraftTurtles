-- Check if GPS is available

L = _G.arg[1]
W = _G.arg[2]
H = _G.arg[3]


local currentX, currentY, currentZ = gps.locate()

-- Calculate the difference in coordinates
local deltaX = startX - currentX
local deltaY = startY - currentY
local deltaZ = startZ - currentZ

-- Move to the original position
if deltaX > 0 then
    turtle.turnRight()
    for i = 1, deltaX do
        turtle.forward()
    end
    turtle.turnLeft()
elseif deltaX < 0 then
    turtle.turnLeft()
    for i = 1, -deltaX do
        turtle.forward()
    end
    turtle.turnRight()
end

if deltaY > 0 then
    for i = 1, deltaY do
        turtle.up()
    end
elseif deltaY < 0 then
    for i = 1, -deltaY do
        turtle.down()
    end
end

if deltaZ > 0 then
    for i = 1, deltaZ do
        turtle.forward()
    end
elseif deltaZ < 0 then
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, -deltaZ do
        turtle.forward()
    end
end
