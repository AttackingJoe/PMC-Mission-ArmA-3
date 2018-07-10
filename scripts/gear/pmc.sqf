//define your options here
_helm = ["H_Booniehat_oli", "H_Booniehat_tan", "H_Cap_blk", "H_Cap_grn", "H_Cap_oli"] call BIS_fnc_selectRandom;
_clothes = ["U_BG_Guerilla2_1", "U_BG_Guerilla2_3","U_BG_Guerrilla_6_1"] call BIS_fnc_selectRandom; 
_vest = ["V_Rangemaster_belt"] call BIS_fnc_selectRandom;
_defaultgun = "hgun_Pistol_heavy_01_MRD_F";
_defaultmag = "11Rnd_45ACP_Mag";
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
