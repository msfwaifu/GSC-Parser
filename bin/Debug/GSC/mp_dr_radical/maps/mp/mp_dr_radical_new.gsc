main()
{

	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//AUTO 	ambientplay("soundalis");
//AUTO 	ambientplay("tuesday");
	
	maps\mp\_load::main(); 

	addTriggerToList( "trigger_trap1" );
    addTriggerToList( "trigger_trap2" );
	addTriggerToList( "trigger_trap3" );
    addTriggerToList( "trigger_trap4" );
	addTriggerToList( "trigger_trap5" );
    addTriggerToList( "trigger_trap6" );
	addTriggerToList( "trigger_trap7" );
    addTriggerToList( "trigger_trap8" );
    addTriggerToList( "trigger_trap9" );
	precacheItem( "rpg_mp" );
	precacheItem( "m40a3_mp" );
	precacheItem( "remington700_mp");
		
		
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

		
	//Dvars
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");

		
	//Traps
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();

//AUTO 	//Rooms
//AUTO 	thread sniper();
	thread hunter();
//AUTO 	thread knife();

	//Misc
	thread shitty1();

	
	//jumperteleports
	thread teleport1();
//AUTO  	thread endrooms();
 	
	//actiteleports
	thread ateleport1();
	thread ateleport2();
		
	//secret
	thread secret1();
		
	//fx
	thread fx();

	//Messages
//AUTO 	thread iPrintlns();
	thread hudmessage();


	level._effect["explode"] = LoadFX("dr/explode");
	level._effect["splash"] = LoadFX("dr/splash");
	level._effect["greenflame_fx"] = LoadFX("dr/greenflame");	
}

	addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

