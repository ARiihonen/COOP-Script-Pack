/*
Checking for Headless Client and making sure editor-spawned dudes are HC-owned
*/
diag_log format ["IPS: %1", _this select 0];
if (!isNil "headlessClient") then
{
	if (_this select 0 == headlessClient) then
	{
		_HCUnit = _this select 0;
		_id = owner headlessCLient;

		diag_log format ["HCUnit: %1, ID: %2", _HCUnit, _id];
		missionNamespace setVariable ["ARTR_AIController", _HCUnit, true];
		missionNamespace setVariable ["ARTR_HCID", _id, true];

		if (!(missionNamespace getVariable ["ARTR_HCSET", false])) then
		{
			waitUntil { time > 0 };
			call ARTR_fnc_HCSetOwner;
		};
	};
};
