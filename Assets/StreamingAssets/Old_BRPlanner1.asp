%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(x(Value))).
%powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(y(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(x(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(y(Value))).
%pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(key(Value))))).
%pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(value(Value))))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(x(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(y(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostHome(enabled(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostScatter(enabled(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostChase(enabled(Value))).
%ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostFrightened(enabled(Value))).
%pelletSensor(pelletClone,objectIndex(Index),positionToInt(x(Value))).
%pelletSensor(pelletClone,objectIndex(Index),positionToInt(y(Value))).
%nodeSensor(nodeClone,objectIndex(Index),positionToInt(x(Value))).
%nodeSensor(nodeClone,objectIndex(Index),positionToInt(y(Value))).
%nodeSensor(nodeClone,objectIndex(Index),node(intDirections(Index1,keyValuePair2(key(Value))))).
%nodeSensor(nodeClone,objectIndex(Index),node(intDirections(Index1,keyValuePair2(value(Value))))).






%%%%%INPUT PARSING%%%%%
pacman(X,Y):-pacmanSensor(pacman,objectIndex(Index),positionToInt(x(X))),pacmanSensor(pacman,objectIndex(Index),positionToInt(y(Y))).

walls(X,Y):-pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(key(X))))),pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(value(Y))))).

node(Index,X,Y):-nodeSensor(nodeClone,objectIndex(Index),positionToInt(x(X))),nodeSensor(nodeClone,objectIndex(Index),positionToInt(y(Y))).
nodeDirection(Index,X,Y):-nodeSensor(nodeClone,objectIndex(Index),node(intDirections(Index1,keyValuePair2(key(X))))),nodeSensor(nodeClone,objectIndex(Index),node(intDirections(Index1,keyValuePair2(value(Y))))).

pellet(X,Y):-pelletSensor(pelletClone,objectIndex(Index),positionToInt(y(Y))),pelletSensor(pelletClone,objectIndex(Index),positionToInt(x(X))).
powerPellet(X,Y):-powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(x(X))),powerPelletSensor(powerPelletClone,objectIndex(Index),positionToInt(y(Y))).

ghost(Index,X,Y):-ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(x(X))), ghostBaseSensor(ghostBlinky,objectIndex(Index),positionToInt(y(Y))).
ghostIs(Index,scatter):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostScatter(enabled(true))).
ghostIs(Index,home):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostHome(enabled(true))).
ghostIs(Index,chase):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostChase(enabled(true))).
ghostIs(Index,frightened):-ghostBaseSensor(ghostBlinky,objectIndex(Index),ghostFrightened(enabled(true))).



%%%Chosing a node if it's aligned with the pacman and no wall is on the path
%eligibleNode(Index,Nx,Ny):-node(Index,Nx,Ny), pacman(Nx,Py), Py>Ny, nodeDirection(Index,0,1).
%eligibleNode(Index,Nx,Ny):-node(Index,Nx,Ny), pacman(Nx,Py), Py<Ny, nodeDirection(Index,0,-1).
%eligibleNode(Index,Nx,Ny):-node(Index,Nx,Ny), pacman(Px,Ny), Px>Nx, nodeDirection(Index,1,0).
%eligibleNode(Index,Nx,Ny):-node(Index,Nx,Ny), pacman(Px,Ny), Px<Nx, nodeDirection(Index,-1,0).
eligibleNode(Index,Nx,Ny):-node(Index,Nx,Ny), pacman(Nx,Ny).
eligibleNode(Index,Nx,Ny):-node(Index,Nx,Ny), pacman(Px,Ny), not wall(Wx,Ny), Wx>=Px, Wx<=Nx.
%eligibleGhost(Index,Gx,Gy):-ghost(Index,Gx,Gy),pacman(Gx,Py), not eligibleNode
%sqrDistanceFromNode(Index,SqrD):- eligibleNode(Index,Nx,Ny), pacman(Px,Py), Dx = Nx-Px, Dy=Ny-Py, SqrDx=Dx*Dx, SqrDy=Dy*Dy, SqrD=SqrDx+SqrDy.

%nearestNode(Index,Nx,Ny):- node(Index,Nx,Ny), sqrDistanceFromNode(Index,SqrD), #min{SqrD1:sqrDistanceFromNode(I,SqrD1)}=SqrD.

%runaway(X,Y):- nearestNode(ID,_,_), sqrDistanceFromNode(ID,Dn),
nextNodes(N1,N2,x,1):-node(N1,X,Y1),node(N2,X,Y2), Y1>Y2, not node(N3,X,Y3), node(N3,_,Y3), Y3>Y1, Y3<Y2.
nextNodes(N1,N2,y,1):-node(N1,X1,Y),node(N2,X2,Y), X1>X2, not node(N3,X3,Y), node(N3,X3,_), X3>X1, X3<X2.
nextNodes(N2,N1,x,-1):-nextNodes(N1,N2,x,1).
nextNodes(N2,N1,y,-1):-nextNodes(N1,N2,y,1).

{goTo(Dx,Dy,Nx,Ny):nearestNode(I,Nx,Ny),nodeDirection(I,Dx,Dy)}=1:-pacman(_,_).

applyAction(0,"GoTo"):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"DirectionX",Dx):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"DirectionY",Dy):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"NodeX",Nx):- goTo(Dx,Dy,Nx,Ny).
actionArgument(0,"NodeY",Ny):- goTo(Dx,Dy,Nx,Ny).

