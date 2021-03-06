main()
{
	trig = getent( "trap16", "targetname" );
	brush = getent( "trap16x", "targetname" );
	
	start = brush.origin;
	end = ( start[0], start[1]-550, start[2] );
	speed = 100;
	maxspeed = 800;
	minspeed = 100;
	
	brush thread NormalMoving( start, end, speed );
	trig thread WaittillActive( brush, start, end, maxspeed, minspeed );
}

NormalMoving(start, end, speed)
{
	self endon( "active" );

	while(1)
	{
		time = distance(start, end)/(speed/level.mapmode);
	
		if( self.origin == start )
			self moveto( end, time );
		else
			self moveto( start, time );
			
		self waittill( "movedone" );
	}
}

WaittillActive( brush, start, end, maxspeed, minspeed )
{
	self waittill( "trigger" );
	self delete();
	
	maps\mp\mp_deathrun_easy\coins::AddCoin( 16, level.coinPrice );
	
	brush notify( "active" );
	
	while(1)
	{
		speed = RandomIntRange( int(minspeed/level.mapmode), int(maxspeed/level.mapmode) );
	
		if( brush.origin == start )
			brush moveto( end, distance( start, end )/speed );
		else if( brush.origin == end )
			brush moveto( start, distance( start, end )/speed );
		else if( randomint(2) )
			brush moveto( start, distance( brush.origin, start )/speed );
		else
			brush moveto( end, distance( brush.origin, end )/speed );
			
		brush waittill( "movedone" );
	}
}

