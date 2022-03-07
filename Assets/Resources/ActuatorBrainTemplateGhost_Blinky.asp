%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%pacmanSensor(pacman,objectIndex(Index),positionToInt(x(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(y(Value))).
%pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(key(Value))))).
%pacmanSensor(pacman,objectIndex(Index),pacman(wallsPosition(Index1,keyValuePair2(value(Value))))).
%pacmanSensor(pacman,objectIndex(Index),movement(intDirection(x(Value)))).
%pacmanSensor(pacman,objectIndex(Index),movement(intDirection(y(Value)))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),positionToInt(x(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),positionToInt(y(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostHome(enabled(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostScatter(enabled(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostChase(enabled(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostFrightened(enabled(Value))).
%Actuators:
setOnActuator(ghostBlinkyActuator(ghostBlinky,objectIndex(Index),movement(direction(x(Value))))) :-objectIndex(ghostBlinkyActuator, Index), .
setOnActuator(ghostBlinkyActuator(ghostBlinky,objectIndex(Index),movement(direction(y(Value))))) :-objectIndex(ghostBlinkyActuator, Index), .
