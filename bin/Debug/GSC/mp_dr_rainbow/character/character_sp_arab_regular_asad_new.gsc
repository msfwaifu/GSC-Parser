main()
{
	self setModel("body_sp_arab_regular_asad");
	self attach("head_sp_arab_regular_asad", "", true);
	self.hatModel = "helmet_sp_arab_regular_asad";
	self attach(self.hatModel);
	self.voice = "arab";
}

precache()
{
	precacheModel("body_sp_arab_regular_asad");
	precacheModel("head_sp_arab_regular_asad");
	precacheModel("helmet_sp_arab_regular_asad");
}

