main()
{
	self setModel("body_sp_usmc_ryan");
	self attach("head_sp_usmc_ryan_ryan_body", "", true);
	self.voice = "american";
}

precache()
{
	precacheModel("body_sp_usmc_ryan");
	precacheModel("head_sp_usmc_ryan_ryan_body");
}

