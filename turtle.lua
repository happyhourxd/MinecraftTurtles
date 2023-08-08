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
    end
    L= L - 1
    tonumber(L)
    tonumber(W)
    tonumber(H)
    print(type(j), " ", type(W))
    if (j < W) then
        if (RightOrLeft == 0) then
            RightOrLeft = 1
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
        else
            RightOrLeft = 0
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft() 
        end
    end
end