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


print(L, " ", W, " ", H)

 
for j = 1,W,1
do
    for k = 1,L,1
    do
        turtle.forward()
        print(j, " is j ",k, " is k ")
    end
    L = L - 1 -- this is a test
    if not (j == W) then
        if (RightOrLeft == 0) then
            RightOrLeft = 1
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            direction = direction - .5
        else
            RightOrLeft = 0
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            direction = direction + .5
        end
    end
    if not ((W % 2) and (j == W)) then
        print(direction, "this should be .5")
        turtle.turnLeft()
    else
        print(direction, "this shouldn't be 0 i think?")
        turtle.turnRight()
    end
end
