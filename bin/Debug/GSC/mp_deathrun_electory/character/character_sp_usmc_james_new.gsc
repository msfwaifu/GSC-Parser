main()
{
	self setModel("body_sp_usmc_james");
	self attach("head_sp_usmc_james_james_body", "", true);
	self.voice = "american";
}

precache()
{
	precacheModel("body_sp_usmc_james");
	precacheModel("head_sp_usmc_james_james_body");
}

