
params ["_cost", "_item"];
if (accountbalance > _cost) then { 
accountbalance = accountbalance - _cost; 
	this addWeapon _item;
;}
else 
{ hint format["You can't afford this."]};

hint format["passed variable %1", _item];

