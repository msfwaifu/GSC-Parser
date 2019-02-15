main()
{
 maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
 
//AUTO  precacheItem("knife_mp");
 precacheItem("cherry_bo_L96_mp");
 precacheItem("cherry_sword_mp");
 precacheItem("cherry_minigun_mp");
 precacheModel( "playermodel_terminator" );
 precacheModel( "playermodel_aot_rosco_00_light" );

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 setdvar( "r_specularcolorscale", "1" );
 setdvar("r_glowbloomintensity0",".25");
 setdvar("r_glowbloomintensity1",".25");
 setdvar("r_glowskybleedintensity0",".3");
 setdvar("compassmaxrange","1800");

 
//AUTO  level.darmuh = "Darmuh"; //It's quite pointless to take my name but if you really want to use it you'll get a gold deagle rather than a normal deagle.
 level.irroy8 = "irRoy8";
 level.bjump1 = getEnt( "jb1", "targetname" );
 level.bacti1 = getEnt( "ab1", "targetname" );
 level.bjump2 = getEnt( "jb2", "targetname" );
 level.bacti2 = getEnt( "ab2", "targetname" );
 level.bjump3 = getEnt( "jb3", "targetname" );
 level.bacti3 = getEnt( "ab3", "targetname" );
 level._spraysion[ "Sprode" ] = loadfx( "explosions/aerial_explosion_large" );
 level.firstenter=true;

 
addTriggerToList( "t1use" );
addTriggerToList( "t2use" );
addTriggerToList( "t3use" );
addTriggerToList( "t4use" );
addTriggerToList( "t5use" );
addTriggerToList( "t6use" );
addTriggerToList( "t7use" );
addTriggerToList( "t8use" );
addTriggerToList( "t9use" );
addTriggerToList( "t10use" );
addTriggerToList( "t11use" );
addTriggerToList( "t12use" );
addTriggerToList( "t13use" );

thread trap1();
thread mtrap2();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread trap9();
thread trap10();
thread trap11();
thread trap12();
thread trap13();
thread movefirst();
thread gmove1();
thread gmove2();
thread gmove3();
thread gmove4();
thread elevator();
thread platform1();
thread platform2();
thread platform3();
thread rblocks();
//AUTO thread OldRoom();
thread stahp();
thread wutru();
thread doing();
//AUTO thread sniperoom();
thread snipevator();
thread snipehover();
thread ammo();
//AUTO thread knifewwroom();
//AUTO thread kniferoom();
thread srct();
thread srctfail();
thread secsee();
//AUTO thread jumproom();
thread jumpreset1();
thread jumpreset2();
thread jumpreset3();
//AUTO thread sprayroom();
thread startbutton();
thread startdoor();
thread signs();
thread spam();
//AUTO //thread dynamic_wep_dmg(); Moved to inside spray room thread (Scripted by Duffman)
//AUTO thread deagle();
//AUTO thread dogroom();
thread yayufinished();

}

dynamic_wep_dmg() //(c)Duffman
{
	for(i=5;i<20;i++)//15 diffent steps
	{
		setDvar("dr_damageMod_cherry_minigun_mp", i / 5);
//AUTO 		wait 30 * 3;	//changed as I was getting an error saying "undefined is not an array string or vector" using wait level.dvar["time_limit"] * 3; I tried other dvars without success.
	}
}

srct()
{
 trig = getent("secfin", "targetname");
 end = getent("secorg", "targetname");

	for(;;)
	{
		trig waittill ( "trigger", player );
		player setplayerangles( end.angles, 3 );
		player setorigin( end.origin, 3 );
	}
}

secsee()
{
    trig = getent("secfin", "targetname");

    for(;;)
    {
	trig waittill ("trigger", player);
		player detachAll();
//AUTO 		player iPrintLn("Model changing.....");
		player setModel("playermodel_aot_rosco_00_light");
//AUTO 		player iPrintLn("Hey look you're ^3Rosco^7!");
//AUTO 		player giveweapon( "cherry_sword_mp" );
//AUTO 		player SwitchToWeapon( "cherry_sword_mp" );
    }
}

