main()
{
	maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setExpFog(2500, 5000, 0.81, 0.75, 0.63, 0.5);
	
//AUTO 	level.knife_locked = false;
	level.jump_locked = false;
//AUTO 	level.room4_locked = false;
//AUTO 	level.sniper_locked = false;
	level.mapheight = 0; // cant get that to work properly thus no rain on spawn.
	
//AUTO 	setdvar("dr_activator_speed", "1.2"); // DONT DELETE THESE OR IF YOU WANT TO CHANGE THEM LET THEM EQUAL.. ( adjust according to your server speed )
//AUTO //AUTO 	setdvar("dr_jumpers_speed", "1.2"); // ...OTHERWISE IT WILL MORE DIFICAULT FOR THE JUMPERS TO COMPLETE THE BOUNCE ROOM! KEEP THEM MORE THAN 1.05 OR IT WILL BE REALLY HARD.
	
	thread onPlayerConnected();
	thread secret1();
	thread prepareMap();
	thread triggers_setup();
	thread ambiance( 0 );
	thread ambiance( 1 );
	thread secret_stuff0_0();
	thread secret_stuff0_7();
	thread secret_stuff0_3();
	thread teleport( "spawnToPart1", "spawnToPart1org" );
	thread teleport( "spawnToPart1Acti", "spawnToPart1orgActi" );
	thread teleport( "part1ToPart2", "part1ToPart2org" );
	thread teleport( "part1ToPart2Acti", "part1ToPart2orgActi" );
	thread teleport( "part2ToPart3", "part2ToPart3org" );
	thread teleport( "part2ToPart3Acti", "part2ToPart3orgActi" );
	thread teleport( "part3ToPart4", "part3ToPart4org" );
	thread teleport( "part3ToPart4Acti", "part3ToPart4orgActi" );
	thread teleport2("telback1", (getEnt("secret1back_org", "targetname").origin), (getEnt("secret1back_org", "targetname").angles), "", "", "", false);
	thread teleport2("telback2", (getEnt("secret1back_org2", "targetname").origin), (getEnt("secret1back_org2", "targetname").angles), "", "", "", false);
	thread teleport2("telback3", (getEnt("secret1back_org3", "targetname").origin), (getEnt("secret1back_org3", "targetname").angles), "", "", "", false);
	thread teleport2("secret1back", (getEnt("secret1back_org4", "targetname").origin), (getEnt("secret1back_org4", "targetname").angles), "", "", " has finished the secret #1!", true);
	thread mapmadeby();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	//thread trap7();
	//thread trap8();
	//thread trap9();
	thread trap10();
	//thread part3MovingBlock();
//AUTO 	thread knife_room();
//AUTO 	thread jump_room();
//AUTO 	thread jump_room_tp();
//AUTO 	thread snip_room();
//AUTO 	thread room4_room();
	thread rain_light(); // disable rain by insterting a double slash "//" at the start of this line.
}

rain_light()
{
effect = LoadFX("mp_dr_misty/tox_rain");
	while(1)
	{
		players = getentarray("player", "classname");
		
		for(i=0; i<players.size; i++)
		{
		x = 550 - randomint(700);
		y = 550 - randomint(700);
		above = bulletTrace( players[i].origin + (x, y, 200), (players[i].origin[0] + x, players[i].origin[1] + y, level.mapheight), false, false);
			if (above["fraction"] < .9) continue;
		playfx(effect, above["position"]);
		wait 0.05;
		}
	wait 0.05;
	}
}


onPlayerConnected() {
	for (;;) {
		level waittill("connected", player);
		player.weapons = 0;
	}
}

mapmadeby()
{
	while(1)
	{
//AUTO 	iprintln("Map made by Poseidon & Kris");
	wait 45;
	}
}

addTriggerToList(name)
{
	if (!isDefined(level.trapTriggers)) level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt(name, "targetname");
}

