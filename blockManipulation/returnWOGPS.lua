L = _G.arg[1]
W = _G.arg[2]
H = _G.arg[3]


-- Move back to the initial level
for i = 1, H - 1, 1 do
    turtle.down()
end

if ((not ((W % 2) == 0)) and (not ((H % 2) == 0))) then -- W = 5, H = 1
    print("odd Width, and odd hidth")
    for i = 1, L - 1,1 
    do
        turtle.forward()
    end
    turtle.turnLeft()
    for i = 1, W - 1,1 
    do
        turtle.forward()
    end
    turtle.turnLeft()
elseif (((W % 2) == 0) and (not(H % 2) == 0)) then -- W = 4, H = 1
    --todo?
    print("even width odd highth")
    turtle.turnLeft()
    for i = 1, L - 1, 1 do
        turtle.forward()
    end
    turtle.turnLeft()
elseif (((H % 2) == 0) and (not ((W % 2) == 0))) then -- W  = 5, H = 2
    --todo
    print("odd width even highth")
else --done W = 4, H = 2
    print("even width even highth")
    turn
end


