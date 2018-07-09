_newCiv = cursorTarget;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

playmusic "Music2";
player sidechat "Stand Up Sir Your Coming With Me.";
sleep (2);
_newCiv switchMove "UnaErcPoslechVelitele1..4";
player forceWalk True;
_newCiv attachTo [player,[0.5,1,0]];
waitUntil {_newCiv distance extractBird < 6};
detach _newCiv;
_newCiv moveInCargo extractBird;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

player forceWalk False;
player removeAction act2;
player removeAction act3;
player removeAction act4;
player removeAction act5;
player removeAction act6;
player removeAction act7;
act1 = player addaction ['<t color="#003300">' + "Investigation Menu" + '</t>', "Scripts\Investigate.sqf", [], 5, false, false, "", "_target == player"];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

sleep(2);
playmusic "Music4";
player sideChat "Prisoner Loaded,Extraction Helo RTB.";
extractBird domove getpos HQ;
extractBird flyinheight 60;
extractBird setspeedmode "FULL";
extractBird domove getpos HQ;
waitUntil {extractBird distance HQ < 200};
extractBird domove getpos HQ;
extractBird flyinheight 15;
chopper domove getPos HQ;
extractBird land "HQ";
commandstop extractBird;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

exit;



