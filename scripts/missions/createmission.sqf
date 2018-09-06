_location = [l1,l2,L3,l4,l5,l6,l7,l8,l9,l10] call BIS_fnc_selectRandom; // picks a random location as defined in scripts\missions\locations.sqf

_controller = _location select 3;  //defines controlling faction of the chosen town

_Xpos = _location select 1; 
_Ypos = _location select 2;// defines coordinate of chosen town

_en = [_xpos,_ypos] nearObjects ["Building", 500]; //returns all buildings in the town
_enterable = [];// defines variable for later use 

{
_en = [_x] call BIS_fnc_isBuildingEnterable; 

if(_en)then{
_enterable pushBack _x;
};

}forEach _en;
//pushes all enterable buildings into the _enterable array

_building = _enterable call BIS_fnc_selectRandom; // picks a random building of the possible entering buildings 


//looks at the controlling faction of the town and generates an appropriate mission
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
{hint "Mission Generator has broken, has chosen option 4 out of 3 possible options.";};
}};