srctfail()
{
 trig = getent("reset", "targetname");
 end = getent("secforg", "targetname");

	for(;;)
	{
		trig waittill ( "trigger", player );
		player setplayerangles( end.angles, 3 );
		player setorigin( end.origin, 3 );
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

ambient()
{
//AUTO AmbientPlay ( "fity" );
wait 20;
//AUTO iprintln( "Now Playing: ^1Gramatik - In My City" );
}

signs()
{
 brusha = getent( "sign1", "targetname" );
 brushb = getent( "sign2", "targetname" );
 brushc = getent( "sign3", "targetname" );
 
	for(;;)
	{
	    brusha show();
	    brushc hide();
	    brushc notsolid();
	    brushb hide();
	    brushb notsolid();
	    wait 4;
	    brusha hide();
	    brusha notsolid();
	    brushc hide();
	    brushc notsolid();
	    brushb show();
	    brushb solid();
	    wait 4;
	    brushb hide();
	    brushb notsolid();
	    brushb hide();
	    brushb notsolid();
	    brushc show();
	    brushc solid();
	    wait 4;
	}	
}

startbutton()
{
 trig = getent("startbutton", "targetname");
 level.dermuh = "ffbb9d529c5fbeb275d1fcf8aedc2203";
 brush = getent("button", "targetname");
	
	trig waittill ( "trigger", who );
	brush movey (6,1);
	wait 1;
	who playsound ( "bttn" );
//AUTO 	iPrintLnBold("^1Map Made By^2 Darmuh "); //Change the message if you want
	wait(1);
	who playsound ( "bttn" );
//AUTO 	iPrintLn("^1Thanks To^3 Xenon"); //Change the message if you want
	wait(1);
	who playsound ( "bttn" );
//AUTO 	iPrintLn("^1Thanks To^3 Wingzor"); //Change the message if you want
	wait(1);
	who playsound ( "bttn" );
//AUTO 	iPrintLn("^1Thanks To^3 DJTimB"); //Change the message if you want
	trig delete();
	thread ambient();
}

startdoor()
{
 brush = getent("startdoor", "targetname");
 
	wait 10;
	brush playsound ( "bttn" );
	brush movez (-1000, 5);
	brush waittill ("movedone");
//AUTO 	iprintlnbold("^7Start door ^3opened^7.");
}

hover()
{
 acti = getent("acticherry", "targetname");
 
    for(;;)
    {
	acti movez ( -20, 1 );
	acti waittill ("movedone");
	acti movez ( 20, 1 );
	acti waittill ("movedone");
    }
}

gmove1()
{
 brush = getent("t5m1", "targetname");
 
    for(;;)
    {
	brush movey (650, 3.5);
	wait 3.5;
	brush movey (-650, 3.5);
	wait 3.5;
    }
}

gmove2()
{
 brush = getent("t5m2", "targetname");
 
    for(;;)
    {
	brush movey (-650, 3.5);
	wait 3;
	brush movey (650, 3.5);
	wait 3;
    }
}

gmove4()
{
 brush = getent("t5m4", "targetname");
 
    for(;;)
    {
	brush movey (-650, 3.5);
	wait 3.5;
	brush movey (650, 3.5);
	wait 3.5;
    }
}

gmove3()
{
 brush = getent("t5m3", "targetname");
 
    for(;;)
    {
	brush movey (650, 3.5);
	wait 3.5;
	brush movey (-650, 3.5);
	wait 3.5;
    }
}

rblocks()
{
 brush = getent( "t1r2", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( 360,25);
	    wait 10;
	}
}

trap1()
{
 trig = getEnt( "t1use", "targetname" );
 brush = getEnt( "t1rotate", "targetname" );
 ent = getEnt( "trap1_sound", "targetname" );

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );
     
	for(;;)
	{
	    brush rotateyaw( -360, 5);
	    ent playsound ( "fan" );
	    wait 1.1;
	}
*/}

mtrap2()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t2m", "targetname");
 trig = getent("t1mt", "targetname");
 
 
/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap3();
		
    
*/}

trap2()
{
 trig = getEnt( "t2use", "targetname" );
 brush = getEnt( "t2rtate", "targetname" );
 solid = getent( "tss1", "targetname");

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     solid notsolid();
     solid hide();
     who playsound ( "bttn" );
     
	for(;;)
	{
	    brush rotatepitch( -360, 4);
	    wait 4;
	}
*/}

mtrap3()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t3m", "targetname");
 trig = getent("t2mt", "targetname");
 

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap4();
		
    
*/}

trap3()
{
 trig = getEnt( "t3use", "targetname" );

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );

		for(;;) //I tried RandomInts. I just suck with em. I might try em again in my next map.
		{
			thread trap3a();
			wait 1.1;
			thread trap3b();
			wait 1.1;
			thread trap3c();
			wait 1.1;
			thread trap3b();
			wait 1.1;
			thread trap3a();
			wait 1.1;
			thread trap3c();
			wait 1.1;
			thread trap3c();
			wait 1.1;
			thread trap3b();
			wait 1.1;
			thread trap3a();
			wait 1.1;
		}
*/}

trap3a()
{
 brush = getent( "t3rtate", "targetname" );
 
	 brush movez(-400, 0.25);
	 wait 0.5;
	 brush movez(400, 0.25);
	 wait 0.5;
}

trap3b()
{
 brush = getent( "t3rtate2", "targetname" );
 
	 brush movez(-400, 0.25);
	 wait 0.5;
	 brush movez(400, 0.25);
	 wait 0.5;
}

trap3c()
{
 brush = getent( "t3rtate3", "targetname" );
 
	 brush movez(-400, 0.25);
	 wait 0.5;
	 brush movez(400, 0.25);
	 wait 0.5;
}

mtrap4()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t4m", "targetname");
 trig = getent("t3mt", "targetname");
 

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap5();
		
    
*/}

trap4()
{
 trig = getEnt( "t4use", "targetname" );

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );

	thread trap4a();
	thread trap4b();
	thread trap4c();
	thread trap4d();
	thread trap4e();
	thread trap4f();
	thread trap4g();
*/}

trap4a()
{
 brush = getEnt( "t4r1", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( 360, 3);
	    wait 3;
	}
}

trap4b()
{
 brush = getEnt( "t4r2", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( 360, 3);
	    wait 3;
	}
}

trap4c()
{
 brush = getEnt( "t4r3", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( 360, 3);
	    wait 3;
	}
}

trap4d()
{
 brush = getEnt( "t4r4", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( -360, 4);
	    wait 4;
	}
}

trap4e()
{
 brush = getEnt( "t4r5", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( -360, 4);
	    wait 4;
	}
}

trap4f()
{
 brush = getEnt( "t4r6", "targetname" );
 
	for(;;)
	{
	    brush rotateyaw( -360, 4);
	    wait 4;
	}
}

