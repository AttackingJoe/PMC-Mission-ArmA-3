_newCiv = cursorTarget;
_dist = player distance _newCiv;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_dist <50) then
{

player removeAction act1;	

	act2 = player addaction ["Interrogate", "Scripts\civ\Interrogate.sqf"];
	act3 = player addaction ["Detain", "Scripts\civ\Detain.sqf"];
	act4 = player addaction ["Escort", "Scripts\civ\Escort.sqf"];
	act5 = player addaction ['<t color="#003300">' + "Hide Civilian Menu" + '</t>', "Scripts\civ\Cancel.sqf", [], 5, false, false, "", "_target == player"];
	

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



};

