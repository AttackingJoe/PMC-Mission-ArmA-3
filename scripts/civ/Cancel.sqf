_newCiv = _this select 3 select 0;
detach _newCiv;
player forceWalk False;
canceled = 1;
removeAllActions player;
player addaction ["Interact Menu", "Scripts\civ\Investigate.sqf"];