trap4g()
{
 brush = getEnt( "t4ud", "targetname" );
 
	for(;;)
	{
	    brush movez( 50, 2 );
	    wait 2;
	    brush movez( -50, 2 );
	    wait 2;
	}
}

mtrap5()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t5m", "targetname");
 trig = getent("t4mt", "targetname");
 

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap6();
    
*/}

trap5()
{
 trig = getEnt( "t5use", "targetname" );

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );

	thread trap5a();
	thread trap5b();
	thread trap5c();
*/}

trap5a()
{
 brush = getEnt( "t5r1", "targetname" );
 sound = getent( "trap5_sound1", "targetname" );

	sound thread machinesound();
	
	for(;;)
	{
	    brush rotateroll( 360, 4 );
/* AUTO 	    brush waittill ("rotatedone");
	}
*/}

trap5b()
{
 brush = getEnt( "t5r2", "targetname" );
 sound = getent( "trap5_sound2", "targetname" );

	sound thread machinesound();
	
	for(;;)
	{
	    brush rotateroll( -360, 3 );
/* AUTO 	    brush waittill ("rotatedone");
	}
*/}

trap5c()
{
 brush = getEnt( "t5r3", "targetname" );
 sound = getent( "trap5_sound3", "targetname" );

	sound thread machinesound();
	
	for(;;)
	{
	    brush rotateroll( 360, 4 );
/* AUTO 	    brush waittill ("rotatedone");
	}
*/}

machinesound()
{
    for(;;)
    {
	self playsound ( "machine" );
	wait .8;
    }
}

mtrap6()
{
 acti = getent("acticherry", "targetname");
 one = getent("t6mp1", "targetname");
 two = getent("t6mp2", "targetname");
 twe = getent("t6m", "targetname");
 trig = getent("t5mt", "targetname");

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (one.origin, 2);
		acti rotateto (one.angles, 2);
		acti waittill ("movedone");
		acti moveto (two.origin, 2);
		acti rotateto (two.angles, 2);
		acti waittill ("movedone");
		acti moveto (twe.origin, 2);
		acti rotateto (twe.angles, 2);
		acti waittill ("movedone");
		thread mtrap7();
		acti movez ( -20, 900 );
*/}

trap6()
{
 trig = getent( "t6use" , "targetname");
 brush = getEnt( "t6r1", "targetname" );
 solid = getent( "flohide", "targetname");

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );
     solid notsolid();
     solid hide();
     
	for(;;)
	{
	    brush rotatepitch( -360, 3);
	    wait 3;
	}
*/}

mtrap7()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t7m", "targetname");
 trig = getent("t6mt", "targetname");
 

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap8();
		
    
*/}

trap7()
{
 trig = getEnt( "t7use", "targetname" );
 brush = getEnt( "t7r1", "targetname" );

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );

	for(;;)
	{
	    brush rotateroll( 360, 3);
	    wait 3;
	}
*/}

mtrap8()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t8m", "targetname");
 trig = getent("t7mt", "targetname");
 

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap9();
		
    
*/}

trap8()
{
 trig = getEnt( "t8use", "targetname" );
 brush = getEnt( "t8m1", "targetname" );

/* AUTO      trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );
 
	    brush movez( -500, 1 );
	    wait 5;
	    brush movez( 500, 8 );
	    
	    
*/}

mtrap9()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t9m", "targetname");
 trig = getent("t8mt", "targetname");
 

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap10();
		
    
*/}

trap9()
{
 trig = getEnt( "t9use", "targetname" );
 brush = getEnt( "t9rollers", "targetname" );
 ent = getent( "rollersound1", "targetname" );
 org = getent( "rollersound2", "targetname" );

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );

	    for( i = 0; i < 8; i++ )
	    {
		brush rotateroll( 720, 4);
		ent thread mr12();
		org thread mr12();
		wait 10;
	    }
*/}

mr12()
{
    count = 5;
    while(count > 0)
    {
	self playsound ( "mrl2" );
	wait .8;
	count--;
    }
}

mtrap10()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t10m", "targetname");
 trig = getent("t9mt", "targetname");
 

/* AUTO 		trig waittill( "trigger", who );
		trig delete();
		who playsound ( "bttn" );
		wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap11();
		
    
*/}

trap10()
{
	trig = getent ("t10use", "targetname");
	objecta = getent ("t10m1", "targetname");
	objectb = getent ("t10m2", "targetname");
	ent = getent ("launchsound1", "targetname");
	org = getent ("launchsound2", "targetname");

/* AUTO 		trig waittill( "trigger", who );
		trig delete();
		who playsound ( "bttn" );
		wait (0.2);
		ent playsound ( "launch" );
		org playsound ( "launch" );
		objecta movez (20,0.1);
		objectb movez (600, 1);
		objectb waittill ("movedone");
		objectb notsolid();
		objecta movez (-20,2);
*/}

mtrap11()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t11m", "targetname");
 trig = getent("t10mt", "targetname");
 prgn = getent("p10m", "targetname");

/* AUTO 	trig waittill( "trigger", player );
	trig delete();
	player playsound ( "bttn" );
	wait 2;
		acti moveto (orgn.origin, 0.1);
		acti rotateto (orgn.angles, 0.1);
		acti waittill ("movedone");
		thread mtrap12();
    
*/}

