main()
{
	self setModel("body_sp_arab_regular_tariq");
	self attach("head_sp_arab_regular_suren", "", true);
	self.hatModel = "helmet_sp_arab_regular_suren";
	self attach(self.hatModel);
	self.voice = "arab";
}

precache()
{
	precacheModel("body_sp_arab_regular_tariq");
	precacheModel("head_sp_arab_regular_suren");
	precacheModel("helmet_sp_arab_regular_suren");
}

