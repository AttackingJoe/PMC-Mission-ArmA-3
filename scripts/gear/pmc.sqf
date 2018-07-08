params ["_unit"];

//define your options here
_helm = ["H_Booniehat_oli", "H_Booniehat_tan", "H_Cap_blk", "H_Cap_grn", "H_Cap_oli"] call BIS_fnc_selectRandom;
_clothes = ["U_BG_Guerilla2_1", "U_BG_Guerilla2_3","U_BG_Guerrilla_6_1"] call BIS_fnc_selectRandom; 
_vest = ["V_Rangemaster_belt"] call BIS_fnc_selectRandom;
_defaultgun = "hgun_Pistol_heavy_01_MRD_F";
_defaultmag = "11Rnd_45ACP_Mag";
_FAC = "FirstAidKit";
//Skip to line 30 and 31 to define mag counts
//removes old gear
removeAllWeapons _unit;
removeAllItems _unit;
removeUniform _unit; 
removeHeadgear _unit;
removeVest _unit;
//adds default items
_unit addItem "ItemWatch";
_unit addItem "ItemCompass";
_unit addItem "ItemGPS";
_unit addItem "ItemRadio";
_unit addItem "ItemMap";
_unit assignItem "ItemWatch";
_unit assignItem "ItemCompass";
_unit assignItem "ItemGPS";
_unit assignItem "ItemRadio";
_unit assignItem "ItemMap";
//Set Mag and FAC Numbers

{ _unit addMagazine _defaultmag;} forEach [1, 2, 3, 4, 5, 6]; 
{ _unit addItem _FAC;} forEach [1, 2];

//adds defined gear 
_unit addHeadgear _helm;
_unit addUniform _clothes;
_unit addVest _vest;
_unit addWeapon _defaultgun;