trap11()
{
 trig = getent ("t11use", "targetname");
 objecta = getent ("low", "targetname");

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
		
	for(;;)
	{
		objecta movey (600,1);
		objecta playsound ( "zip" );
		wait 1;
		wait 3;
		objecta movey (-600,1);
		objecta playsound ( "zip" );
		wait 1;
		wait 3;
	}
*/}

mtrap12()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t12m", "targetname");
 trig = getent("t11mt", "targetname");
 

/* AUTO 		trig waittill( "trigger", who );
		trig delete();
		who playsound ( "bttn" );
		wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap13();
		
    
*/}

trap12()
{
 trig = getent ("t12use", "targetname");
	
/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	
	thread trap12a();
	thread trap12b();
	thread trap12c();
*/}

trap12a()
{
 spin = getent ("spin1", "targetname");
 
	for(;;)
	{
	spin rotateyaw (360,6);
	wait 6;
	}
}	

trap12b()
{
 spin = getent ("spin2", "targetname");
 
	for(;;)
	{
	spin rotateyaw (-360,3);
	wait 3;
	}
}	

trap12c()
{
 spin = getent ("t12r1", "targetname");
 
	for(;;)
	{
	spin rotateroll (360,4.5);
	wait 4.5;
	}
}	

mtrap13()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t13m", "targetname");
 trig = getent("t12mt", "targetname");
 

/* AUTO 		trig waittill( "trigger", who );
		trig delete();
		who playsound ( "bttn" );
		wait 2;
		acti moveto (orgn.origin, 2);
		acti rotateto (orgn.angles, 2);
		acti waittill ("movedone");
		thread mtrap14();
		
    
*/}

trap13()
{
 trig = getEnt( "t13use", "targetname" );
 brush = getEnt( "trap13", "targetname" );

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );

	    for( ;; )
	    {
		brush rotateroll( 180, 2);
		wait 3;
		brush rotateroll( -180, 2);
		wait 3;
		wait 5;
	    }
*/}

mtrap14()
{
 acti = getent("t14m", "targetname");
 cherry = getent("acticherry", "targetname");
 orgn = getent("t14m", "targetname");
 trig = getent("t13mt", "targetname");

/* AUTO 	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	wait 2;
		cherry rotateto (orgn.angles, 2);
		cherry waittill ("movedone");		
    
*/}

movefirst()
{
 acti = getent("acticherry", "targetname");
 orgn = getent("t1m", "targetname");
 trig = getent("cherrystart", "targetname");
 
	trig waittill( "trigger", who );
	trig delete();
	orgn playsound ( "bttn" );
	acti moveto (orgn.origin, 2);
	acti rotateto (orgn.angles, 2);
	acti waittill ("movedone");
	wait 0.5;
	thread hover();
    thread iminyoserver();
}

kniferoom()
{
 level.knife_trig = getEnt( "knife", "targetname");
 kjump = getEnt( "jumpk", "targetname" );
 kacti = getEnt( "actik", "targetname" );
 expl = getEnt( "meleesion", "targetname" );
 
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.spray_trig delete();
		level.jump_trig delete();
		level.old_trig delete();
		level.sword_trig delete();
		level.dog_trig delete();
		level.firstenter=false;
		}
	AmbientStop( 2 );
//AUTO 	AmbientPlay( "luvkick" );
	player SetPlayerAngles( kjump.angles );
	player setOrigin( kjump.origin );
	player freezeControls(true);
	level.activ freezeControls(true);
//AUTO 	player TakeAllWeapons();
//AUTO 	player giveweapon( "deserteagle_mp");
	player SetWeaponAmmoClip( "deserteagle_mp", 0 );
	player SetWeaponAmmoStock( "deserteagle_mp", 0 );      
	level.activ setPlayerangles( kacti.angles );
	level.activ setOrigin( kacti.origin );
//AUTO 	level.activ TakeAllWeapons();
//AUTO 	level.activ giveweapon( "deserteagle_mp");
	level.activ SetWeaponAmmoClip( "deserteagle_mp", 0 );
	level.activ SetWeaponAmmoStock( "deserteagle_mp", 0 );       
//AUTO 	player switchToWeapon( "deserteagle_mp" );
//AUTO 	level.activ SwitchToWeapon( "deserteagle_mp" );
//AUTO 	wait 1.9;
	playFx( level._spraysion[ "Sprode" ], expl.origin );
	player freezeControls(false);
	level.activ freezeControls(false);
//AUTO 	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1knife^7!" );
        player thread onDeath_knife();
//AUTO         wait 0.1;
       
    for(;;)
    {
//AUTO                 wait .1;               
                while(isAlive(player))
                {
//AUTO                         wait 1;
                }
               
    }
}

onDeath_knife()
{
        self endon("disconnect");
       
        self waittill("death");
        thread kniferoom();
}

kickstarts()
{
	wait 10;
//AUTO 	iPrintln( "^7Now Playing: ^3Example - Kickstarts (Bar 9 Remix)" );
}