prepareMap()
{
left_trap4 = getentarray("trap4_left", "targetname");
right_trap4 = getentarray("trap4_right", "targetname");
	for(i=0;i<4;i++)
	{
	left_trap4[i] moveY(196,.05);
	right_trap4[i] moveY(-196,.05);
	}
	
precacheItem("remington700_mp");
precacheItem("m40a3_mp");
precacheItem("dragunov_mp");
precacheItem("barrett_mp");
precacheItem("brick_blaster_mp");

level.room_song=0;
}

triggers_setup()
{
addTriggerToList("trap1");
addTriggerToList("trap2");
addTriggerToList("trap3");
addTriggerToList("trap4");
addTriggerToList("trap5");
addTriggerToList("trap6");
//addTriggerToList("trap7");
//addTriggerToList("trap8");
//addTriggerToList("trap9");
addTriggerToList("trap10");
}

room_song()
{
trig = getEntarray("music", "targetname");
	if( level.room_song == 0 )
	{
	AmbientStop( 0.5 );
	wait 0.5;
//AUTO 	ambientplay( "ambient3" );
	level.room_song = 1;
		if( isDefined( trig[0] ) && isDefined( trig[1] ) )
		{
		trig[0] delete();
		trig[1] delete();
		}
	}
}

ambiance( num )
{
trig = getEntarray("music", "targetname");
trig[num] waittill("trigger", player);
trig[0] delete();
trig[1] delete();
//AUTO ambientplay( "ambient"+(num+1) );
}

teleport( from, to )
{
trig = getEnt(from, "targetname");
orgn = getEnt(to, "targetname");
	while(1)
	{
	trig waittill("trigger", player);
	player freezeControls(true);
	player SetOrigin(orgn.origin);
	player SetPlayerAngles(orgn.angles);
//AUTO 	wait .2;
	player freezeControls(false);
	}
}


teleport2(trigger_name, origin, rotate, message_to_player, message_to_all_bold, message_to_all, player_name_to_all, sound_to_play) {
	trig = getEnt(trigger_name, "targetname");
	while (1) {
		trig waittill("trigger", player);
		player freezeControls(true);
		player SetOrigin((origin));
		player SetPlayerAngles((rotate));
		wait.1;
		player freezeControls(false);
		if (player_name_to_all == false) {
//AUTO 			player iPrintLnBold(message_to_player);
//AUTO 			if (message_to_all_bold != "") iPrintLnBold(message_to_all_bold);
//AUTO 			if (message_to_all != "") iPrintLn(message_to_all);
		} else if (player_name_to_all == true) {
//AUTO 			player iPrintLnBold(message_to_player);
//AUTO 			if (message_to_all_bold != "") iPrintLnBold("^2" + player.name + message_to_all_bold);
//AUTO 			if (message_to_all != "") iPrintLn("^2" + player.name + message_to_all);
		}
		//if (isDefined(sound_to_play)) player play_looped_nonlooping_local_sound(sound_to_play, 8.12);
	}
}

trap1()
{
	blocks = getentarray("trap1_blocks", "targetname");
	trap1 = getent("trap1", "targetname");
/* AUTO 	trap1 waittill("trigger", player);
	trap1 delete();
		for(i=0;i<17;i++)
		{
		blocks[i] thread randomMovement();
		blocks[i] thread firstRandomMovement();
		}
*/}

trap2()
{
	left = getentarray("trap2_left", "targetname");
	right = getentarray("trap2_right", "targetname");
	mid = getent("trap2_mid", "targetname");
	trap2 = getent("trap2", "targetname");
/* AUTO 	trap2 waittill("trigger", player);
	trap2 delete();
		switch(randomInt(3))
		{
		case 0:
			for(i=0;i<3;i++)
			{
				if(isDefined(left[i]))
					left[i] delete();
				//if(isDefined(right[i]))
				//	right[i] delete();
			}
		break;
		case 1:
			for(i=0;i<3;i++)
			{
				if(isDefined(right[i]))
					right[i] delete();
			}
			//if(isDefined(mid))
				//mid delete();
		break;
		case 2:
			//for(i=0;i<3;i++)
			//{
				//if(isDefined(left[i]))
					//left[i] delete();
			//}
			if(isDefined(mid))
				mid delete();
		break;
		}
*/}

