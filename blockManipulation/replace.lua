-- User input for mine size
L = _G.arg[1]
W = _G.arg[2]
H = _G.arg[3]

L = tonumber(L)
W = tonumber(W)
H = tonumber(H)


-- Calculate needed fuel
NeededFuel = (L * W * H) + L + W + H
print(turtle.getFuelLevel())
while (NeededFuel > turtle.getFuelLevel()) do
    print("Enter ", (NeededFuel - turtle.getFuelLevel()) / 10, "coal")
    read()
    turtle.refule(1)
end

--calculate needed blocks
amountOfBlocksNeeded = (L * W * H)
amtOfBlocks = 0
while (amountOfBlocksNeeded > amtOfBlocks) do
    for i = 1, 16, 1 do
        amtOfBlocks = amtOfBlocks + turtle.getItemCount(i)
    end
    if (amountOfBlocksNeeded > amtOfBlocks) then
        print("enter ", amountOfBlocksNeeded - amtOfBlocks, " blocks")
        read()
    end
end

-- Initialize direction variables
RightOrLeft = 1
direction = 0.5 -- in pi radians


a = 1
-- Loop through each layer of the mine (height)
for i = 1, H do
    -- Loop through each row (width)
    for j = 1, W do
        -- Loop through each column (length)
        for k = 2, L do
            if (turtle.getItemCount(a) >= 1) then
                turtle.placeDown()
            else
                a = a + 1
                turtle.select(a)
                turtle.placeDown()
            end
            turtle.forward()
        end        
        -- Handle turning and changing direction
        if j < W then
            if RightOrLeft == 0 then
                RightOrLeft = 1
                turtle.placeDown()
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
                direction = direction - 1
            else
                RightOrLeft = 0
                turtle.placeDown()
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
        turtle.placeDown()
        height = height + 1
    end
    
    -- Turn around after completing a layer
    turtle.turnRight()
    turtle.turnRight()
    direction = direction + 1
end