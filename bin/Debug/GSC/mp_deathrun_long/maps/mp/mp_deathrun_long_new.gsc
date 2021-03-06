main()
{
	maps\createart\mp_deathrun_long_art::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
	maps\mp\mp_deathrun_long_fx::main();
	maps\mp\_load::main();
	
//	maps\mp\_compass::setupMiniMap( "compass_map_mp_deathrun_long" );
	
//AUTO 	ambientPlay( "ambient_crash" );

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setDvar( "compassmaxrange", "1024" );

	// total traps: 15
	// activated by user: 12
	// allways active (and, or hidden): 3
	thread trap_1();
	thread trap_2();
	thread trap_3();
	thread trap_4();
	thread trap_5(); //no activation needed (allways active)
	thread trap_6();
	thread trap_7();
	thread trap_8();
	thread trap_9();
	thread trap_10();
	thread trap_11();
	thread trap_12();
	thread trap_13();
}

trap_1()
{
	trig = getEnt( "trigger1", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap1", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotateRoll( 180, 3 );
		wait 3;
	}
}

trap_2()
{
	trig = getEnt( "trigger2", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 4; i++ )
	{
		brush rotatePitch( 180, 2 );
		wait 2;
	}
	brush.angles = (0,0,0);
}

trap_3()
{
	trig = getEnt( "trigger3", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap3", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	brush rotatePitch( 90, 2 );
	wait 4;
	brush rotatePitch( 90, 2 );
}

trap_4()
{
	trig = getEnt( "trigger4", "targetname" );
	level endon("trigger");

	brush1 = getEnt( "trap4_1", "targetname" );
	brush2 = getEnt( "trap4_2", "targetname" );

	oldOrigin1 = brush1.origin;
	oldOrigin2 = brush2.origin;

	trig waittill( "trigger", who );

	moveTo = getEnt( brush1.target, "targetname" );
	brush1 moveTo( moveTo.origin, 1.2 );
	moveTo = getEnt( brush2.target, "targetname" );
	brush2 moveTo( moveTo.origin, 1.2 );

	wait 1.2;

	trig waittill( "trigger", who );
	trig delete();

	brush1 moveTo( oldOrigin1, 1.2 );
	brush2 moveTo( oldOrigin2, 1.2 );
}

trap_5()
{
	brush1 = getEnt( "trap5_right", "targetname" );
	brush2 = getEnt( "trap5_left", "targetname" );

	brush1 rotatePitch( -30, 0.05 );
	brush2 rotatePitch( 30, 0.05 );
	wait .05;
	while( 1 )
	{
		brush1 rotatePitch( 60, 1.8, 0.4, 0.4  );
		brush2 rotatePitch( -60, 1.8, 0.4, 0.4  );
		wait 1.8;
		brush1 rotatePitch( -60, 1.8, 0.4, 0.4 );
		brush2 rotatePitch( 60, 1.8, 0.4, 0.4  );
		wait 1.8;
	}
}

trap_6()
{
	trig = getEnt( "trigger5", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap6", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush delete();
}

trap_7()
{
	trig = getEnt( "trigger7", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap7", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush delete();
}

trap_8()
{
	trig = getEnt( "trigger8", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap8", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	brush moveZ( 200, 1 );
	wait 5;
	brush moveZ( -200, 1 );
}

trap_9()
{
	trig = getEnt( "trigger9", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap9", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 8; i++ )
	{
		brush rotateYaw( 360, 1 );
		wait 1;
	}
}

trap_10()
{
	trig = getEnt( "trigger10", "targetname" );
	level endon("trigger");
	killtrigger = getEnt( "trap10_killtrigger", "targetname" );
	killtrigger2 = getEnt( "trap10_killtrigger2", "targetname" );
	brush = getEnt( "trap10", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	killtrigger enableLinkTo();
	killtrigger linkTo( brush );
	killtrigger2 enableLinkTo();
	killtrigger2 linkTo( brush );

	oldOrigin = brush.origin;
	target = getEnt( brush.target, "targetname" );
	brush moveTo( target.origin, 1 );
	wait 1;
	earthquake( 2, 1, target.origin, 512 );

	killtrigger unLink();
	killtrigger delete();
	killtrigger2 unLink();
	killtrigger2 delete();

	wait 6;
	brush moveTo( oldOrigin, 3 );
}

trap_11()
{
	trig = getEnt( "trigger11", "targetname" );
	level endon("trigger");
	brushGroup1 = getEntArray( "trap11_1", "targetname" );
	brushGroup2 = getEntArray( "trap11_2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();
}

trap_12()
{
	trig = getEnt( "trigger12", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap12", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	
	for( i = 0; i < 2; i++ )
	{
		brush rotateYaw( 512, 3 );
		wait 3;
		brush rotateYaw( -512, 3 );
		wait 3;
	}
}

trap_13()
{
	trig = getEnt( "trigger13", "targetname" );
	level endon("trigger");
	brush = getEnt( "trap13", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush delete();
}