trap3()
{
	blocks = getentarray("trap3_blocks", "targetname");
	trap3 = getent("trap3", "targetname");
/* AUTO 	trap3 waittill("trigger", player);
	trap3 delete();
		for(i=0;i<6;i++)
		{
		blocks[i] thread randomRotation();
		blocks[i] thread firstRandomRotation();
		}
*/}

trap4()
{
	left = getentarray("trap4_left", "targetname");
	right = getentarray("trap4_right", "targetname");
	trap4 = getent("trap4", "targetname");
/* AUTO 	trap4 waittill("trigger", player);
	trap4 delete();
		for(i=3;i>-1;i--)
		{
		right[i] thread sequentialMovement( "right" );
		left[i] thread sequentialMovement( "left" );
		wait 2;
		}
*/}

trap5()
{
	blocks = getentarray("trap5_blocks", "targetname");
	kill = getentarray("trap5_kill", "targetname");
	trap5 = getent("trap5", "targetname");
/* AUTO 	trap5 waittill("trigger", player);
	trap5 delete();
		for(i=0;i<3;i++)
			{
			kill[i] enablelinkto();
			kill[i] linkTo(blocks[i]);
			}
		while(1)
		{
			for(i=0;i<3;i++)
			{
			blocks[i] thread hammers();
			wait 1;
			}
		}
*/}

trap6()
{
	left = getent("trap6_blocks1", "targetname");
	right = getent("trap6_blocks2", "targetname");
	trap6 = getent("trap6", "targetname");
/* AUTO 	trap6 waittill("trigger", player);
	trap6 delete();
		switch(randomInt(2))
		{
		case 0:
		if(isDefined(left))
			left delete();
		break;
		case 1:
		if(isDefined(right))
			right delete();
		break;
		}
*/}

/*trap6() // OLD
{
	blocks = getent("trap6_blocks", "targetname");
	trap6 = getent("trap6", "targetname");
/* AUTO 	trap6 waittill("trigger", player);
	trap6 delete();
	blocks_place = blocks.origin;
	blocks moveTo( ( blocks.origin+( 200, -200, 0 ) ), 1);
	wait 1;
	blocks moveTo( blocks_place, 1 );
*/}*/

trap7()
{
	blocks = getentarray("trap7_blocks", "targetname");
	trap7 = getent("trap7", "targetname");
/* AUTO 	trap7 waittill("trigger", player);
	trap7 delete();
	remove1 = randomInt(6);
	remove2 = randomInt(6);
		while( remove1==remove2 )
		{
		remove2 = randomInt(6);
		}
	blocks[remove1] delete();
	blocks[remove2] delete();
*/}

trap8()
{
	blocks = getent("trap8_block", "targetname");
	trap8 = getent("trap8", "targetname");
/* AUTO 	trap8 waittill("trigger", player);
	trap8 delete();
	blocks_place = blocks.origin;
		while(1)
		{
		blocks moveTo( (blocks.origin+(-100,-100,0)), 1 );
		wait 1;
		blocks moveTo( blocks_place, 1 );
		wait 3;
		}
*/}

trap9()
{
	blocks = getent("trap9_block", "targetname");
	trap9 = getent("trap9", "targetname");
/* AUTO 	trap9 waittill("trigger", player);
	trap9 delete();
		while(1)
		{
		blocks moveZ( 230, 2 );
		blocks waittill("movedone");
		wait 1;
		blocks moveZ( -230, 2);
		blocks waittill("movedone");
		wait 1;
		}
*/}