knifewwroom()
{
 level.sword_trig = getEnt( "knifeww", "targetname");
 kjump = getEnt( "jumpk", "targetname" );
 kacti = getEnt( "actik", "targetname" );
 expl = getEnt( "meleesion", "targetname" );
	    
        level.sword_trig waittill( "trigger", player );
        if( !isDefined( level.sword_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.spray_trig delete();
		level.jump_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.dog_trig delete();
		level.firstenter=false;
		}
	AmbientStop( 2 );
//AUTO 	AmbientPlay( "luvkick" );
	player SetPlayerAngles( kjump.angles );
	player setOrigin( kjump.origin );
	player freezeControls(true);
	level.activ freezeControls(true);
//AUTO 	player TakeAllWeapons();
//AUTO 	player giveweapon( "cherry_sword_mp");  
	level.activ setPlayerangles( kacti.angles );
	level.activ setOrigin( kacti.origin );
//AUTO 	level.activ TakeAllWeapons();
//AUTO 	level.activ giveweapon( "cherry_sword_mp");   
//AUTO 	player switchToWeapon( "cherry_sword_mp" );
//AUTO 	level.activ SwitchToWeapon( "cherry_sword_mp" );
//AUTO 	wait 1.9;
	playFx( level._spraysion[ "Sprode" ], expl.origin );
	player freezeControls(false);
	level.activ freezeControls(false);
//AUTO 	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1sword^7!" );
//AUTO 	thread kickstarts();
        player thread onDeath_knifeww();
//AUTO         wait 0.1;
       
    for(;;)
    {
//AUTO                 wait .1;               
                while(isAlive(player))
                {
//AUTO                         wait 1;
                }
               
    }
}

onDeath_knifeww()
{
        self endon("disconnect");
       
        self waittill("death");
        thread knifewwroom();
}

jumproom()
{
 level.jump_trig = getEnt( "bounce", "targetname");
 expl = getEnt( "jumpsion", "targetname" );
	    
    {
        level.jump_trig waittill( "trigger", player );
        if( !isDefined( level.jump_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.old_trig delete();
		level.sword_trig delete();
		level.knife_trig delete();
		level.spray_trig delete();
		level.dog_trig delete();
		level.firstenter=false;
		}
		
	AmbientStop( 2 );
//AUTO 	AmbientPlay( "skyfall" );
	player SetPlayerAngles( level.bjump2.angles );
	player setOrigin( level.bjump2.origin );
	player freezeControls(true);
	level.activ freezeControls(true);
//AUTO 	player TakeAllWeapons();
//AUTO 	player giveweapon( "cherry_sword_mp");  
	level.activ setPlayerangles( level.bacti2.angles );
	level.activ setOrigin( level.bacti2.origin );
//AUTO 	level.activ TakeAllWeapons();
//AUTO 	level.activ giveweapon( "cherry_sword_mp");   
//AUTO 	player switchToWeapon( "cherry_sword_mp" );
//AUTO 	level.activ SwitchToWeapon( "cherry_sword_mp" );
	wait 5.7;
	playFx( level._spraysion[ "Sprode" ], expl.origin );
	player freezeControls(false);
	level.activ freezeControls(false);
//AUTO 	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1Jump^7!" );
	thread intimept();
	thread jumproom2();
    }
}

jumproom2()
{
 level.jump_trig = getEnt( "bounce", "targetname");

 while(1) 
    {
        level.jump_trig waittill( "trigger", player );
        if( !isDefined( level.jump_trig ) )
            return;
	player SetPlayerAngles( level.bjump2.angles );
	player setOrigin( level.bjump2.origin );
//AUTO 	player TakeAllWeapons();
//AUTO 	player giveweapon( "cherry_sword_mp");    
//AUTO 	player switchToWeapon( "cherry_sword_mp" );
//AUTO 	iPrintlnBold( " ^5" + player.name + " ^3 joined ^1Jump Room^7!" );
    }
}

intimept()
{
	wait 10;
//AUTO 	iPrintln( "^7Now Playing: ^3Skyfall (Clark Kent & Oscar Daniel Remix) " );
}

jumpreset()
{
 trig = getent("broomf", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if (level.freerun==true)
		{
		    player setplayerangles( level.bjump.angles, 3 );
		    player setorigin( level.bjump.origin, 3 );
		}
		if(player == level.activ)
		{
		    level.activ setPlayerangles( level.bacti.angles );
		    level.activ setOrigin( level.bacti.origin );
		}
		else
		{
		    player setplayerangles( level.bjump.angles, 3 );
		    player setorigin( level.bjump.origin, 3 );
		}
	}
}

jumpreset1(port_allies,port_axis)
{
 trig = getent("broomf", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti1.angles );
		    level.activ setOrigin( level.bacti1.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump1.angles, 3 );
		    player setorigin( level.bjump1.origin, 3 );
		}
	}
}

jumpreset2(port_allies,port_axis)
{
 trig = getent("broomf", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti2.angles );
		    level.activ setOrigin( level.bacti2.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump2.angles, 3 );
		    player setorigin( level.bjump2.origin, 3 );
		}
	}
}

jumpreset3(port_allies,port_axis)
{
 trig = getent("broomf", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti3.angles );
		    level.activ setOrigin( level.bacti3.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump3.angles, 3 );
		    player setorigin( level.bjump3.origin, 3 );
		}
	}
}

platform1()
{
 object = getent("plat1", "targetname");
 end = getent("plat1o", "targetname");
 start = getent("plat1strt", "targetname");
 
     for(;;)
     {
	object moveto ( end.origin, 2.5 );
	object waittill ("movedone");
	object moveto ( start.origin, 2.5);
	object waittill ("movedone");
     }
}

platform2()
{
 object = getent("plat2", "targetname");
 end = getent("plat2o", "targetname");
 start = getent("plat2strt", "targetname");
 
     for(;;)
     {
	object moveto ( end.origin, 2.5 );
	object waittill ("movedone");
	object moveto ( start.origin, 2.5);
	object waittill ("movedone");
     }
}

