main()
{
        maps\mp\_load::main();
	thread speedrun\_way_name::create_normal_way("Normal Way;");
	auto_spawn = getEntArray("mp_jumper_spawn", "classname");
	if(auto_spawn.size > 0)
		thread speedrun\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);
//AUTO         ambientPlay("water");
 
        PreCacheItem("frag_grenade_mp");
//AUTO         PreCacheItem("ak47_mp");
        PreCacheItem("g3_mp");
       
        thread trap1();
        thread trap2();
        thread trap3();
        thread trap4();
        thread trap5();
        thread trap6();
        thread trap7();
        thread trap8();
//AUTO         thread Sniper();
//AUTO         thread Knife();
        thread Nade();
        thread secret_enter();
        thread secret_end();
        thread amkimbo();
        thread nadesammo();
        thread nadesammo2();
        thread teleport();
        thread teleport2();
        thread teleport3();
//AUTO         thread old();
		thread speed();
        addTriggerToList("trap1_acti");
    addTriggerToList("trap2_acti");
    addTriggerToList("trap3_acti");
    addTriggerToList("trap4_acti");
    addTriggerToList("trap5_acti");
    addTriggerToList("trap6_acti");
    addTriggerToList("trap7_acti");
        addTriggerToList("trap8_acti");
//AUTO         level.rooms_cantenter = getEnt( "rooms_cantenter", "targetname");
//AUTO         level.rooms_cantenter hide();
//AUTO         level.rooms_cantenter notsolid();      
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
        act1 = getEnt ("trap1_acti", "targetname");
        rotate1 = getEnt ("trap1_trap" , "targetname");
        rotate2 = getEnt ("trap2_trap" , "targetname");
               
/* AUTO         act1 waittill ("trigger");
        act1 delete();
       
        while (1)
                {
                        rotate1 rotatepitch(360 , 3);
                        rotate2 rotatepitch (-360 , 3 );
                        wait 5;
                }
*/}

trap2()
{
        trig = getEnt("trap2_acti","targetname");
        brush1 = getEnt("trap2_ran1","targetname");
        brush2 = getEnt("trap2_ran2","targetname");
 
/* AUTO         trig waittill("trigger");
        trig delete();
        random = randomInt(2);
        switch(random)
        {
                case 0: brush1 delete();
                                break;
                               
                case 1: brush2 delete();
                                break;
                               
                default: return;
        }
*/}

trap3()
{
        act1 = getEnt ("trap3_acti", "targetname");
        rotate1 = getEnt ("trap3_trap", "targetname");
       
/* AUTO         act1 waittill ("trigger");
        act1 delete();
 
        while(1)
        {
                rotate1 rotateyaw (90, 1);
                wait 2;
                rotate1 rotateyaw (-90,1);
                wait 2;
        }
*/}

trap4()
{
        trig = getEnt ("trap4_acti" , "targetname");
        trap1 = getEnt ("trap4_trap1" , "targetname");
        trap2 = getEnt ("trap4_trap2" , "targetname");
        trap3 = getEnt ("trap4_trap3" , "targetname");
        trap4 = getEnt ("trap4_trap4" , "targetname");
       
/* AUTO         trig waittill ("trigger");
        trig delete();
       
        trap1 moveX (1168,0.4);
        wait 3;
        trap1 moveX (-1168,0.4);
       
        trap3 moveX (-1216,0.4);
        wait 3;
        trap3 moveX (1216,0.4);
       
        trap2 moveX (1168,0.4);
        wait 3;
        trap2 moveX (-1168,0.4);
       
        trap4 moveX (-1216,0.4);
        wait 3;
        trap4 moveX (1216,0.4);
*/}

trap5()
{
        act1 = getEnt ("trap5_acti", "targetname");
        rotate1 = getEnt ("trap5_trap1" , "targetname");
        rotate2 = getEnt ("trap5_trap2" , "targetname");
        rotate3 = getEnt ("trap5_trap3" , "targetname");
        rotate4 = getEnt ("trap5_trap4" , "targetname");
       
/* AUTO         act1 waittill ("trigger");
        act1 delete();
 
        while(1)
        {
                rotate1 rotateyaw (360, 4);
                wait 2;
                rotate2 rotateyaw (-360 , 4);
                wait 2;
                rotate3 rotateyaw (360 , 4);
                wait 2;
                rotate4 rotateyaw (-360 , 4);
        }
*/}

