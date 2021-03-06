//define your options here
_helm = ["H_MilCap_gen_F"] call BIS_fnc_selectRandom;
_clothes = ["U_B_GEN_Commander_F"] call BIS_fnc_selectRandom; 
_vest = ["V_TacVest_gen_F"] call BIS_fnc_selectRandom;
_defaultgun = "arifle_AKM_F";
_defaultmag = "30Rnd_762x39_Mag_F";
_FAC = "FirstAidKit";
//Skip to line 30 define mag counts
//removes old gear
removeAllWeapons _this;
removeAllItems _this;
removeUniform _this; 
removeHeadgear _this;
removeVest _this;
//adds default items
//===============================================================================================
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
//adds defined gear 
_this addHeadgear _helm;
_this forceAddUniform _clothes;
_this addVest _vest;
//===============================================================================================
//Set ammount of Magazines, change second number to desird ammount
for "_i" from 1 to 6 do {_this addItemToVest _defaultmag;};


//Set ammount of FACS, change second number to desird ammount
for "_i" from 1 to 2 do {_this addItemToUniform _FAC;};

//===============================================================================================
//Gun gets added last so it spawns loaded.
_this addWeapon _defaultgun;
