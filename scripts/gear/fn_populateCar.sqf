carboxmenu addAction ["Open Garage",{

 	//Create a position 30 meters infront of the player
	_pos = getMarkerPos 'car_spawn';

	//Create empty helipad at the position
	_vehicle = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ]; 

	//Pass created vehicle to function for use as position
	["Open",[ true, _vehicle ]] call BIS_fnc_garage; 
}];