trap6()
{
                act1 = getEnt ("trap6_acti", "targetname");
                rotate1 = getEnt ("trap6_trap1" , "targetname");
                rotate2 = getEnt ("trap6_trap2" , "targetname");
                rotate3 = getEnt ("trap6_trap3" , "targetname");
                rotate4 = getEnt ("trap6_trap4" , "targetname");
                rotate5 = getEnt ("trap6_trap5" , "targetname");
               
/* AUTO                 act1 waittill ("trigger");
                act1 delete();
               
                while(1)
                {
                        rotate1 rotateyaw (360, 2);
                        wait 0.1;
                        rotate2 rotateyaw (-360, 2);
                        wait 0.1;
                        rotate3 rotateyaw (360 , 2);
                        wait 0.1;
                        rotate4 rotatepitch (360 , 4);
                        wait 0.1;
                        rotate5 rotatepitch (-360 , 4);
                        wait 0.1;
                }
*/}

trap7()
{
        act1 = getEnt ("trap7_acti", "targetname");
        rotate1 = getEnt ("trap7_trap1", "targetname");
        rotate2 = getEnt ("trap7_trap2", "targetname");
        rotate3 = getEnt ("trap7_trap3", "targetname");
       
/* AUTO         act1 waittill ("trigger");
        act1 delete();
       
        while (1)
                {
                        rotate1 rotateroll (360, 5);
                        wait 2;
                        rotate2 rotateroll (360, 5);
                        wait 2;
                        rotate3 rotateroll (360, 5);
                        wait 2;
                }
*/}

trap8()
{
        act1 = getEnt ("trap8_acti", "targetname");
        rotate1 = getEnt ("trap8_trap", "targetname");
       
/* AUTO         act1 waittill ("trigger");
        act1 delete();
 
        while(1)
        {
                rotate1 rotateyaw (360, 3);
                wait 1;
        }
*/}

Sniper()
{
        level.snip_trig = getEnt( "sniper_trig", "targetname");
        jump = getEnt( "sniper_orig", "targetname" );
        acti = getEnt( "sniper_acti", "targetname" );
     
        while(1)
        {
                level.snip_trig waittill( "trigger", player );
                if( !isDefined( level.snip_trig ) )
                return;
 
                level.rooms_cantenter show();
                level.rooms_cantenter solid();
                level.rooms_cantenter movey(45,0.4);
 
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "m40a3_mp" );
//AUTO                 player givemaxammo( "m40a3_mp" );
//AUTO                 player GiveWeapon( "remington700_mp" );
//AUTO                 player givemaxammo( "remington700_mp" );      
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "m40a3_mp" );
//AUTO                 level.activ givemaxammo( "m40a3_mp" );
//AUTO                 level.activ GiveWeapon( "remington700_mp" );
//AUTO                 level.activ givemaxammo( "remington700_mp" );
//AUTO                 iPrintlnBold( " " + player.name + " ^4 has entered Sniper room!" );  
//AUTO                 wait 0.05;
//AUTO                 player switchToWeapon( "m40a3_mp" );
//AUTO                 level.activ SwitchToWeapon( "m40a3_mp" );
                player freezecontrols(true);
                level.activ freezecontrols(true);
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^53" );
//AUTO                 level.activ iPrintlnBold( "^53" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^52" );
//AUTO                 level.activ iPrintlnBold( "^52" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^51" );
//AUTO                 level.activ iPrintlnBold( "^51" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^5Fight^1!" );
//AUTO                 level.activ iPrintlnBold( "^5Fight^1!" );
                player freezecontrols(false);
                level.activ freezecontrols(false);
                player died();        
        }
}

