//define your options here
_helm = ["H_MilCap_gen_F"] call BIS_fnc_selectRandom;
_clothes = ["U_B_GEN_Commander_F"] call BIS_fnc_selectRandom; 
_vest = ["V_TacVest_gen_F"] call BIS_fnc_selectRandom;
_defaultgun = "arifle_AKM_F";
_defaultmag = "30Rnd_762x39_Mag_F";
_FAC = "FirstAidKit";
//Skip to line 30 define mag counts
//removes old gear
removeAllWeapons this;
removeAllItems this;
removeUniform this; 
removeHeadgear this;
removeVest this;
//adds default items
//===============================================================================================
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "ItemGPS";
//adds defined gear 
this addHeadgear _helm;
this forceAddUniform _clothes;
this addVest _vest;
//===============================================================================================
//Set ammount of Magazines, change second number to desird ammount
for "_i" from 1 to 6 do {this addItemToVest _defaultmag;};


//Set ammount of FACS, change second number to desird ammount
for "_i" from 1 to 2 do {this addItemToUniform _FAC;};

//===============================================================================================
//Gun gets added last so it spawns loaded.
this addWeapon _defaultgun;
