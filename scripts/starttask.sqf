//not final, for test
while {isServer}do{
[] spawn fn_populateGear;
[] spawn fn_populateCar;
sleep(60);
}