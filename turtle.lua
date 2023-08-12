-- Check if GPS is available
hasGps = false
X, Y, Z = gps.locate()
if X ~= nil then
    hasGps = true
end

-- Set initial values
LOWESTY = -60
height = 0

-- User input for mine size
print("What size should I mine?")
print("Enter length:")
L = tonumber(read())
print("Enter width:")
W = tonumber(read())
print("Enter height:") -- This is disabled for testing
H = tonumber(read())

-- Calculate needed fuel
NeededFuel = (L * W * H) + L + W + H

-- Initialize direction variables
RightOrLeft = 1
direction = 0.5 -- in pi radians

-- Convert dimensions to numbers
L = tonumber(L)
W = tonumber(W)
H = tonumber(H)

-- Loop through each layer of the mine (height)
for i = 1, H do
    -- Loop through each row (width)
    for j = 1, W do
        -- Loop through each column (length)
        for k = 2, L do
            turtle.forward()
        end

        print(RightOrLeft)
        
        -- Handle turning and changing direction
        if j < W then
            if RightOrLeft == 0 then
                RightOrLeft = 1
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
                direction = direction - 1
            else
                RightOrLeft = 0
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                direction = direction + 1
            end
        end
    end
    
    -- Move up a layer
    if i < H then
        turtle.up()
        height = height + 1
    end
    
    -- Turn around after completing a layer
    turtle.turnRight()
    turtle.turnRight()
end

-- Move back to the initial level
for i = 1, height do
    turtle.down()
end

if not ((W % 2) == 0) then
    for j = 1, W - 1 do
        turtle.forward()
    end
    turtle.turnRight()
end

for k = 1, L - 1 do
    turtle.forward()
end

-- Here you need to complete your logic based on 'direction'
if direction == 1.5 or direction == -0.5 then
    for i = 1,(direction % .5),1
    do
        turtle.turnLeft()
    end
end

-- Return to the original X, Y, and Z using GPS if available
if hasGps then
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
end

-- from here down is homing

-- Move back to the initial level
for i = 1, height do
    turtle.down()
end

if not ((W % 2) == 0) then
    for j = 1, W - 1 do
        turtle.forward()
    end
    turtle.turnRight()
end

for k = 1, L - 1 do
    turtle.forward()
end

-- Here you need to complete your logic based on 'direction'
if direction == 1.5 or direction == -0.5 then
    for i = 1,(direction % .5),1
    do
        turtle.turnLeft()
    end
end
