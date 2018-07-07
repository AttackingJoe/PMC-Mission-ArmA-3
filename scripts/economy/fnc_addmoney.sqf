_add = 0; // defines the paaram as a number 
params ["_add"]; // the param
accountbalance = _accountbalanace + _add; // account balance plus param (value of cash ot be added) 
publicVariable "accountbalance"; // pushes account balance to public space 
hint format["you now have %1 in your account",accountbalance]; // hint 