platform3()
{
 object = getent("plat3", "targetname");
 end = getent("plat3o", "targetname");
 start = getent("plat3strt", "targetname");
 
     for(;;)
     {
	object moveto ( end.origin, 2.5 );
	object waittill ("movedone");
	object moveto ( start.origin, 2.5);
	object waittill ("movedone");
     }
}

elevator()
{
 brush = getent("elevator", "targetname");
 
     for(;;)
     {
	brush movez (770, 5);
	brush waittill ("movedone");
	wait 2;
	brush movez (-770, 3);
	brush waittill ("movedone");
	wait 2;
     }
}

OldRoom()
{
 level.old_trig = getEnt( "classic", "targetname");
 object = getent("olddoor", "targetname");
 acti = getent("t14m", "targetname");
 cherry = getent("acticherry", "targetname");
 
	
        level.old_trig waittill( "trigger", player );
        if( !isDefined( level.old_trig ) )
            return;
	
	if(level.firstenter==true)
		{
		level.spray_trig delete();
		level.knife_trig delete();
		level.sword_trig delete();
		level.jump_trig delete();
		level.snipe_trig delete();
		level.dog_trig delete();
		level.firstenter=false;
		}
	level.old_trig delete();
	level.activ setPlayerangles( acti.angles );
	level.activ setOrigin( acti.origin );
	cherry notsolid();
	wait 1;
//AUTO 	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1Classic^7!" );
	object movez (-250,5);
	object waittill ("movedone");
	wait (0.2);
}

sniperoom()
{
 level.snipe_trig = getent( "snipe", "targetname");
 level.jsnipe = getEnt( "jsnipe1", "targetname" );
 level.jsnipe = getEnt( "jsnipe2", "targetname" );
 level.asnipe = getEnt( "asnipe1", "targetname" );
 level.asnipe = getent( "asnipe2", "targetname");
 expl = getEnt( "snipesion", "targetname" );
    
    
    

        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.spray_trig delete();
		level.knife_trig delete();
		level.sword_trig delete();
		level.jump_trig delete();
		level.old_trig delete();
		level.dog_trig delete();
		level.firstenter=false;
		}
		AmbientStop( 2 );
//AUTO 		AmbientPlay( "skyfall" );
//AUTO         iPrintlnBold( " ^5" + player.name + " ^3 picked ^1SHNIPAH WAR^7!" );
        player SetPlayerAngles( level.jsnipe.angles );
        player setOrigin( level.jsnipe.origin );
        level.activ setPlayerangles( level.asnipe.angles );
        level.activ setOrigin( level.asnipe.origin );
		player freezeControls(true);
	level.activ freezeControls(true);
//AUTO         player TakeAllWeapons();
//AUTO 	level.activ TakeAllWeapons();
//AUTO         player GiveWeapon( "cherry_bo_L96_mp" );
//AUTO 	player giveweapon( "deserteagle_mp");
	player SetWeaponAmmoClip( "deserteagle_mp", 0 );
	player SetWeaponAmmoStock( "deserteagle_mp", 0 );
//AUTO         level.activ GiveWeapon( "cherry_bo_L96_mp" );
//AUTO 	level.activ giveweapon( "deserteagle_mp");
	level.activ SetWeaponAmmoClip( "deserteagle_mp", 0 );
	level.activ SetWeaponAmmoStock( "deserteagle_mp", 0 );
//AUTO 	player switchToWeapon( "cherry_bo_L96_mp" );
//AUTO         level.activ SwitchToWeapon( "cherry_bo_L96_mp" );
//AUTO 	wait 5.7;
	playFx( level._spraysion[ "Sprode" ], expl.origin );
	player freezeControls(false);
	level.activ freezeControls(false);
	thread intimept();
        player thread onDeath_snipe();
//AUTO         wait 0.1;
       
    for(;;)
    {
//AUTO                 wait .1;               
                while(isAlive(player))
                {
//AUTO                         wait 1;
                }
               
    }
}

onDeath_snipe()
{
        self endon("disconnect");
       
        self waittill("death");
        thread sniperoom();
}

snipevator()
{
 brush = getent("snipevator", "targetname");
 
    for(;;)
    {
	brush movez (440,5);
	wait 6;
	brush movez (-440,5);
	wait 6;
    }
}

ammo()
{
 level.ammotrig = getent("ammo1", "targetname");
 level.ammotrig = getent("ammo2", "targetname");
	
	thread ammo2();

	while(1)
	    {
		level.ammotrig waittill( "trigger", player );
//AUTO 		player givemaxammo ( "cherry_bo_L96_mp" );
//AUTO 		player iprintlnbold ("^3AMMO REPLENISHED");
	    }    
}

ammo2()
{
 level.ammo = getent("ammo1", "targetname");
	while(1)
	    {
		level.ammo waittill( "trigger", player );
//AUTO 		player givemaxammo ( "cherry_bo_L96_mp" );
//AUTO 		player iprintlnbold ("^3AMMO REPLENISHED");
	    }    
}

snipehover()
{
 brusha = getent("sniphover1", "targetname");
 brushb = getent("sniphover2", "targetname");
 
     for(;;)
     {
	brusha movez (-50,1);
	brushb movez (50,1);
	wait 1;
	brushb movez (-50,1);
	brusha movez (50,1);
	wait 1;
    }
}

stahp()
{
 trig = getent("sb2trig", "targetname");
	
	trig waittill ( "trigger", who );
	wait 1;
//AUTO 	iprintlnbold ("A button was ^3pressed^7");
	thread huh();
}

