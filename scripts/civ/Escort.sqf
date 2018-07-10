_newCiv = cursorTarget;
_unit = player;
_unitCar = vehicle player;
_inCar = false;
_attached = true;
_act = _unit addaction ["Release", "scripts\civ\cancel.sqf",[_newCiv],5,false,true];

if (_unitCar == _unit) then {_inCar = false;}else{_inCar = true;};

		if (_inCar) then {
			detach _newCiv;
			_newCiv moveInCargo _unitCar;
		};
	_newCiv switchMove "UnaErcPoslechVelitele1..4";
	_unit forceWalk True;
	_newCiv attachTo [_unit,[0.5,1,0]];