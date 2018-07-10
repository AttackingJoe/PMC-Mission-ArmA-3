_unit = _this select 0;
[_unit] execVM "scripts\gear\pmc.sqf";
_unit addaction ["Interact Menu", "Scripts\civ\Investigate.sqf"];