huh()
{
 trig = getent("sb1trig", "targetname");
 brush = getent("sbttn2", "targetname");
	
	trig waittill ( "trigger", who );
	who playsound ( "bttn" );
	brush movey (-10,3);
	wait 3;
	thread magic();
//AUTO 	iprintlnbold ("^3Stahp pressing buttons! pff");
}

magic()
{
 brush = getent("yeh", "targetname");
	
	brush hide();
	brush notsolid();
	thread mhmmm();
}

mhmmm()
{
    trig = getent("mhmm", "targetname");

    for(;;)
    {
	trig waittill ("trigger", player);
		player detachAll();
//AUTO 		player iPrintLn("Model changing.....");
		player setModel("playermodel_terminator");
//AUTO 		player iPrintLn("You Are Now The Terminator Player Model!");
//AUTO 		player giveweapon( "cherry_bo_L96_mp" );
//AUTO 		player SwitchToWeapon( "cherry_bo_L96_mp" );
    }
}

wutru()
{
 trig = getent("sb2trig", "targetname");
 end = getent("stahp", "targetname");
 brush = getent("sbttn1", "targetname");

	for(;;)
	{
		trig waittill ( "trigger", player );
		player playsound ( "bttn" );
		brush movex (10,3);
//AUTO 		wait 3.5;
		player setplayerangles( end.angles, 3 );
		player setorigin( end.origin, 3 );
	}
}

doing()
{
 brush = getent("sele1", "targetname");
 end = getent("sele2", "targetname");
 bck = getent("sele3", "targetname");
 
	for(;;)
	{
		brush moveto ( end.origin, 2 );
		brush waittill ("movedone");
		brush moveto ( bck.origin, 1 );
		brush waittill ("movedone");
	}
}

sprayroom()
{

 level.spray_trig = getent( "spray", "targetname");
 level.jspray = getEnt( "jspray", "targetname" );
 level.aspray = getEnt( "aspray", "targetname" );
 expl = getEnt( "spraysion", "targetname" );
    
        level.spray_trig waittill( "trigger", player );
        if( !isDefined( level.spray_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		thread dynamic_wep_dmg();
		level.knife_trig delete();
		level.sword_trig delete();
		level.jump_trig delete();
		level.snipe_trig delete();
		level.old_trig delete();
		level.dog_trig delete();
		level.firstenter=false;
		}
	AmbientStop( 2 );
//AUTO 	AmbientPlay( "basscanon" );
//AUTO         iPrintlnBold( " ^5" + player.name + " ^3 picked ^1SPRAY WAR^7!" );
	player freezeControls(true);
	level.activ freezeControls(true);
        player SetPlayerAngles( level.jspray.angles );
        player setOrigin( level.jspray.origin );
        level.activ setPlayerangles( level.aspray.angles );
        level.activ setOrigin( level.aspray.origin );
	player detachAll();
	player setModel("playermodel_terminator");
//AUTO         player TakeAllWeapons();
	level.activ detachAll();
	level.activ setModel("playermodel_terminator");
//AUTO 	level.activ TakeAllWeapons();
//AUTO         player GiveWeapon( "cherry_minigun_mp" );
//AUTO         level.activ GiveWeapon( "cherry_minigun_mp" );
//AUTO 	player switchToWeapon( "cherry_minigun_mp" );
//AUTO         level.activ SwitchToWeapon( "cherry_minigun_mp" );
	player thread maxammo();
	player thread superpowers();
	level.activ thread maxammo();
	level.activ thread superpowers();
//AUTO 	wait 1.7;
	playFx( level._spraysion[ "Sprode" ], expl.origin );
	player freezeControls(false);
	level.activ freezeControls(false);
	thread basscannon();
        player thread onDeath_spray();
//AUTO         wait 0.1;
       
       
    for(;;)
    {
//AUTO                 wait .1;               
                while(isAlive(player))
                {
//AUTO                         wait 1;
                }
               
    }
}

onDeath_spray()
{
        self endon("disconnect");
       
        self waittill("death");
        thread sprayroom();
}

basscannon()
{
	wait 10;
//AUTO 	iPrintln( "^7Now Playing: ^3Flux Pavilion - Bass Cannon" );
}

maxammo() 
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
        while ( 1 ) 
        {
           wait 30;
//AUTO 	   self iprintlnbold ("^7Reloading for you sir.");
           self takeweapon ( "cherry_minigun_mp" );
	   wait 1;
//AUTO 	   self GiveWeapon( "cherry_minigun_mp" );
        } 
} 

superpowers()  //Originally Written by Wingzor (Thanks buddy :>)
{
//AUTO     self SetMoveSpeedScale( 6 );
    self jumpheight( 5 );
    self.maxhealth = 500;
    self.health = self.maxhealth;
}

jumpheight( strenght ) //Originally Written by Wingzor (Thanks buddy :>)
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	oldpos = self.origin;
	jumped = false;
	
	if( !isDefined( strenght ) || strenght < 1 )
		strenght = 1;
	
	while(1)
	{
		if((self.origin[2] - oldpos[2] ) > 10  && !self IsOnGround() && !jumped)
		{
			if(jumped)
				continue;
			for(i=0;i<strenght;i++)
			{
				self.health += 100;
				self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			jumped = true;
		}
		else if(oldpos[2] > self.origin[2] && self IsOnGround() && jumped)
			jumped = false;
		oldpos = self.origin;
		wait 0.1;
	}
}

