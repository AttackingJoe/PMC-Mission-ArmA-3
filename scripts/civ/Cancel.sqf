_newCiv = cursorTarget;

player removeAction act2;
player removeAction act3;
player removeAction act4;
player removeAction act5;

act1 = player addaction ['<t color="#003300">' + "Investigation Menu" + '</t>', "Scripts\Investigate.sqf", [], 5, false, false, "", "_target == player"];
detach _newCiv;
