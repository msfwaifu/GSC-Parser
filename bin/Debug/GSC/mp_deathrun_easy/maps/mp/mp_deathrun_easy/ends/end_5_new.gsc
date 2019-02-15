main()
{
	origin = getent( "jump_bonus", "targetname" );
	maps\mp\mp_deathrun_easy\coins::AddItem( origin.origin, 7, "tag_4gf_coin" );
}

StartFinalRoom( i, place )
{
	origin1 = getent( "jump_0", "targetname" );
	origin2 = getent( "jump_1", "targetname" );
	
//AUTO 	iprintlnbold( "The player ^1"+ self.name +"^7 entered the JUMP room." );
	
	if( !place )
	{
		origin1 PlaceSpawnPoint();
		origin2 PlaceSpawnPoint();
		
		activator = GetActivator();
	
		if( !isdefined( activator ) )
			return;
			
		activator SetOrigin( origin1.origin );
		activator SetPlayerAngles( origin1.angles );
//AUTO 		activator TakeAllWeapons();
//AUTO 		activator GiveWeapon( "knife_mp" );
		
		wait 0.01;
//AUTO 		activator SwitchToWeapon( "knife_mp" );
		
//AUTO 		ambientPlay("music_knife");
	}
	
	self SetOrigin( origin2.origin );
	self SetPlayerAngles( origin2.angles );
//AUTO 	self TakeAllWeapons();
//AUTO 	self GiveWeapon( "knife_mp" );

	wait 0.01;
//AUTO 	self SwitchToWeapon( "knife_mp" );
}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return undefined;
}

