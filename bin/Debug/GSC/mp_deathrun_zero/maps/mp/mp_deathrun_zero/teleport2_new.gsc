main()
{

	portals = getentarray("teleport2", "targetname");
	
	for(inx = 0; inx < portals.size; inx++)
	{
		thread Transporter2Random(portals, inx);
	}
	
}

Transporter2Random(portals, inx)
{
	trigger = spawn( "trigger_radius", portals[inx].origin, 0, 40, 40);
	
	while(true)
	{
		trigger waittill("trigger",player);

		if (getdvarint("scr_teleport2_disabled") == 1)
		{
//AUTO 			wait(0.10);
			continue;
		}

		if(!isDefined(player) || isDefined(player.mp_deathrun_zero_teleport2_time) && player.mp_deathrun_zero_teleport2_time + 3000 > GetTime())
			continue;

		endInx = randomint(portals.size);
		while(endInx == inx)
			endInx = randomint(portals.size);

		player linkTo(portals[endInx]);
		player setorigin(portals[endInx].origin);
		player SetPlayerAngles(portals[endInx].angles);
		player unlink();
		player.mp_deathrun_zero_teleport2_time = GetTime();
//AUTO 		wait(0.10);
	}
}

