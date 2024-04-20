void main()
{
  object oDoor1 = GetObjectByTag ("FencePuzzleGate1");
  object oDoor2 = GetObjectByTag ("FencePuzzleGate2");
  object oDoor3 = GetObjectByTag ("FencePuzzleGate3");
  object oDoor4 = GetObjectByTag ("FencePuzzleGate4");
  object oLever1 = GetObjectByTag ("FloorLever1");
  object oLever2 = GetObjectByTag ("FloorLever2");
  object oLever3 = GetObjectByTag ("FloorLever3");
  object oLever4 = GetObjectByTag ("FloorLever4");
  object oLever5 = GetObjectByTag ("FloorLever5");
  int Lever1;
  int Lever2;
  int Lever3;
  int Lever4;
  int Lever5;
  if ( GetLocalInt( OBJECT_SELF, "m_bActivated" ) != TRUE )
  {
    //Activate the Lever and Mark the Lever as Activated.
    SetLocalInt( OBJECT_SELF, "m_bActivated", TRUE );
    PlayAnimation( ANIMATION_PLACEABLE_ACTIVATE );
  }
  else
  {
   //Deactivate the Lever and Mark the Lever as Deactivated.
    SetLocalInt( OBJECT_SELF, "m_bActivated", FALSE );
    PlayAnimation( ANIMATION_PLACEABLE_DEACTIVATE );
  }
// Get the status of the other levers.
  Lever1 = GetLocalInt (oLever1,"m_bActivated");
  Lever2 = GetLocalInt (oLever2,"m_bActivated");
  Lever3 = GetLocalInt (oLever3,"m_bActivated");
  Lever4 = GetLocalInt (oLever4,"m_bActivated");
  Lever5 = GetLocalInt (oLever5,"m_bActivated");
// This sets the lever pattern needed to insure all 4 doors are open at once.
// True = Lever Activated. False = Lever Deactivated.
  if (Lever1 == TRUE && Lever2 == FALSE && Lever3 == FALSE && Lever4 == TRUE && Lever5 == FALSE)
  {
   SetLocked(oDoor1, FALSE);
   ActionOpenDoor(oDoor1);
   SetLocked(oDoor2, FALSE);
   ActionOpenDoor(oDoor2);
   SetLocked(oDoor3, FALSE);
   ActionOpenDoor(oDoor3);
   SetLocked(oDoor4, FALSE);
   ActionOpenDoor(oDoor4);
  }
// The rest of the script just puts the doors in different positions insuring that
// at no single point in time are all 4 doors open. It currently operates on the pattern
// of Door1 open, then Door2 open, then Door3 open, then Door4 Open. This probably should be
// accomplished with a random number generator and then a simple check to make sure at
// least one door is closed. But this will work for now.
  else
  {
    if (GetIsOpen(oDoor1))
    {
     ActionCloseDoor(oDoor1);
     SetLocked(oDoor1, TRUE);
     SetLocked(oDoor2, FALSE);
     ActionOpenDoor(oDoor2);
     SetLocked(oDoor3, FALSE);
     ActionOpenDoor(oDoor3);
     ActionCloseDoor(oDoor4);
     SetLocked(oDoor4, TRUE);
    }
    else if (GetIsOpen(oDoor2))
    {
     ActionCloseDoor(oDoor1);
     SetLocked(oDoor1, TRUE);
     ActionCloseDoor(oDoor2);
     SetLocked(oDoor2, TRUE);
     SetLocked(oDoor3, FALSE);
     ActionOpenDoor(oDoor3);
     SetLocked(oDoor4, FALSE);
     ActionOpenDoor(oDoor4);
    }
    else if (GetIsOpen(oDoor3))
    {
     ActionCloseDoor(oDoor1);
     SetLocked(oDoor1, TRUE);
     ActionCloseDoor(oDoor2);
     SetLocked(oDoor2, TRUE);
     ActionCloseDoor(oDoor3);
     SetLocked(oDoor3, TRUE);
     SetLocked(oDoor4, FALSE);
     ActionOpenDoor(oDoor4);
    }
    else if (GetIsOpen(oDoor4))
    {
     SetLocked(oDoor1, FALSE);
     ActionOpenDoor(oDoor1);
     ActionCloseDoor(oDoor2);
     SetLocked(oDoor2, TRUE);
     SetLocked(oDoor3, FALSE);
     ActionOpenDoor(oDoor3);
     ActionCloseDoor(oDoor4);
     SetLocked(oDoor4, TRUE);
    }
    else
    {
     SetLocked(oDoor1, FALSE);
     ActionOpenDoor(oDoor1);
     SetLocked(oDoor2, FALSE);
     ActionOpenDoor(oDoor2);
     ActionCloseDoor(oDoor3);
     SetLocked(oDoor3, TRUE);
     ActionCloseDoor(oDoor4);
     SetLocked(oDoor4, TRUE);
    }
  }
} //end Main
