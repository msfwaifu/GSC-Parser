main()
{
thread rotateCylinder1();
}

rotateCylinder1()
{
	rotate = getent( "trap7x" , "targetname" );
	rotate_trig = getent( "trap7" , "targetname" );

	rotate_trig waittill ("trigger");
	rotate_trig delete();

	maps\mp\mp_deathrun_easy\coins::AddCoin( 7, level.coinPrice );
	
	while (true) {
		if ( randomInt(99)%2 == 0 )
			rotate RotateYaw(  360, 2*level.mapmode, 0.5*level.mapmode, 0.5*level.mapmode );
		else
			rotate RotateYaw( -360, 2*level.mapmode, 0.5*level.mapmode, 0.5*level.mapmode );
		wait RandomFloatRange( 5*level.mapmode, 10*level.mapmode );
	}
}

