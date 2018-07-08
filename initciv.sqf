//Civilians are cool yo

//=================================================================================================================================================================
//DO NOT EDIT
//=================================================================================================================================================================

call compile preprocessFileLineNumbers "Engima\Civilians\Common\Common.sqf";
call compile preprocessFileLineNumbers "Engima\Civilians\Common\Debug.sqf";

// The following constants may be used to tweak behaviour

ENGIMA_CIVILIANS_SIDE = civilian;      // If you for some reason want the units to spawn into another side.
ENGIMA_CIVILIANS_MINSKILL = 0.4;       // If you spawn something other than civilians, you may want to set another skill level of the spawned units.
ENGIMA_CIVILIANS_MAXSKILL = 0.6;       // If you spawn something other than civilians, you may want to set another skill level of the spawned units.

ENGIMA_CIVILIANS_MAXWAITINGTIME = 300; // Maximum standing still time in seconds
ENGIMA_CIVILIANS_RUNNINGCHANCE = 0.05; // Chance of running instead of walking

// Civilian personalities
ENGIMA_CIVILIANS_BEHAVIOURS = [
	["CITIZEN", 100] // Default citizen with ordinary behaviour. Spawns in a house and walks to another house, and so on...
];

// Do not edit anything beneath this line!

ENGIMA_CIVILIANS_INSTANCE_NO = 0;

if (isServer) then {
	call compile preprocessFileLineNumbers "Engima\Civilians\Server\ServerFunctions.sqf";
	call compile preprocessFileLineNumbers "Engima\Civilians\ConfigAndStart.sqf";
};

call compile preprocessFileLineNumbers "Engima\Traffic\Common\Common.sqf";
call compile preprocessFileLineNumbers "Engima\Traffic\Common\Debug.sqf";
call compile preprocessFileLineNumbers "Engima\Traffic\HeadlessClient.sqf";

ENGIMA_TRAFFIC_instanceIndex = -1;
ENGIMA_TRAFFIC_areaMarkerNames = [];
ENGIMA_TRAFFIC_roadSegments = [];
ENGIMA_TRAFFIC_edgeTopLeftRoads = [];
ENGIMA_TRAFFIC_edgeTopRightRoads = [];
ENGIMA_TRAFFIC_edgeBottomRightRoads = [];
ENGIMA_TRAFFIC_edgeBottomLeftRoads = [];
ENGIMA_TRAFFIC_edgeRoadsUseful = [];

private _headlessClientPresent =  !(isNil Engima_Traffic_HeadlessClientName);
private _runOnThisMachine = false;

if (_headlessClientPresent && isMultiplayer) then {
    if (!isServer && !hasInterface) then {
        _runOnThisMachine = true;
    };
}
else {
    if (isServer) then {
        _runOnThisMachine = true;;   
    };
};

if (_runOnThisMachine) then {
	call compile preprocessFileLineNumbers "Engima\Traffic\Server\Functions.sqf";
	call compile preprocessFileLineNumbers "Engima\Traffic\Server\MoveVehicle.sqf";
	call compile preprocessFileLineNumbers "Engima\Traffic\Server\StartTraffic.sqf";
	call compile preprocessFileLineNumbers "Engima\Traffic\ConfigAndStart.sqf";
};

