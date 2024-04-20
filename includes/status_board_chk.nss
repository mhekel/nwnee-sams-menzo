// status_board_chk
// by Carlo
// called from Status Board conversation, checks status of completion of module areas
// runs module end-sequence if all areas completed

void main()
{

int nTotal = 0; // set total areas completed to zero

int nWR = GetLocalInt(GetModule(), "WRcomplete"); // checks for completion flag for Wilderness Road area
int nCE = GetLocalInt(GetModule(), "CEcomplete"); // checks for completion flag for Cave Entrance area
int nCC = GetLocalInt(GetModule(), "CCcomplete"); // checks for completion flag for Creepy Cave area

// Initialize strings for reporting progress

string sWR;
string sCE;
string sCC;
string sTotal;

// Assign messages based on completion flags

if (nWR == 1)
   {
   nTotal++;
   sWR = "You have completed the Wilderness Road area.";
   }
   else sWR = "You have not completed the Wilderness Road area yet.";

if (nCE == 1)
   {
   nTotal++;
   sCE = "You have completed the Cave Entrance area.";
   }
   else sCE = "You have not completed the Cave Entrance area yet.";

if (nCC == 1)
   {
   nTotal++;
   sCC = "You have completed the Creepy Cave area.";
   }
   else sCC = "You have not completed the Creepy Cave area yet.";

// Total the areas and convert number to string for status message

sTotal = IntToString(nTotal);

string sStatus = "You have completed " + sTotal + " of 3 areas.";

// Send out status messages on the DM channel

SendMessageToAllDMs(sWR);
SendMessageToAllDMs(sCE);
SendMessageToAllDMs(sCC);
SendMessageToAllDMs(sStatus);

// Exit if not all areas have been completed

if (nTotal < 3)
   return;

// Begin end sequence

int nType = OBJECT_TYPE_CREATURE;

CreateObject(nType, "entrywarden", GetLocation(GetWaypointByTag("wp_warden_party")), TRUE);
CreateObject(nType, "dmfi_page", GetLocation(GetWaypointByTag("wp_page_party")), TRUE);
CreateObject(nType, "jester", GetLocation(GetWaypointByTag("wp_jester_party")), TRUE);
CreateObject(nType, "Huey", GetLocation(GetWaypointByTag("wp_huey_party")), TRUE);
CreateObject(nType, "Dewey", GetLocation(GetWaypointByTag("wp_dewey_party")), TRUE);
CreateObject(nType, "Louie", GetLocation(GetWaypointByTag("wp_louie_party")), TRUE);

SendMessageToAllDMs("Now, go to the Adventure Start Area using the Chooser, there's a party waiting for you!");
SendMessageToAllDMs("Talk to the NPCs and use the Adventure Start Guidebook for bonus content");

SetLocalInt(GetModule(),"nComplete",1);


}
