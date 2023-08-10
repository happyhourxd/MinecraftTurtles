function wait ( seconds )
end


hasGps = false

X, Y, Z = gps.locate()

if not (X == nil) then
    hasGps = true
end

LOWESTY = -60

print("what size should i mine?")
print("only do the first two for now")
L = read()
W = read()
H = read() --disabled for testing

NeededFuel = (L * W * H) + L + W + H

RightOrLeft = 1
direction = .5 -- in pi radians


L = tonumber(L)
W = tonumber(W)
H = tonumber(H)

for j = 1,W,1
do
    for k = 1,L,1
    do
        turtle.forward()
    end
    L= L - 1

    print(type(j), " ", type(W))
    if (j < W) then
        if (RightOrLeft == 0) then
            RightOrLeft = 1
            turtle.turnRight()
            wait(2)
            turtle.forward()
            wait(2)
            turtle.turnRight()
            wait(2)
        else
            RightOrLeft = 0
            turtle.turnLeft()
            wait(2)
            turtle.forward()
            wait(2)
            turtle.turnLeft() 
            wait(2)
        end
    end
end