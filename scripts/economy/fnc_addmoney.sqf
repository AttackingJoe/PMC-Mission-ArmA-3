params ["_add"]; // the param
_newbalance = _add + accountbalanace; // account balance plus param (value of cash ot be added) 
missionNamespace setVariable [accountbalance, _newbalance];
publicVariable accountbalance; // pushes account balance to public space 
hint format["you now have %1 in your account",accountbalanace]; // hint 
accountbalanace;