trap10()
{
	arrow = getentarray("arrows", "targetname");
	trap10 = getent("trap10", "targetname");
/* AUTO 	trap10 waittill("trigger", player);
	trap10 delete();
		for(i=0;i<arrow.size;i++)
		{
		arrow[i] moveY( 1500, 1, 0, 0.8 );
		wait randomFloatRange( 0.1, 0.5 );
		}
		for(i=0;i<arrow.size;i++)
		{
		arrow[i] delete();
		}
*/}

hammers()
{
self moveZ(-152, 0.5, 0.4);
self waittill("movedone");
wait 0.5;
self moveZ(152, 0.5, 0.4);
self waittill("movedone");
wait 0.5;
}

sequentialMovement( direction )
{
	if( direction=="right" )
	{
		while(1)
		{
		self moveY(100,3.5);
		wait 3.5;
		self moveY(-100,3.5);
		wait 3.5;
		}
	}
	if( direction=="left" )
	{
		while(1)
		{
		self moveY(-100,2);
		wait 3;
		self moveY(100,3);
		wait 3;
		}
	}
}

firstRandomMovement()
{
time = RandomFloatRange( 1, 4 );
self moveZ( 120, time );
}

randomMovement()
{
	while(1)
	{
	delay = RandomFloatRange( 2, 4 );
	time = RandomFloatRange( 1, 4 );
	wait delay;
	self moveZ( -240, time );
	wait time+1;
	self moveZ( 240, time );
	wait time+1;
	}
}

firstRandomRotation()
{
time = RandomFloatRange( 2, 4 );
thread returnRandomDirection();
self RotateYaw( level.trap3direction, time );
}

returnRandomDirection()
{
	switch( randomInt(2) )
	{
	case 0:
	level.trap3direction = 720;
	break;
	case 1:
	level.trap3direction = -720;
	break;
	}
}

randomRotation()
{
	while(1)
	{
	delay = RandomFloatRange( 1, 3 );
	time = RandomFloatRange( 1, 4 );
	wait delay;
	thread returnRandomDirection();
	self RotateYaw( level.trap3direction, time );
	wait time+1;
	thread returnRandomDirection();
	self RotateYaw( level.trap3direction, time );
	wait time+1;
	}
}

part3MovingBlock()
{
block = getent("part3MovingBlock", "targetname");
	while(1)
	{
	block moveZ(56,0.5);
	block waittill("movedone");
	block moveX(-220,1);
	block waittill("movedone");
	block moveY(470,1.5);
	block waittill("movedone");
	wait 1.5;
	block moveY(-470,1);
	block waittill("movedone");
	block moveX(220,0.5);
	block waittill("movedone");
	block moveZ(-56,0.3);
	block waittill("movedone");
	wait 1.5;
	}
}

jump_room_tp()
{
trig = getEnt("bounce_tp", "targetname");
acti = getEnt("jump_acti", "targetname");
jumper = getEnt("jump_jumper", "targetname");
	while(1)
	{
	trig waittill("trigger", player);
	trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
		player freezeControls(true);
		player setOrigin(jumper.origin);
		player setplayerangles(jumper.angles);
//AUTO 		wait 0.1;
		player freezeControls(false);
		}
		else
		{
		player freezeControls(true);
		player setOrigin(acti.origin);
		player setplayerangles(acti.angles);
//AUTO 		wait 0.1;
		player freezeControls(false);
		}
	}
}


knife_room() {
	trig = getEnt("knife", "targetname");
	org_acti = getEnt("knife_acti", "targetname");
	org_jumper = getEnt("knife_jumper", "targetname");
	while (1) {
		trig waittill("trigger", player);
		thread room_song();
		if (level.knife_locked == false) {
			level.knife_locked = true;
			level.jump_locked = true;
			level.sniper_locked = true;
			level.room4_locked = true;
//AUTO 			iprintlnbold("^3" + player.name + "^7 choosed the knife room");
//AUTO 			player takeAllWeapons();
//AUTO 			player giveWeapon("knife_mp");
//AUTO 			player switchToWeapon("knife_mp");
			player SetOrigin(org_jumper.origin);
			player setPlayerAngles(org_jumper.angles);
			player thread onDeath_knife();
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
//AUTO 						players[i] takeAllWeapons();
//AUTO 						players[i] giveWeapon("knife_mp");
//AUTO 						players[i] switchToWeapon("knife_mp");
						players[i] SetOrigin(org_acti.origin);
						players[i] setPlayerAngles(org_acti.angles);
					}
				}
				return;
			}
		}
	}
}


