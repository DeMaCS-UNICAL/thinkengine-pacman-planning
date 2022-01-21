%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%bRSensor(bR,objectIndex(Index),gameObject(transform(position(x(Value))))).
%bRSensor(bR,objectIndex(Index),gameObject(transform(position(y(Value))))).
%bRSensor(bR,objectIndex(Index),gameObject(transform(position(z(Value))))).
%For ASP programs:
% Predicates for Action invokation.
% applyAction(OrderOfExecution,ActionClassName).
% actionArguments(OrderOfExecution,ArgumentName, ArgumentValue).
applyAction(0,azioneStupida).
actionArgument(0,"Color",green).
applyAction(1,azioneStupida).
actionArgument(1,"Color",red).
