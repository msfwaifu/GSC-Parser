main()
{
	for(i=1;i < 37; i++) {
		thread padr(i);
	}
}


padr(index) {
	ent = getEnt("padr_" + index, "targetname");
	origin = ent.origin;
	
	while(true) {
		//hore
		z = RandomIntRange(10,200);
	
		ent movez(z, z/100, z/500,z/500); // posun hore
		wait(RandomIntRange(1,5) + (z/100) + (z/250));
		
		ent movez((0-z), z/100,z/500,z/500); // zarovnanie na nulu
		
		//central
		wait (0.5 + (z/100) + (z/250));
		
		//dole
		z = RandomIntRange(10,200);
		
		ent movez((0-z), z/100,z/500,z/500); // posun dole
		wait(RandomIntRange(1,5) + (z/100) + (z/250));
		
		ent movez(z, z/100,z/500,z/500); // zarovnanie na nulu
		wait(RandomIntRange(1,5) + (z/100) + (z/250));
		
		// zarovnanie
		ent.origin = origin;
		
	}
}

