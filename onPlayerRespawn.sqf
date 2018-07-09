_unit = _this select 0;
[_unit] execVM "scripts\gear\pmc.sqf";
_unit removeAllActions;
act1 = _unit addaction ['<t color="#003300">' + "Investigation Menu" + '</t>', "Scripts\Investigate.sqf", [], 5, false, false, "", "_target == _unit"];
