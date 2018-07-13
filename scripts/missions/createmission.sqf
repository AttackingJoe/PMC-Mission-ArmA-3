_location = [l1,l2,L3,l4,l5,l6,l7,l8,l9,l10] call BIS_fnc_selectRandom;
_Xpos = _location select 1;
_Ypos = _location select 2;
_markerstr = createMarker ["THISSHIT",[_Xpos,_Ypos]];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType "flag_USA";
diag_log _location;
diag_log _Xpos; 
diag_log _Ypos;