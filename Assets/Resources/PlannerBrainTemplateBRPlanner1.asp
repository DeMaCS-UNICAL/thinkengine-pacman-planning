%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%pacmanSensor(pacman,objectIndex(Index),transform(position(x(Value)))).
%pacmanSensor(pacman,objectIndex(Index),transform(position(y(Value)))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),transform(position(x(Value)))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),transform(position(y(Value)))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostHome(enabled(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostScatter(enabled(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostChase(enabled(Value))).
%ghostBaseSensor(ghostPinky,objectIndex(Index),ghostFrightened(enabled(Value))).
%nodeSensor(nodeClone,objectIndex(Index),transform(position(x(Value)))).
%nodeSensor(nodeClone,objectIndex(Index),transform(position(y(Value)))).
%nodeSensor(nodeClone,objectIndex(Index),node(availableDirections(Index1,vector2(x(Value))))).
%nodeSensor(nodeClone,objectIndex(Index),node(availableDirections(Index1,vector2(y(Value))))).
%pelletSensor(pelletClone,objectIndex(Index),active(Value)).
%pelletSensor(pelletClone,objectIndex(Index),transform(position(x(Value)))).
%pelletSensor(pelletClone,objectIndex(Index),transform(position(y(Value)))).
%powerPelletSensor(powerPelletClone,objectIndex(Index),transform(position(x(Value)))).
%powerPelletSensor(powerPelletClone,objectIndex(Index),transform(position(y(Value)))).
%powerPelletSensor(powerPelletClone,objectIndex(Index),active(Value)).
% Predicates for Action invokation.
% applyAction(OrderOfExecution,ActionClassName).
% actionArgument(ActionOrder,ArgumentName, ArgumentValue).
