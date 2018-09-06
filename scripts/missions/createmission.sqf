_location = [l1,l2,L3,l4,l5,l6,l7,l8,l9,l10] call BIS_fnc_selectRandom;

_controller = _location select 3; 
_Xpos = _location select 1;
_Ypos = _location select 2;
_en = [_xpos,_ypos] nearObjects ["Building", 500];
_enterable = [];
//function to check if building is usable BIS_fnc_isBuildingEnterable;
{
_en = [_x] call BIS_fnc_isBuildingEnterable;

if(_en)then{
_enterable pushBack _x;
};

}forEach _en;

_building = _enterable call BIS_fnc_selectRandom; 

hint format["you have %1 in cash",_building];
if (_controller isEqualTo "Government") 
then {
_tasktype = ["attack"] call BIS_fnc_selectRandom;
[_building,_tasktype] call function_fnc_govmission;
}else 
{ if (_controller isEqualTo "Cartel") 
then {
_tasktype = ["attack"] call BIS_fnc_selectRandom;
[_building,_tasktype] call function_fnc_govmission;
}else
{if (_controller isEqualTo "ION") 
then {
_tasktype = ["attack"] call BIS_fnc_selectRandom;
[_building,_tasktype] call function_fnc_govmission;
}else
{hint "WHAT THE FUCK";};
}};