jump_room() {
	trig = getEnt("jump", "targetname");
	org_acti = getEnt("jump_acti", "targetname");
	org_jumper = getEnt("jump_jumper", "targetname");
	while (1) {
		trig waittill("trigger", player);
		thread room_song();
		if (level.jump_locked == false) {
			level.knife_locked = true;
			level.jump_locked = true;
			level.sniper_locked = true;
			level.room4_locked = true;
//AUTO 			iprintlnbold("^3" + player.name + "^7 choosed the jump room");
//AUTO 			player takeAllWeapons();
//AUTO 			player giveWeapon("knife_mp");
//AUTO 			player switchToWeapon("knife_mp");
			player SetOrigin(org_jumper.origin);
			player setPlayerAngles(org_jumper.angles);
			player thread onDeath_jump();
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
//AUTO 						players[i] takeAllWeapons();
//AUTO 						players[i] giveWeapon("knife_mp");
//AUTO 						players[i] switchToWeapon("knife_mp");
						players[i] SetOrigin(org_acti.origin);
						players[i] setPlayerAngles(org_acti.angles);
					}
				}
				return;
			}
		}
	}
}


snip_room() {
	trig = getEnt("sniper", "targetname");
	org_acti = getEnt("sniper_acti", "targetname");
	org_jumper = getEnt("sniper_jumper", "targetname");
	while (1) {
		trig waittill("trigger", player);
		thread room_song();
		if (level.sniper_locked == false) {
			level.knife_locked = true;
			level.jump_locked = true;
			level.sniper_locked = true;
			level.room4_locked = true;
//AUTO 			iprintlnbold("^3" + player.name + "^7 choosed the sniper room");
//AUTO 			player takeAllWeapons();
//AUTO 			player giveWeapon("m40a3_mp");
//AUTO 			player switchToWeapon("m40a3_mp");
			player SetOrigin(org_jumper.origin);
			player setPlayerAngles(org_jumper.angles);
			player thread onDeath_sniper();
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
//AUTO 						players[i] takeAllWeapons();
//AUTO 						players[i] giveWeapon("m40a3_mp");
//AUTO 						players[i] giveWeapon("remington700_mp");
//AUTO 						players[i] switchToWeapon("m40a3_mp");
						players[i] SetOrigin(org_acti.origin);
						players[i] setPlayerAngles(org_acti.angles);
					}
				}
				return;
			}
		}
	}
}


room4_room() {
	trig = getEnt("old", "targetname");
	org_jumper = getEnt("old_jumper", "targetname");
	door = getEnt("old_door", "targetname");
	while (1) {
		trig waittill("trigger", player);
		thread room_song();
		if (level.room4_locked == false) {
			level.knife_locked = true;
			level.jump_locked = true;
			level.sniper_locked = true;
			level.room4_locked = true;
				if(isDefined(door))
					door delete();
//AUTO 			iprintlnbold("^3" + player.name + "^7 choosed the original way");
			player SetOrigin(org_jumper.origin);
			player setPlayerAngles(org_jumper.angles);
			player thread onDeath_room4();
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
//AUTO 						players[i] takeAllWeapons();
//AUTO 						players[i] giveWeapon("knife_mp");
//AUTO 						players[i] switchToWeapon("knife_mp");
					}
				}
				return;
			}
		}
	}
}


onDeath_knife() {
	self waittill("death");
	level.jump_locked = false;
	level.knife_locked = false;
	level.sniper_locked = false;
	level.room4_locked = false;
	thread knife_room();
}


