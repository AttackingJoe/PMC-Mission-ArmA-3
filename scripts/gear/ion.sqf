
//define your options here
_unit = _this select 0;
_helm = ["H_Cap_blk_ION"] call BIS_fnc_selectRandom;
_clothes = ["U_C_Journalist"] call BIS_fnc_selectRandom; 
_vest = ["V_TacVest_blk"] call BIS_fnc_selectRandom;
_backpack = ["B_LegStrapBag_black_F"] call BIS_fnc_selectRandom;
_defaultgun = "arifle_SPAR_01_blk_F";
_defaultmag = "30Rnd_556x45_Stanag";
_FAC = "FirstAidKit";
//Skip to line 29 define mag counts
//removes old gear
removeAllWeapons _unit;
removeAllItems _unit;
removeUniform _unit; 
removeHeadgear _unit;
removeVest _unit;
//adds default items Do not 
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
//adds defined gear 
_unit addHeadgear _helm;
_unit addUniform _clothes;
_unit addVest _vest;
_unit addBackpack _backpack;
//===============================================================================================
//Set ammount of Magazines, change second number to desird ammount
for "_i" from 1 to 6 do {_unit addItemToVest _defaultmag;};


//Set ammount of FACS, change second number to desird ammount
for "_i" from 1 to 2 do {_unit addItemToUniform _FAC;};

//===============================================================================================
//Gun gets added last so it spawns loaded.
_unit addWeapon _defaultgun;
