params [
	[ "_unit", player, [objNull] ],
	[ "_vest", "", [""] ]
];

_ret = false;
if (_vest != "") then {
	private _items = vestItems _unit;
	removeVest _unit;
	_unit addVest _vest;

	{
		_unit addItemToVest _x;
	} forEach _items;

	_ret = true;
};

_ret;