onDeath_jump() {
	self waittill("death");
	level.jump_locked = false;
	level.knife_locked = false;
	level.sniper_locked = false;
	level.room4_locked = false;
	thread jump_room();
}


onDeath_sniper() {
	self waittill("death");
	level.jump_locked = false;
	level.knife_locked = false;
	level.sniper_locked = false;
	level.room4_locked = false;
	thread snip_room();
}


onDeath_room4() {
	self waittill("death");
	level.jump_locked = false;
	level.knife_locked = false;
	level.sniper_locked = false;
	level.room4_locked = false;
	thread room4_room();
}


secret1() {
trig = getEntArray("secret1", "targetname");
	while(1)
	{
	trig[0] waittill("trigger", player);
	trig[1] waittill("trigger", player);
//AUTO 	player iprintlnbold("^9uh?");
	trig[3] waittill("trigger", player);
	trig[2] waittill("trigger", player);
//AUTO 	player iprintlnbold("^9uh oh!");
	trig[4] waittill("trigger", player);
	trig[5] waittill("trigger", player);
//AUTO 	player iprintlnbold("^9hehe!");
	
	thread room_song();
	
	player freezeControls(true);
//AUTO 	player iPrintLnBold("^2Secret Room");
//AUTO 	iprintln("^2" + player.name + " found the secret room!");
	player SetOrigin(getEnt("secret1back_org", "targetname").origin);
	player SetPlayerAngles(getEnt("secret1back_org", "targetname").angles);
	wait.5;
	player freezeControls(false);
	}
}


secret_stuff0_0() {
	lol1 = getEnt("secret_moving1", "targetname");
	lol2 = getEnt("secret_moving2", "targetname");
	lol3 = getEnt("secret_moving3", "targetname");
	while (1) {
		lol1 moveY(-400, 2);
		lol2 moveY(400, 2);
		lol3 moveX(100, 2);
		wait 2.05;
		lol1 moveY(400, 2);
		lol2 moveY(-400, 2);
		lol3 moveX(-100, 2);
		wait 2.05;
	}
}


secret_stuff0_7() {
	lol4 = getEnt("godhelpme", "targetname");
	lol5 = getEnt("ohgod", "targetname");
	lol4 waittill("trigger", player);
	lol4 delete();
	lol5 moveZ(-150, 2);
	wait 2.05;
	lol5 delete();
}


secret_stuff0_3() {
	lol6 = getEnt("gift", "targetname");
	while (1) {
		lol6 waittill("trigger", player);
		if (player.weapons < 3) {
			player rtdweap();
		} else {
//AUTO 			player iPrintLnBold("^2Sorry man we are out of weapons");
		}
		player.weapons++;
		wait 0.5;
	}
}


rtdweap() {
	x = RandomInt(5);
	q = "You got a";
	switch (x) {
		case 0:
			self givewep("remington700_mp");
//AUTO 			self iPrintLnBold(q + " remington700_mp");
			break;
		case 1:
			self givewep("m40a3_mp");
//AUTO 			self iPrintLnBold(q + " m40a3_mp");
			break;
		case 2:
			self givewep("dragunov_mp");
//AUTO 			self iPrintLnBold(q + " dragunov_mp");
			break;
		case 3:
			self givewep("barrett_mp");
//AUTO 			self iPrintLnBold(q + " barrett_mp");
			break;
		case 4:
			self givewep("brick_blaster_mp");
//AUTO 			self iPrintLnBold(q + " brick_blaster_mp");
			break;
	}
}


givewep(weapon, ammo) {
	if (isDefined(ammo)) {
//AUTO 		self GiveWeapon(weapon);
//AUTO 		self SwitchToWeapon(weapon);
	} else if (!isDefined(ammo)) {
//AUTO 		self GiveWeapon(weapon);
//AUTO 		self GiveMaxAmmo(weapon);
//AUTO 		self SwitchToWeapon(weapon);
	}
}

