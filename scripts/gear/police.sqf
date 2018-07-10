//define your options here
_unit = _this select 0;
_helm = ["H_MilCap_gen_F"] call BIS_fnc_selectRandom;
_clothes = ["U_B_GEN_Commander_F"] call BIS_fnc_selectRandom; 
_vest = ["V_TacVest_gen_F"] call BIS_fnc_selectRandom;
_defaultgun = "arifle_AKM_F";
_defaultmag = "30Rnd_762x39_Mag_F";
_FAC = "FirstAidKit";
//Skip to line 30 define mag counts
//removes old gear
removeAllWeapons _unit;
removeAllItems _unit;
removeUniform _unit; 
removeHeadgear _unit;
removeVest _unit;
//adds default items
//===============================================================================================
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
//adds defined gear 
_unit addHeadgear _helm;
_unit addUniform _clothes;
_unit addVest _vest;
//===============================================================================================
//Set ammount of Magazines, change second number to desird ammount
for "_i" from 1 to 6 do {_unit addItemToVest _defaultmag;};


//Set ammount of FACS, change second number to desird ammount
for "_i" from 1 to 2 do {_unit addItemToUniform _FAC;};

//===============================================================================================
//Gun gets added last so it spawns loaded.
_unit addWeapon _defaultgun;
