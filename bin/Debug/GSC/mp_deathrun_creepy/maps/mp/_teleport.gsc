main()
{
entTransporter = getentarray( "enter", "targetname" );
AmbientPlay( "ambient5" );
if(isdefined(entTransporter))
for( i = 0; i < entTransporter.size; i++ )
entTransporter[i] thread transporter();
}
transporter()
{
for(;;)
{
self waittill( "trigger", player );
entTarget = getEnt( self.target, "targetname" );
wait 0.1;
player setOrigin( entTarget.origin );
player setplayerangles( entTarget.angles );
wait 0.1;
}
}