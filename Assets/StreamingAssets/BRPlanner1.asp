%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(x(Value))).
%powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(y(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(x(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(y(Value))).
%pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(key(Value))))).
%pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(value(Value))))).
%pacmanSensor(pacman,objectIndex(Index),movement(intDirection(x(Value)))).
%pacmanSensor(pacman,objectIndex(Index),movement(intDirection(y(Value)))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(x(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(y(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostHome(enabled(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostScatter(enabled(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostChase(enabled(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostFrightened(enabled(Value))).
%pelletSensor(pelletClone,objectIndex(Index),positionToInt(x(Value))).
%pelletSensor(pelletClone,objectIndex(Index),positionToInt(y(Value))).






%%%%%INPUT PARSING%%%%%
pacman(X,Y):-pacmanSensor(pacman,objectIndex(Index),positionToInt(x(X))),pacmanSensor(pacman,objectIndex(Index),positionToInt(y(Y))).
pacmanDir(Dx,Dy):-pacmanSensor(pacman,objectIndex(Index),movement(intDirection(x(Dx))),pacmanSensor(pacman,objectIndex(Index),movement(intDirection(y(Dy)))).

walls(X,Y):-pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(key(X))))),pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(value(Y))))).

%node(Index,X,Y):-nodeSensor(nodeClone,objectIndex(Index),positionToInt(x(X))),nodeSensor(nodeClone,objectIndex(Index),positionToInt(y(Y))).
%nodeDirection(Index,X,Y):-nodeSensor(nodeClone,objectIndex(Index),node(intDirections(Index1,keyValuePair2(key(X))))),nodeSensor(nodeClone,objectIndex(Index),node(intDirections(Index1,keyValuePair2(value(Y))))).

pellet(X,Y):-pelletSensor(pelletClone,objectIndex(Index),positionToInt(y(Y))),pelletSensor(pelletClone,objectIndex(Index),positionToInt(x(X))).
powerPellet(X,Y):-powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(x(X))),powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(y(Y))).

ghost(Index,X,Y):-ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(x(X))), ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(y(Y))).
ghostIs(Index,scatter):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostScatter(enabled(true))).
ghostIs(Index,home):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostHome(enabled(true))).
ghostIs(Index,chase):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostChase(enabled(true))).
ghostIs(Index,frightened):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostFrightened(enabled(true))).

sameLineWalls(Px,Y) :- pacman(Px,Py), walls(Px,Y), Y>Py, pacmanDir(_,Dy), Dy>0.
sameLineWalls(X,Py) :- pacman(_,Py), walls(X,Py).
wallsDistances(Wx,Wy, SqrD):- pacman(Px,Py), sameLineWalls(Wx,Wy), Dx=Px-Wx, Dy=Py-Wy, SqrDx = Dx*Dx, SqrDy = Dy*Dy, SqrD = SqrDx+SqrDy.
closestWalls(X,Y,SqrD) :- wallsDistances(Wx,Wy,SqrD)
ipoteticalPacmanPos(Px,Py,X,Y):-pacman(Px,Py), DeltaX = Dx*3, DeltaY = Dy*3, pacmanDir(Dx,Dy).
pacmanWillBeAt(X,Y):-ipoteticalPacmanPos(X,Y), not walls(Wx,Wy), pacmanDir(Dx,Dy), Dx>0, Wx>Px, Wx<=X.  
pacmanWillBeAt(X,Y):-ipoteticalPacmanPos(X,Y), not walls(Wx,Wy), pacmanDir(Dx,Dy), Dx<0, Wx<Px, Wx>=X.  
pacmanWillBeAt(X,Y):-ipoteticalPacmanPos(X,Y), not walls(Wx,Wy), pacmanDir(Dx,Dy), Dy>0, Wy>Py, Wy<=Y.  
pacmanWillBeAt(X,Y):-ipoteticalPacmanPos(X,Y), not walls(Wx,Wy), pacmanDir(Dx,Dy), Dy<0, Wy<Py, Wy>=Y.  


{goTo(Dx,Dy,Nx,Ny):nearestNode(I,Nx,Ny),nodeDirection(I,Dx,Dy)}=1:-pacman(_,_).

applyAction(0,"GoTo"):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"DirectionX",Dx):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"DirectionY",Dy):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"NodeX",Nx):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"NodeY",Ny):- goTo(Dx,Dy,Nx,Ny).