amkimbo()
{
        trig = getEnt ("lossy_secret", "targetname");
        target1 = getEnt ("secret_2", "targetname");
       
        trig waittill ("trigger", user);
        trig delete();
       
        {
                user SetOrigin(target1.origin);
                user SetPlayerAngles( target1.angles );
//AUTO                 user giveweapon( "g3_mp" );
//AUTO                 user givemaxammo( "g3_mp" );
                wait .1;
//AUTO                 user switchtoweapon( "g3_mp" );
//AUTO                 user braxi\_rank::giveRankXP("", 100);
                wait .1
                thread text();
               
        }
}

text()
{
        {
                noti = SpawnStruct();
                noti.titleText = "^1Lossy was here ^0:O";
                noti.notifyText = "^5Here a gun and 100 xp^1! ^5To who ever found this ^0:o";
                noti.duration = 10;
                noti.glowcolor = (1,0,0);
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                }      
}

Knife()
{
        level.knife_trig = getEnt( "knife_trig", "targetname");
        jump = getEnt( "knife_orig", "targetname" );
        acti = getEnt( "knife_acti", "targetname" );
     
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                return;
 
                level.rooms_cantenter show();
                level.rooms_cantenter solid();
                level.rooms_cantenter movey(45,0.4);
 
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
//AUTO                 player TakeAllWeapons();
//AUTO                 player GiveWeapon( "tomahawk_mp" );      
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ TakeAllWeapons();
//AUTO                 level.activ GiveWeapon( "tomahawk_mp" );
//AUTO                 iPrintlnBold( " ^2" + player.name + " ^5 has entered the Knife room^1!" );      
//AUTO                 wait 0.05;
//AUTO                 player switchToWeapon( "tomahawk_mp" );
//AUTO                 level.activ SwitchToWeapon( "tomahawk_mp" );
                player freezecontrols(true);
                level.activ freezecontrols(true);
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^53" );
//AUTO                 level.activ iPrintlnBold( "^53" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^52" );
//AUTO                 level.activ iPrintlnBold( "^52" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^51" );
//AUTO                 level.activ iPrintlnBold( "^51" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^5Fight^1!" );
//AUTO                 level.activ iPrintlnBold( "^5Fight^1!" );
                player freezecontrols(false);
                level.activ freezecontrols(false);
                player died();
                     
        }
}

Nade()
{
        level.nade_trig = getEnt( "nade_trig", "targetname");
        jump = getEnt( "nade_orig", "targetname" );
        acti = getEnt( "nade_acti", "targetname" );
     
        while(1)
        {
                level.nade_trig waittill( "trigger", player );
                if( !isDefined( level.nade_trig ) )
                return;
 
                level.rooms_cantenter show();
                level.rooms_cantenter solid();
                level.rooms_cantenter movey(45,0.4);
 
                player SetPlayerAngles( jump.angles );
//AUTO                 player takeallweapons();
//AUTO                 player giveweapon("frag_grenade_mp");
//AUTO                 player givemaxammo("frag_grenade_mp");
                player setOrigin( jump.origin );  
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
//AUTO                 level.activ takeallweapons();
//AUTO                 level.activ giveweapon("frag_grenade_mp");
//AUTO                 level.activ givemaxammo("frag_grenade_mp");
//AUTO                 iPrintlnBold( " ^2" + player.name + " ^5 has entered the Nade room^1!" );
//AUTO                 wait 0.05;
//AUTO                 player switchtoweapon("frag_grenade_mp");
//AUTO                 level.activ switchtoweapon("frag_grenade_mp");
                player freezecontrols(true);
                level.activ freezecontrols(true);
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^53" );
//AUTO                 level.activ iPrintlnBold( "^53" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^52" );
//AUTO                 level.activ iPrintlnBold( "^52" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^51" );
//AUTO                 level.activ iPrintlnBold( "^51" );
//AUTO                 wait 1;
//AUTO                 player iPrintlnBold( "^5Bounce^1!" );
//AUTO                 level.activ iPrintlnBold( "^5Fight^1!" );
                player freezecontrols(false);
                level.activ freezecontrols(false);
                player died();      
        }
}

