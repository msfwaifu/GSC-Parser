main()
{
  rotate_obj = getentarray("rotate2","targetname");
  if(isdefined(rotate_obj))
  {
   for(i=0;i<rotate_obj.size;i++)
   {
    rotate_obj[i] thread ra_rotate();
   }
  }
}

ra_rotate()
{
  if (!isdefined(self.speed))
   self.speed = 20;
  if (!isdefined(self.script_noteworthy))
   self.script_noteworthy = "z";
 
  while(true)
  {
  // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
   if (self.script_noteworthy == "z")
    self rotateYaw(360,self.speed);
   else if (self.script_noteworthy == "x")
    self rotateRoll(360,self.speed);
   else if (self.script_noteworthy == "y")
    self rotatePitch(360,self.speed);
    wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
  // self waittill("rotatedone");
  }
}

