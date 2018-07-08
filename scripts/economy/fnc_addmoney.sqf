params ["_addBal","_oldBal","_newBal"]; // the param
_oldBal = missionNamespace getVariable accountbalance;
_newBal = _oldBal + _addBal;
missionNamespace setVariable [accountbalance, _newBal];
publicVariable accountbalance; 

