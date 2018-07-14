_unit = _this select 0;
_unit call function_fnc_pmcgear;
_unit addaction ["Interact Menu", "Scripts\civ\Investigate.sqf"];
[] spawn fn_forceUpdate;