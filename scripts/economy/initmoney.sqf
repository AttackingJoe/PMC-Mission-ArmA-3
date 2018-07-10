//define variables
//=====================================================================

//add a money variable
missionNamespace setVariable ["accountbalance", 1,true];

//define a gear variable
missionNamespace setVariable ["gearmanifest", 1,true];

 //define a cars and other vehicles variable
missionNamespace setVariable ["vehiclepool", 1,true];

 //define functions
 //======================================================================
 //add money to the account
addMoney = compile preProcessFile "scripts\economy\fn_addmoney.sqf";

//take money from the account
subMoney = compile preProcessFile "scripts\economy\fn_submoney.sqf";

//add gear to the roster
addManifest = compile preProcessFile "scripts\economy\fn_addGear.sqf";

//take gear from the roster
subManifest = compile preProcessFile "scripts\economy\fn_subGear.sqf";

//add cars to the roster
addPool = compile preProcessFile "scripts\economy\fn_addCar.sqf";

//take cars from the roster
subPool = compile preProcessFile "scripts\economy\fn_subCar.sqf";

//addEverything to the VA box (name is somthing fitting and note it here)
setAmmoBox = compile preProcessFile "scripts\economy\fn_setGear.sqf";

//Add cars to spawn to a box (name it carbox or somthing and note it here)
setCarBox = compile preProcessFile "scripts\economy\fn_setCarbox.sqf";

//add check functionality

	//add function to check money

//add functionality to select rewards
	
	//add the ability to chose rewards for missions based on dificulty.