trap1()
{
	trap1 = getEnt("trap1", "targetname");
	trigger = getEnt("trigger_trap1", "targetname");
	splash_fx = getEnt("splash_fx", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger");
	trigger delete();
	
	{
		trap1 moveZ(-30, 1.5);
		wait .2;
		playFx ( level._effect["splash"], splash_fx.origin );
		trap1 waittill("movedone");
		
		wait 2;
	}
*/}

trap2()
{
	trap2a = getEnt("trap2a", "targetname");
	trap2b = getEnt("trap2b", "targetname");
	trigger = getEnt("trigger_trap2", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger", player );
	trigger delete();
	{
		h = randomint(2);
		if(h == 0)
		{
			trap2a hide();
			trap2a notsolid();
		}
		if(h == 1)
		{
			trap2b hide();
			trap2b notsolid();
		}
	}
*/}

trap3()
{
	trap3a = getEnt("trap3a", "targetname");
	trap3b = getEnt("trap3b", "targetname");
	trigger = getEnt("trigger_trap3", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger", player );
	trigger delete();
	while(1)
	{
		trap3a moveZ(-300, 3);
		trap3a waittill("movedone");
		trap3b moveZ(430, 5);
		trap3b waittill("movedone");
		
		wait 3;
		
		wait 6;
		trap3a moveZ(300, 3);
		trap3a waittill("movedone");
		trap3b moveZ(-430, 5);
		trap3b waittill("movedone");
		
		wait 3;
	}
*/}

trap4()
{
	object = getent("trap4","targetname");
	trigger = getent("trigger_trap4","targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
	killtrigger = getent("killtrig1", "targetname"); 
/* AUTO 	trigger waittill ("trigger", player );
	trigger delete(); 
	killtrigger enablelinkto ();
	{
		killtrigger linkto (object);
		object movez(90, 3 , 1, 2);
		object waittill("movedone");
		wait 1;
		object movez(-90, 3, 1, 2);
		object waittill("movedone");
		wait 5;
    }
*/}

trap5()
{
	trap5 = getEnt("trap5", "targetname");
	trigger = getEnt("trigger_trap5", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger", player );
	trigger delete();
	while(1)
	{
		trap5 moveX(-200, 2);
		trap5 waittill("movedone");
		wait 2;
		trap5 moveX(200, 2);
		trap5 waittill("movedone");
		wait 2;
	}
*/}

trap6()
{
	trap6 = getEnt("trap6", "targetname");
	trigger = getEnt("trigger_trap6", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger", player );
	trigger delete();
	while(1)
	{
		trap6 moveZ(80, 1);
		trap6 waittill("movedone");
		
		wait 3;
		
		trap6 moveZ(-80, 3);
		trap6 waittill("movedone");
		
		wait 2;
	}
*/}

trap7()
{
	trap7 = getEnt("trap7", "targetname");
	trigger = getEnt("trigger_trap7", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger");
	trigger delete();
	{
		trap7 moveZ(-80, 1.5);
		trap7 waittill("movedone");
		wait 2;
		trap7 moveZ(80, 2);
		trap7 waittill("movedone");
		wait 2;
	}
*/}

trap8()
{
	trap8a = getEnt("trap8a", "targetname");
	trap8b = getEnt("trap8b", "targetname");
	trigger = getEnt("trigger_trap8", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger");
	trigger delete();
	while(1)
	{
		trap8a rotateYaw(360, 3);
		trap8b rotateYaw(360,3);
		
		wait 5;
	}
*/}

trap9()
{
	trap9 = getEnt("trap9", "targetname");
	trigger = getEnt("trigger_trap9", "targetname");
	explosion = getEnt("explosion", "targetname");
	trigger sethintstring("^5Awaiting ^3Authorization!");
/* AUTO 	trigger waittill("trigger");
	trigger delete();
	{
		trap9 hide();
		trap9 notsolid();
		playFx ( level._effect["explode"], explosion.origin );
	}
*/}

sniper()
{
    level.sniper = getEnt( "sniper_trig", "targetname");
    jump = getEnt( "jumper_snip", "targetname" );
    acti = getEnt( "acti_snip", "targetname" );
    level.sniper setHintString("^2Press ^1[USE] ^2to enter ^1Sniper");
    while(1)
    {
        level.sniper setHintString("^2Press ^1[USE] ^2to enter ^1Sniper");
        level.sniper waittill("trigger", player);
        if(!isDefined(level.sniper))
            return;
        level.knife delete();
        level.bounce delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "m40a3_mp" );
//AUTO         player GiveWeapon( "remington700_mp" );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "m40a3_mp" );
//AUTO         level.activ GiveWeapon( "remington700_mp" );
//AUTO         wait 0.05;
//AUTO         player switchToWeapon( "m40a3_mp" );
//AUTO         level.activ SwitchToWeapon( "m40a3_mp" );
        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose Sniper Room";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
//AUTO             wait 5;
        player FreezeControls(0);
        level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

hunter()
{
    level.hunter = getEnt( "hunter_trig", "targetname");
    jump = getEnt( "jumper_hunter", "targetname" );
    acti = getEnt( "acti_hunter", "targetname" );
    level.hunter setHintString("^2Press ^1[USE] ^2to enter ^1The Hunt!");
    while(1)
    {
        level.hunter setHintString("^3Press ^1[USE] ^4to enter ^8The Hunt!");
        level.hunter waittill("trigger", player);
        if(!isDefined(level.hunter))
            return;
        level.knife delete();
        level.bounce delete();
		level.snipe delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "remington700_mp" );
//AUTO         player GiveWeapon( "m40a3_mp" );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "colt45_mp" );
//AUTO         level.activ GiveWeapon( "deserteagle_mp" );
//AUTO         wait 0.05;
//AUTO         player switchToWeapon( "remington700_mp" );
//AUTO         level.activ SwitchToWeapon( "deserteagle_mp" );
        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose The Hunters Room! ^3Hunt ^2Or ^1Be ^6Hunted^3!";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
//AUTO             wait 5;
        player FreezeControls(0);
        level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

knife()
{

	level.knife = getEnt( "knife_trig", "targetname");
    jump = getEnt( "jumper_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
    level.knife setHintString("^2Press ^1[USE] ^2to enter ^1Knife");
    while(1)
    {
    	level.knife setHintString("^2Press ^1[USE] ^2to enter ^1Knife");
        level.knife waittill( "trigger", player );
        if(!isDefined(level.knife))
            return;
        level.sniper delete();
        level.bounce delete();
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
//AUTO         player TakeAllWeapons();
//AUTO         player GiveWeapon( "knife_mp" );
//AUTO         level.activ TakeAllWeapons();
//AUTO         level.activ GiveWeapon( "knife_mp" );
//AUTO         wait 0.05;
//AUTO         player switchToWeapon( "knife_mp" );
//AUTO         level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose Knife Room";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
//AUTO             wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
//AUTO             wait 1;
    }
}

shitty1() 
{
	shitty1 = getEnt( "shitty1", "targetname" ); 
	trig = getEnt( "trigger_shitty1", "targetname" ); 
	button = getEnt("button", "targetname");
	
	while(1) 
	{ 
		trig waittill ("trigger");
		shitty1 moveY (686, 4);
		button moveY (686, 4);
		shitty1 waittill ("movedone");
		button waittill ("movedone");
		wait .5;
		shitty1 moveY (-686, 4);
		button moveY (-686, 4);
		shitty1 waittill ("movedone");
		button waittill ("movedone");
		
		wait 3;  
	} 
}

teleport1()
{
 trig = getEnt("trigger_teleport1", "targetname");
 tele1 = getEnt("jumper1_teleport", "targetname");
 
 for(;;)
 {
  trig waittill("trigger", player );
  player setOrigin(tele1.origin);
 }
}

endrooms()
{
 trig = getEnt("trigger_endrooms", "targetname");
 endrooms = getEnt("endrooms_teleport", "targetname");

 for(;;)
 {
  trig waittill("trigger", player );
  player setOrigin(endrooms.origin);
 }
}

ateleport1()
{
 trig = getEnt("trigger_ateleport1", "targetname");
 atele1 = getEnt("acti1_teleport", "targetname");
 
 for(;;)
 {
  trig waittill("trigger", player );
  player setOrigin(atele1.origin);
 }
}

ateleport2()
{
 trig = getEnt("trigger_ateleport2", "targetname");
 atele2 = getEnt("acti2_teleport", "targetname");
 
 for(;;)
 {
  trig waittill("trigger", player );
  player setOrigin(atele2.origin);
 }
}

secret1()
{
 trig = getEnt("trigger_secret1", "targetname");
 stele1 = getEnt("secret1_teleport", "targetname");
 
 for(;;)
 {
  trig waittill("trigger", player );
  player setOrigin(stele1.origin);
 }
}

fx()
{
	{
		greenflame = getentarray("greenflame_fx", "targetname");
		for(i=0;i<greenflame.size;i++)
		{
			spawn_greenflame[i] = maps\mp\_utility::createOneShotEffect( "greenflame_fx" );
			spawn_greenflame[i].v[ "origin" ] = greenflame[i].origin;
			spawn_greenflame[i].v[ "angles" ] = ( 270, 0, 0 );
			spawn_greenflame[i].v[ "fixid" ] = "greenflame_fx";
			spawn_greenflame[i].v[ "delay" ] = -13;
		}
	}
}

iprintlns()
{
    while(1)
    {
//AUTO         iprintln("^5Server:^7 Map Made By ^5VC' ^7R3K");
        wait 10;
//AUTO         iprintln("^6 I Hope You All Enjoy ^4Radical");
        wait 10;
//AUTO         iprintln("^8Server:^1 mp_dr_^5radical");
        wait 10;
    }
}

hudmessage()
{
    level waittill("round_started");

    level.message = NewHudElem();
    level.message.alignX = "center";
    level.message.alignY = "middle";
    level.message.horzalign = "center";
    level.message.vertalign = "middle";
    level.message.alpha = 1;
    level.message.x = 0;
    level.message.y = 0;
    level.message.fontscale = 2;
    level.message.glowalpha = 1;
    level.message.glowcolor = (1, 0.5, 0);
    level.message.label = &"Map by VC' R3K";
    level.message SetPulseFX( 40, 5400, 200 );
    wait 3;
    level.message destroy();
}