spam()
{

	for(;;)
	{
	wait 20;
//AUTO 	iprintln ("^3>> ^7Map created by ^2Darmuh");
	wait 30;
//AUTO 	iprintln ("^3>> ^7xfire: ^2irRoy8");
	wait 30;
//AUTO 	iprintln ("^3>> ^7http://www.youtube.com/user/^2Darmuh");
	wait 30;
//AUTO 	iprintln ("^2<< ^7The Deathrun community is an ^3amazing^7, ^2expanding ^7community that I am ^2glad ^7to be a part of. -^3Darmuh");
	}
}

deagle()
{
 trig = getent("soda", "targetname");
 deagle = getent("deagle", "targetname");
 soda = getent("takedeagle", "targetname");
 
	deagle hide();
	soda hide();
	trig waittill ( "trigger", player );
	thread soda();
//AUTO 	iprintln ("^2 " + player.name + " ^7fixed the soda machine");
}

soda()
{
 deagle = getent("deagle", "targetname");
 soda = getent("takedeagle", "targetname");

	deagle show();
	soda show();
	
	for(;;)
	{
	    soda waittill ( "trigger", player );
		level.tempGuid = player getGUID();
		
		if( isDefined( level.trapsDisabled ) && level.trapsDisabled )
		{
//AUTO 		   iprintlnbold ("We're all out of soda. Sorry! -Management");
		   soda delete();
		}
		else
		{
			player thread notfree();
		}
	}
}

notfree()
{


		if( ( self.name == level.darmuh )  && ( level.tempGuid == level.dermuh ) )
		{
//AUTO 			self GiveWeapon("deserteaglegold_mp");
//AUTO 			self switchToWeapon( "deserteaglegold_mp" );
		}
		
		if( ( self.name == level.irRoy8 )  && ( level.tempGuid == level.dermuh ) )
		{
//AUTO 			self GiveWeapon("deserteaglegold_mp");
//AUTO 			self switchToWeapon( "deserteaglegold_mp" );
		}
		
		else
		{
//AUTO 			self iprintlnbold ("Enjoy the weapon!"); 
//AUTO 			self GiveWeapon("deserteagle_mp");
//AUTO 			self switchToWeapon( "deserteagle_mp" );
		}
}

iminyoserver()
{
players = getEntArray("player","classname");	
	for(d = 0; d < players.size; d++)
	{
		if( ( players[d].name == level.darmuh )  && ( level.tempGuid == level.dermuh ) )
		{
//AUTO 			iprintlnbold ("^2Darmuh's ^7in this mofuckin server!");
			players[d] detachAll();
			players[d] setModel("playermodel_terminator"); //You may say it's unfair that I make it so that I get to be terminator on my map. All I have to say is idgaf it's my map kthnxbai. And yeah I know I can expect plenty of fakers but tbh idc.
		}
		if( ( players[d].name == level.irRoy8 )  && ( level.tempGuid == level.dermuh ) )
		{
//AUTO 			iprintlnbold ("^2Darmuh's incognito ^7in this bitch!");
			players[d] detachAll();
			players[d] setModel("playermodel_terminator"); //You may say it's unfair that I make it so that I get to be terminator on my map. All I have to say is idgaf it's my map kthnxbai. And yeah I know I can expect plenty of fakers but tbh idc.
		}
	}
}

dogroom()
{
 level.dog_trig = getEnt( "dogs", "targetname");
 kjump = getEnt( "jumpk", "targetname" );
 kacti = getEnt( "actik", "targetname" );
 expl = getEnt( "meleesion", "targetname" );
	    
        level.dog_trig waittill( "trigger", player );
        if( !isDefined( level.dog_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.spray_trig delete();
		level.jump_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.sword_trig delete();
		level.firstenter=false;
		}
	AmbientStop( 2 );
//AUTO 	AmbientPlay( "luvkick" );
	player SetPlayerAngles( kjump.angles );
	player setOrigin( kjump.origin );
	player detachAll();
	player setModel("german_sheperd_dog");
//AUTO 	player TakeAllWeapons();
//AUTO 	player giveweapon( "dog_mp");  
	level.activ setPlayerangles( kacti.angles );
	level.activ setOrigin( kacti.origin );
	level.activ detachAll();
	level.activ setModel("german_sheperd_dog");
//AUTO 	level.activ TakeAllWeapons();
//AUTO 	level.activ giveweapon( "dog_mp");   
//AUTO 	player switchToWeapon( "dog_mp" );
//AUTO 	level.activ SwitchToWeapon( "dog_mp" );
	player freezeControls(true);
	level.activ freezeControls(true);
//AUTO 	wait 1.9;
	playFx( level._spraysion[ "Sprode" ], expl.origin );
	player freezeControls(false);
	level.activ freezeControls(false);
//AUTO 	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1DOG FIGHT^7!" );
//AUTO 	thread kickstarts();
        player thread onDeath_dog();
//AUTO         wait 0.1;
       
    for(;;)
    {
//AUTO                 wait .1;               
                while(isAlive(player))
                {
//AUTO                         wait 1;
                }
               
    }
}

onDeath_dog()
{
        self endon("disconnect");
       
        self waittill("death");
        thread dogroom();
}

yayufinished() //pretty much written by Luk from Luk-Servers
{
	trig = getent("endmap_trig", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		if(!isDefined(player.gotCherryXP))
		{
//AUTO 			player braxi\_rank::giveRankXP("", 15);
//AUTO 			player iprintlnbold ( "^7You got +15^3xp^7!!!" );
			player.gotCherryXP = true;
		}
	}
}

