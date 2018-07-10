_newCiv = cursorTarget;
_dist = player distance _newCiv;
canceled = 0;

if ((_dist <50)or(canceled == 0)) then
{
act1 = player addaction ["Detain", "Scripts\civ\Detain.sqf"];
act2 = player addaction ["Escort", "Scripts\civ\Escort.sqf"];
} 
else 
{
player removeAction act1;
player removeAction act2;
};

