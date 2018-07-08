execVM "scripts\economy\initmoney.sqf";
////THE FOLLOWING LINE IS NEEDED FOR GRIMES SIMPLE REVIVE INIT BEFORE {PLAYER == PLAYER}
[] execVM "G_Revive_init.sqf";
////
execVM "CW_ACIM\ACIM_init.sqf";

execVM "initciv.sqf";
