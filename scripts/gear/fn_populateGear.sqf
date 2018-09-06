//Init stuff
_crate = gearbox;
["AmmoboxInit",[_crate,false,{true}]] spawn BIS_fnc_arsenal;

//Lists of items to include
_gear = [
"H_Booniehat_oli", "H_Booniehat_tan", "H_Cap_blk", "H_Cap_grn", "H_Cap_oli","U_BG_Guerilla2_1", "U_BG_Guerilla2_3","U_BG_Guerrilla_6_1","V_Rangemaster_belt","hgun_Pistol_heavy_01_MRD_F","11Rnd_45ACP_Mag", "FirstAidKit"
];

_gear = _gear + gearmanifest;
//Populate with predefined items and whatever is already in the crate
[_crate,(backpackCargo _crate)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,(itemCargo _crate) + _gear] call BIS_fnc_addVirtualItemCargo;
[_crate,(magazineCargo _crate)] call BIS_fnc_addVirtualMagazineCargo;
[_crate,(weaponCargo _crate)] call BIS_fnc_addVirtualWeaponCargo;