nadesammo()
{
        trig = getEnt("nadeammo","targetname");
 
        while(1)
    {
        trig waittill ("trigger", who);
//AUTO         who GiveMaxAmmo( "frag_grenade_mp" );              
        }
}

nadesammo2()
{
        trig = getEnt("nadeammo2","targetname");
 
        while(1)
    {
        trig waittill ("trigger", who);
//AUTO         who GiveMaxAmmo( "frag_grenade_mp" );              
        }
}

died()
{
        self endon("disconnect");
 
        self waittill("death");
//AUTO         iPrintlnBold("^2"+self.name+" ^5died^1!");
        level.rooms_cantenter hide();
        level.rooms_cantenter notsolid();
        level.rooms_cantenter movey(-45,0.4);
}

secret_enter()
{
        level.secret_trig = getEnt ("secret_enter", "targetname");
        target1 = getEnt ("secret_startori", "targetname");
       
        for(;;)
        {
                level.secret_trig waittill ("trigger", user);
                user SetOrigin(target1.origin);
                user SetPlayerAngles( target1.angles );
//AUTO                 user iprintlnbold ("You Found My Secret D:<");
        }
}

secret_end()
{
        trig = getEnt ("secret_endtrig", "targetname");
        target1 = getEnt ("secret_end", "targetname");
       
        for(;;)
        {
                trig waittill ("trigger", user);
                user SetOrigin(target1.origin);
                user SetPlayerAngles( target1.angles );
//AUTO                 user iprintlnbold ("You Finished My Secret D:<");
//AUTO                 user giveweapon( "ak47_mp" );
//AUTO                 user givemaxammo( "ak47_mp" );
//AUTO                 wait .1;
//AUTO                 user switchtoweapon( "ak47_mp" );
//AUTO                 user braxi\_rank::giveRankXP("", 100);
        }
}

teleport()
{
        trig = getEnt ("teleport", "targetname");
        target = getEnt ("teleport1_org", "targetname");
       
        for(;;)
        {
                trig waittill ("trigger", player);
               
                player FreezeControls (1);
//AUTO                 wait 0.1;
                player FreezeControls (0);
                player SetPlayerAngles( target.angles );
                player SetOrigin(target.origin);
        }
}

teleport2()
{
        trig = getEnt ("teleport2", "targetname");
        target = getEnt ("teleport2_org", "targetname");
       
        for(;;)
        {
                trig waittill ("trigger", player);
               
                player FreezeControls (1);
//AUTO                 wait 0.1;
                player FreezeControls (0);
                player SetPlayerAngles( target.angles );
                player SetOrigin(target.origin);
        }
}

teleport3()
{
        trig = getEnt ("teleport3", "targetname");
        target = getEnt ("teleport3_org", "targetname");
       
        for(;;)
        {
                trig waittill ("trigger", player);
               
                player FreezeControls (1);
//AUTO                 wait 0.1;
                player FreezeControls (0);
                player SetPlayerAngles( target.angles );
                player SetOrigin(target.origin);
        }
}

old()
{
        old_trig = getEnt ("map_finish", "targetname");//trigger
        door = getEnt ("finish_door", "targetname");//door
       
        old_trig waittill ("trigger", player);
        knife_trigger = getEnt ("knife_trig", "targetname");//minigame
        sniper_trigger = getEnt( "sniper_trig", "targetname" );//minigame
        nade_trigger = getEnt ("nade_trig", "targetname");//minigame
       
        old_trig delete();
        door delete();
        knife_trigger delete();
		sniper_trigger delete();
        nade_trigger delete();
       
//AUTO         iprintlnbold (player.name + " ^2Opened the old way!");
}

speed()
{
   trigger = getent("speed","targetname");  
   while(1)
   {
      trigger waittill ("trigger",player);
      i=12;
     
      while(i > 8 && player isOnGround())
      {
//AUTO          player SetMoveSpeedScale(i);
         wait(.05);
      }
 
//AUTO       player SetMoveSpeedScale(1);
      wait(2);
   }
}

