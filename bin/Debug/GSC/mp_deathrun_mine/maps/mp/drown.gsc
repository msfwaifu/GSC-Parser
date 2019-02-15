main()
{

	drown_waterage = getentarray("drown_water","targetname");
	if (isDefined("drown_waterage"))
	{
		precacheShader("black");
		precacheShader("white");



		level.barsize = 288;
		level.drown_watertime = 3;
		level.hurttime = 2;

		for(d = 0; d < drown_waterage.size; d++)
		{
			drown_waterage[d] thread water();
		}
	}
}

Water()
{
while (1)
	{
	self waittill("trigger", other);

	if(isPlayer(other) && other istouching(self))
		other thread drown_water(self);
	}
}	
drown_water(trigger)
{
	dceiling = getent(trigger.target,"targetname");
	water_vision = undefined;
	while (self istouching(trigger) && !self istouching(dceiling))
	{
		wait .125;
		if(isDefined(self.drown_watering))
			return;		
		self.drown_watering = true;

	if(!isDefined(water_vision))
	{
		water_vision = newClientHudElem(self);
		water_vision.x = 0;
		water_vision.y = 0;
		water_vision setshader ("white", 640, 480);
		water_vision.alignX = "left";
		water_vision.alignY = "top";
		water_vision.horzAlign = "fullscreen";
		water_vision.vertAlign = "fullscreen";
		water_vision.color = (.16, .38, .5);
		water_vision.alpha = .75;
	}


	level.barincrement = (level.barsize / (20.0 * level.drown_watertime));
//	level.player allowProne(false);
	if(!isDefined(self.progressbackground))
	{
		self.progressbackground = newClientHudElem(self);				
		self.progressbackground.alignX = "center";
		self.progressbackground.alignY = "middle";
		self.progressbackground.x = 320;
		self.progressbackground.y = 385;
		self.progressbackground.alpha = 0.5;
	}
	self.progressbackground setShader("black", (level.barsize + 4), 14);		

	if(!isDefined(self.progressbar))
	{
		self.progressbar = newClientHudElem(self);				
		self.progressbar.alignX = "left";
		self.progressbar.alignY = "middle";
		self.progressbar.x = (320 - (level.barsize / 2.0));
		self.progressbar.y = 385;
	}
	self.progressbar setShader("white", 0, 8);			
	self.progressbar scaleOverTime(level.drown_watertime, level.barsize, 8);

	self.progresstime = 0;
	d = 0;
	f = 0;

	while(isalive(self) && self istouching(trigger) && !self istouching(dceiling) && (self.progresstime < level.drown_watertime))
	{		
		d ++;
		f ++;
		
		wait 0.05;
		self.progresstime += 0.05;


		if(self.progresstime >= level.hurttime)					
			{
			if(f >= 4)
				{
				radiusDamage(self.origin,9, 1, 1);
				f = 0;
				}
			}
	}

	if(isalive(self) && self istouching(trigger) && !self istouching(dceiling) && (self.progresstime >= level.drown_watertime))
	{

		self.progressbackground destroy();
		self.progressbar destroy();

		wait 0.025;
		radiusDamage(self.origin,22, 3000, 3000);

		self.drown_watering = undefined;
		self.sounder = undefined;



		randb = randomInt(2);
		deathmethod1 = " Drowned";	
		deathmethod2 = " That's water, It Kills.";
		deathmethod3 = " Swallowed Some Water";
		deathmethod4 = " That's water, It Kills.";
		
		if (randb == 0)
		iPrintLn( self.name, deathmethod1);
		if (randb == 1)
		iPrintLn( self.name, deathmethod2);
		if (randb == 2)
		iPrintLn( self.name, deathmethod3);
		if (randb == 3)
		iPrintLn( self.name, deathmethod4);
		wait .05;
		water_vision destroy();
	}
	else
	{
		water_vision.alpha = .5;
		water_vision fadeOverTime(3);
		water_vision.alpha = 0;
		wait 0.05;
		self.progressbackground destroy();
		self.progressbar destroy();
		self.drown_watering = undefined;
		self.sounder = undefined;
	}			
	wait .05;
	}
}
