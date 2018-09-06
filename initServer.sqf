
//money is server side
execVM "scripts\economy\initmoney.sqf";

//define populate gear
fn_populateGear={

execVM "scripts\gear\fn_populateGear.sqf";

};
fn_populateCar={

execVM "scripts\gear\fn_populateCar.sqf";

};

//run the gear cron job
execVM "scripts\starttask.sqf";

fn_forceUpdate={
[] spawn fn_populateGear;
[] spawn fn_populateCar;
};