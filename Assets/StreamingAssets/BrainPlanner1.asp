%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%blinkySensor(blinky,objectIndex(Index),positionToInt(x(Value))).
%blinkySensor(blinky,objectIndex(Index),positionToInt(y(Value))).
%clydeSensor(clyde,objectIndex(Index),positionToInt(x(Value))).
%clydeSensor(clyde,objectIndex(Index),positionToInt(y(Value))).
%inkySensor(inky,objectIndex(Index),positionToInt(x(Value))).
%inkySensor(inky,objectIndex(Index),positionToInt(y(Value))).
%pinkySensor(pinky,objectIndex(Index),positionToInt(x(Value))).
%pinkySensor(pinky,objectIndex(Index),positionToInt(y(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(x(Value))).
%pacmanSensor(pacman,objectIndex(Index),positionToInt(y(Value))).
%pacdotsSensor(pacdots,objectIndex(Index),mazeTiles(tiles(Index1,Index2,myTile(y(Value))))).
%pacdotsSensor(pacdots,objectIndex(Index),mazeTiles(tiles(Index1,Index2,myTile(x(Value))))).
%pacdotsSensor(pacdots,objectIndex(Index),mazeTiles(tiles(Index1,Index2,myTile(occupied(Value))))).
%pacdotsSensor(pacdots,objectIndex(Index),mazeTiles(tiles(Index1,Index2,myTile(pacdot(Value))))).
%brainSensor(brain,objectIndex(Index),aISupportScript(previousMove(Value))).
%brainSensor(brain,objectIndex(Index),aISupportScript(powerup(Value))).
%brainSensor(brain,objectIndex(Index),aISupportScript(distanceClosestPellet(Value))).
%brainSensor(brain,objectIndex(Index),aISupportScript(closestPelletX(Value))).
%brainSensor(brain,objectIndex(Index),aISupportScript(closestPelletY(Value))).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),).
%brainSensor(brain,objectIndex(Index),aISupportScript(cont(Value))).
%For ASP programs:
% Predicates for Action invokation.
% applyAction(OrderOfExecution,ActionClassName).
% actionArguments(OrderOfExecution,ArgumentName, ArgumentValue).
applyAction(0,planExecutor).
actionArguments(0,direction,right).
actionArguments(1,direction,up).