//=================================================================================================================================================================
//EDIT BELOW HERE
//=================================================================================================================================================================
// Set civilian parameters.
_parameters = [
	["UNIT_CLASSES", ["C_man_1", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_1_F_afro", "C_man_polo_1_F_euro", "C_man_polo_1_F_asia", "C_man_polo_2_F", "C_man_polo_2_F_afro", "C_man_polo_2_F_euro", "C_man_polo_2_F_asia", "C_man_polo_3_F", "C_man_polo_3_F_afro", "C_man_polo_3_F_euro", "C_man_polo_3_F_asia", "C_man_polo_4_F", "C_man_polo_4_F_afro", "C_man_polo_4_F_euro", "C_man_polo_4_F_asia", "C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_euro", "C_man_polo_5_F_asia", "C_man_polo_6_F", "C_man_polo_6_F_afro", "C_man_polo_6_F_euro", "C_man_polo_6_F_asia", "C_man_p_fugitive_F", "C_man_p_fugitive_F_afro", "C_man_p_fugitive_F_euro", "C_man_p_fugitive_F_asia", "C_man_p_beggar_F", "C_man_p_beggar_F_afro", "C_man_p_beggar_F_euro", "C_man_p_beggar_F_asia", "C_man_w_worker_F", "C_scientist_F", "C_man_hunter_1_F", "C_man_p_shorts_1_F", "C_man_p_shorts_1_F_afro", "C_man_p_shorts_1_F_euro", "C_man_p_shorts_1_F_asia", "C_man_shorts_1_F", "C_man_shorts_1_F_afro", "C_man_shorts_1_F_euro", "C_man_shorts_1_F_asia", "C_man_shorts_2_F", "C_man_shorts_2_F_afro", "C_man_shorts_2_F_euro", "C_man_shorts_2_F_asia", "C_man_shorts_3_F", "C_man_shorts_3_F_afro", "C_man_shorts_3_F_euro", "C_man_shorts_3_F_asia", "C_man_shorts_4_F", "C_man_shorts_4_F_afro", "C_man_shorts_4_F_euro", "C_man_shorts_4_F_asia", "C_journalist_F", "C_Orestes", "C_Nikos", "C_Nikos_aged"]],
	["UNITS_PER_BUILDING", 0.1],
	["MAX_GROUPS_COUNT", 100],
	["MIN_SPAWN_DISTANCE", 50],
	["MAX_SPAWN_DISTANCE", 500],
	["BLACKLIST_MARKERS", []],
	["HIDE_BLACKLIST_MARKERS", true],
	["ON_UNIT_SPAWNED_CALLBACK", {}],
	["ON_UNIT_REMOVE_CALLBACK", { true }],
	["DEBUG", false]
];

// Start the civilian script
_parameters spawn ENGIMA_CIVILIANS_StartCivilians;

/*
Here is a complete list of the parameters and what they do:

* UNIT_CLASSES (Array): Array of unit classes that may be spawned. If you want to see more of one unit class than another, 
  then have it occur a couple of more often (or more seldom) in the array:
  Example: ["C_man_1", "C_man_1", "C_man_1", "C_man_polo_1_F_asia"]
  
* UNITS_PER_BUILDING (Number): Number of units that are spawned. Since we want to see a lot more civilians per area unit in a 
  city compared to the country side, the number is set as "number of units per building". Default value is 0.1 which means 
  that if you have 50 buildings near you, you will have 5 civilians near you. A building or a civilian is regarded as "near" 
  if they are within the MAX_SPAWN_DISTANCE of any player.
  Example: 0.1

* MAX_GROUPS_COUNT (Number): The maximum number of groups in Arma 3 is 144, and each civilian is most often put in a separate 
  group. This options is to prevent that too many groups are being spawned. E.g. if your mission make use of 30 groups except 
  for the groups created by Engima's Civilians, a good value here would be 110.
  Example: 100

* MIN_SPAWN_DISTANCE (Number): Minimum spawn distance in meters from nearest human player on the map. Civilian units always 
  spawn inside buildings, so this option may be quite small. It should be at least 100 meters less than MAX_SPAWN_DISTANCE.
  Example: 50

* MAX_SPAWN_DISTANCE (Number): Maximum spawn distance in meters from nearest human player on the map. Civilians more far away 
  than this number of meters are deleted. It should be at least 100 meters greater than MAX_SPAWN_DISTANCE.
  Example: 500
  
* BLACKLIST_MARKERS (Array): An array of marker hames for markers where no civilians are allowed to be. Civilians will not 
  spawn nor have destination position inside any of these markers. However, a unit may spawn on one side of it and get a 
  destination on the other, and then the civ will probably walk the shortest way and cross the area. To make sure that no 
  civilians are inside these markers, set them to be greater than MAX_SPAWN_DISTANCE in radious.
  Example: ["MilitaryAreaMarker", "NoCivsHereMarker"]
  
* HIDE_BLACKLIST_MARKERS (Boolean): Wether the area markers will be hidden or not. If true then the markers will be hidden on 
  the map for the players, otherwise it will be visible. Default value is true.

* ON_UNIT_SPAWNED_CALLBACK (Code): Code that is executed when a unit has spawned. Parameter _this is an array: 0: created 
  unit (Object). Note that this is executed with the "spawn" command.
  Example: { hint ("A unit named " + vehicleVarName (_this select 0) + " created!")

* ON_UNIT_REMOVE_CALLBACK (Code): Code that is executed just before a unit is removed. Parameter _this is an array: 0: unit 
  that will be removed. Note that this is executed with the "call" command. Default value is { true }. If you return false 
  then the unit will not be deleted.
  Example: { hint "Vehicle of type " + typename (_this select 0) + " will not be removed!"; false }

* DEBUG (Boolean): Whether script is running in debug mode or not. In debug mode all civilians are marked as dots on the map.
  Can be true or false. Default value is false.
  */
  
  // Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]],
	["VEHICLES_COUNT", 10],
	["MAX_GROUPS_COUNT", 0],
	["MIN_SPAWN_DISTANCE", 800],
	["MAX_SPAWN_DISTANCE", 1200],
	["MIN_SKILL", 0.4],
	["MAX_SKILL", 0.6],
	["AREA_MARKER", "EnemyMarker1"],
	["HIDE_AREA_MARKER", true],
	["ON_UNIT_CREATING", { true }],
	["ON_UNIT_CREATED", {}],
	["ON_UNIT_REMOVING", {}],
	["ON_SPAWN_CALLBACK", {}],  // Obsolete! Use ON_UNIT_CREATED instead.
	["ON_REMOVE_CALLBACK", {}], // Obsolete! Use ON_UNIT_REMOVING instead.
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;

/*
Here is a complete list of the parameters and what they do:

* SIDE (Side): Which side the spawned vehicles will be. Can be east, west, independent or civilian.

* VEHICLES (Array): Array of vehicle classes that may be spawned. If you want to see more of one vehicle than another, 
  then have it occur a couple of more often in the array. The following example will spawn traffic where 75% of vehicles 
  are quadbikes and 25% is transports:
  Example: ["C_Quadbike_01_F", "C_Quadbike_01_F", "C_Quadbike_01_F", "C_Van_01_transport_F"]
  
* VEHICLES_COUNT (Scalar): Number of moving vehicles that exists on the map for the current traffic instance. If
  a vehicle is damage to a degree that it cannot move (!canMove vehicle), then it will not be counted, and a new 
  vehicle will be created. But only if allowed by MAX_GROUPS_COUNT (se below).
  Example: If in single player and VEHICLES_COUNT is set to 10, MAX_GROUPS_COUNT set to 15, and MAX_SPAWN_DISTANCE is 
  set to 1000, then there will be 10 vehicles on an area of 3.14 sqkm (1000^2 * pi). If one of them gets damaged 
  so it cannot move, then an 11th will spawn (and so on up to 15). In a multiplayer game the vehicles will be spread
  over total area covered by the players.

* MAX_GROUPS_COUNT (Scalar): Maximum number of groups that the script will ever have created at the same time. If set
  to 0 (default) then the VEHICLES_COUNT value will be used. If set to a value greater than 0 and less than 
  VEHICLES_COUNT will limit the number of vehicles to MAX_GROUPS_COUNT. If set to a value greater than VEHICLES_COUNT,
  then the script is given the possibility to spawn in new vehicles when one is damaged to a degree when it cannot move.
  (See also VEHICLES_COUNT above.)
  Example: If VEHICLES_COUNT is set to 10 and MAX_GROUPS_COUNT is set to 15, and all ten vehicles are destroyed, then
  the script will spawn in 5 new vehicles. Damaged vehicles will be removed when players move away far enough as usual.

* MIN_SPAWN_DISTANCE (Scalar): Minimum spawn distance in meters from nearest human player on the map. Should be at least 100 
  meters less than MAX_SPAWN_DISTANCE.
  Example: 800

* MAX_SPAWN_DISTANCE (Scalar): Maximum spawn distance in meters from nearest player on the map. Vehicles beyond this 
  distance will be removed. Should be at least 100 meters greater than MIN_SPAWN_DISTANCE.
  Example: 1200
  
* MIN_SKILL (Scalar): Vehicle crew's minimum skill. Must be between 0 and 1 and less than or equal to MAX_SKILL. Actual 
  skill of each spawned vehicle (and crew) will be a random number between MIN_SKILL and MAX_SKILL.
  Example: 0.4

* MAX_SKILL (Scalar): Vehicle crew's maximum skill. Must be between 0 and 1 and greater than or equal to MIN_SKILL. Actual 
  skill of each spawned vehicle (and crew) will be a random number between MIN_SKILL and MAX_SKILL.
  Example: 0.6
  
* AREA_MARKER (String): Name of a marker that sets bounds for the traffic. The marker needs to be of shape rectancle or
  ellipse (not icon for obvious reasons), and it needs to contains road segments. All vehicles for the current traffic 
  will spawn inside this area, and all waypoints set to these vehicles will also be inside the area. However, it is Arma
  that routes the vehicle to the destination, and so it can come to decide to use roads that are outside of the marker. Be
  aware of this when you are planning the marker positions. Default value is an empty string ("") which means "the entire 
  map".
  
* HIDE_AREA_MARKER (Boolean): Wether the area marker should be hidden or not. If true then the marker will be hidden on 
  the map for the players, otherwise it will be visible. Default value is true.

* ON_UNIT_CREATING (Code): Callback that is executed right before a vehicle spawns. Return true to go on with
  the vehicle spawn. Return false to prohibit the spawn. Parameter _this is an array with the following items:
    0 (Array): An array with spawn arguments. This array can be manipulated. Change the first item to spawn on 
    another position, and change the second parameter to spawn a vehicle of another class than suggested. The spawn
    arguments array is specified like this:
      0 (Array): The position where the vehicle is suggested to spawn (can be modified).
      1 (String): The classname for the vehicle to spawn (can be modified).
    1 (Scalar): Number of vehicles spawned and currently controlled by the script.
    2 (Scalar): Calculated maximun number of vehicles that the script will try to spawn (depends on spawn markers etc.). It
    is always a value between 0 and VEHICLES_COUNT (including).
  The example below will not spawn traffic during the night:
  Example: { private _goOnWithSpawn = (dayTime > 8 && dayTime < 22); _goOnWithSpawn )

* ON_UNIT_CREATED (Code): Code that is executed when a vehicle has spawned. Parameter _this is an array:
    0 (Object): The vehicle that was created.
    1 (Group): The group that the vehicle belongs to.
    2 (Scalar): Number of vehicles spawned and currently controlled by the script.
    3 (Scalar): Calculated maximun number of units that the script will try to spawn (depends on spwn markers
    etc.).
  Example: { hint ("Vehicle of type " + typeOf (_this select 0) + " created!")

* ON_UNIT_REMOVING (Code): Code that is executed just before a vehicle and its group is being removed. Vehicle is 
  sent in as a parameter _this.
    0 (Object): The vehicle that will be removed.
    1 (Group): The group that the vehicle belongs to.
    2 (Scalar): Number of vehicles spawned and currently controlled by the script.
    3 (Scalar): Calculated maximun number of units that the script will try to spawn (depends on spwn markers
    etc.).
  Example: { hint "Vehicle of type " + typename _this + " is being removed!"; }

* ON_SPAWN_CALLBACK (Code): Obsolete! Use ON_UNIT_CREATED instead.

* ON_REMOVE_CALLBACK (Code): Obsolete! Use ON_UNIT_REMOVING instead.

* DEBUG (Boolean): Whether script is running in debug mode or not. In debug mode all vehicles are marked as dots on the map.
  Can be true or false. Default value is false.


- USING MORE THAN ONE INSTANCE -

It is fully possible and supported to start more than one instance of the traffic script. For example you can have 
opfor traffic on the east side of the map and blufor traffic on the west, and with overlapping areas to for that 
matter.

To excecute more instances of the script simultaneously, copy the parameters and the start spawn command in 
Engima\Traffic\ConfigAndStart.sqf and add them at bottom of the ConfigAndStart.sqf.

IMPORTANT: It is important that all calls to ENGIMA_TRAFFIC_startTraffic is made within two seconds. Otherwise 
the map's road segments will not be collected needed in the script's initialization phase.
*/