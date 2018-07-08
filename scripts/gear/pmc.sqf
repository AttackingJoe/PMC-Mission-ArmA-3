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
//===============================================================================================
//Set MAG numbers, repeat for desired number of magazines
for "_i" from 1 to 3 do {this addItemToUniform "30Rnd_762x39_Mag_F";};
//this addMagazine "11Rnd_45ACP_Mag";

//Set FAC  numbers, repeat for desired number of FACS
//this addItem _FAC;
//this addItem _FAC;

//===============================================================================================
//adds defined gear 
this addHeadgear _helm;
this addUniform _clothes;
this addVest _vest;
this addWeapon _defaultgun;