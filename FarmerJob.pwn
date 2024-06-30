#include <a_samp>
#include <zcmd>
#include <sscanf2>

#define SCM SendClientMessage
#define SCMA SendClientMessageToAll

#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_GREY 	0xAFAFAFAA
#define COLOR_PURPLE 		0xC2A2DAAA
#define CHECKPOINT_NONE 0

new FarmerVehicles[19];
new gPlayerCheckpointStatus[MAX_PLAYERS];
new Harvesting[MAX_PLAYERS];
new Sharing[MAX_PLAYERS];

public OnFilterScriptInit()
{
	FarmerVehicles[0] = AddStaticVehicle(532,-322.2967,-1350.3434,10.5241,270.7830,0,0); // pos 1
    FarmerVehicles[1] = AddStaticVehicle(532,-322.6843,-1340.8116,10.3685,272.3377,0,0); // pos 2
    FarmerVehicles[2] = AddStaticVehicle(532,-323.0977,-1331.4840,10.4024,271.4319,0,0); // pos 3
    FarmerVehicles[3] = AddStaticVehicle(532,-323.1684,-1322.5546,10.4159,270.6801,0,0); // pos 4
    FarmerVehicles[4] = AddStaticVehicle(532,-322.1127,-1358.8835,10.8958,269.5284,0,0); // pos 5
    FarmerVehicles[5] = AddStaticVehicle(478,-368.9034,-1360.9902,21.7564,93.9769,1,1); // car1
    FarmerVehicles[6] = AddStaticVehicle(478,-369.6640,-1364.9237,21.9200,82.5297,1,1); // car2
    FarmerVehicles[7] = AddStaticVehicle(478,-370.0378,-1368.0313,22.0123,79.5341,1,1); // car3
    FarmerVehicles[8] = AddStaticVehicle(478,-370.0262,-1371.3488,22.0194,84.8406,1,1); // 4
    FarmerVehicles[9] = AddStaticVehicle(478,-368.7458,-1359.5483,21.7232,86.1116,1,1); // car5
	print("\n----------------------------");
	print(" Farmer Job FS Made by Virusa1");
	print("----------------------------\n");
	return 1;
}


public OnFilterScriptExit()
{
	return 1;
}

enum pInfo
{
	pJob
}
new PlayerInfo[MAX_PLAYERS][pInfo];


public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

IsAFarverCar(carid)
{
	for(new v = 0; v < sizeof(FarmerVehicles); v++)
	{
	    if(carid == FarmerVehicles[v]) return 1;
	}
	return 0;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(Harvesting[playerid])
	{
		DisablePlayerCheckpoint(playerid);
		Harvesting[playerid] = 0;
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		GameTextForPlayer(playerid, "~r~Mission Failed", 1000, 0);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]: You left your vehicle so you failed the harvesting.");
	}
	if(Sharing[playerid])
	{
		DisablePlayerCheckpoint(playerid);
		Sharing[playerid] = 0;
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		GameTextForPlayer(playerid, "~r~Mission Failed", 1000, 0);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:  You left your vehicle so you failed the sharing.");
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 10, -309.0990,-1381.1797,10.7049))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 23 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -286.6838,-1366.6523,9.2448, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -286.6838,-1366.6523,9.2448))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 22 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -299.1016,-1345.1233,7.8737, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -299.1016,-1345.1233,7.8737))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 21 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -285.5391,-1314.0519,9.4996, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -285.5391,-1314.0519,9.4996))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 20 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -263.7585,-1322.7645,9.2727, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -263.7585,-1322.7645,9.2727))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 19 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -247.7353,-1312.8854,10.7708, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -247.7353,-1312.8854,10.7708))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 18 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -230.6390,-1326.7452,10.5278, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -230.6390,-1326.7452,10.5278))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 17 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -208.9200,-1312.6355,8.0123, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -208.9200,-1312.6355,8.0123))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 16 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -184.9501,-1314.5737,6.7411, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -184.9501,-1314.5737,6.7411))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 15 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -165.0671,-1340.6115,3.1610, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -165.0671,-1340.6115,3.1610))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 14 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -182.6981,-1357.5033,4.1997, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -182.6981,-1357.5033,4.1997))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 13 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -166.5868,-1381.2855,3.2646, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -166.5868,-1381.2855,3.2646))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 12 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -169.7452,-1395.7577,3.3153, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -169.7452,-1395.7577,3.3153))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 11 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -162.0952,-1412.2350,3.0394, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -162.0952,-1412.2350,3.0394))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 10 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -192.4460,-1407.2355,3.9017, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -192.4460,-1407.2355,3.9017))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 9 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -207.5008,-1421.8888,3.2155, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -207.5008,-1421.8888,3.2155))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 8 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -226.2545,-1411.9092,6.5599, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -226.2545,-1411.9092,6.5599))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 7 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -247.6317,-1427.6404,6.6805, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -247.6317,-1427.6404,6.6805))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 6 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -263.1941,-1420.1913,9.3854, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -263.1941,-1420.1913,9.3854))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 5 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -284.1987,-1431.4486,12.0138, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -284.1987,-1431.4486,12.0138))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 4 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -300.6557,-1424.9337,14.0705, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -300.6557,-1424.9337,14.0705))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 3 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -320.6297,-1431.7501,15.1514, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -320.6297,-1431.7501,15.1514))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 2 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -330.9842,-1410.7192,14.1269, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -330.9842,-1410.7192,14.1269))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 1 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -343.0883,-1369.3920,14.4816, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -343.0883,-1369.3920,14.4816))
 	{
 	    new vehicleid = GetPlayerVehicleID(playerid);
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done Farmer! You finished the harvesting. Here is your reward.");
		SendClientMessage(playerid, COLOR_PURPLE,"[Farmer Job]:You gained 300$ from harvesting.");
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		SetVehicleToRespawn(vehicleid);
		Harvesting[playerid] =0;
  		GivePlayerMoney(playerid, 300);// you can change they money.
	}
	//===FSHARE===//
	if(IsPlayerInRangeOfPoint(playerid, 10, -335.1576,-1030.4205,59.1934))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 4 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -1111.2207,-1619.7231,76.3672, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -1111.2207,-1619.7231,76.367))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 3 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -414.3708,-1754.7161,6.4640, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -414.3708,-1754.7161,6.4640))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 2 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -579.6287,-1468.8931,10.5009, 10);
	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -579.6287,-1468.8931,10.5009))
 	{
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done! You got 1 More checkpoints to go.");
		SetPlayerCheckpoint(playerid, -382.5363,-1426.1783,26.2084, 10);

	}
	if(IsPlayerInRangeOfPoint(playerid, 10, -382.5363,-1426.1783,26.2084))
 	{
 	    new vehicleid = GetPlayerVehicleID(playerid);
 		DisablePlayerCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_GREY, "[Farmer Job]:Well done farmer! Here is your reward. You deserve it.");
		SendClientMessage(playerid, COLOR_PURPLE,"[Farmer Job]:You gained 2000$ from farm sharing.");
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		SetVehicleToRespawn(vehicleid);
		GivePlayerMoney(playerid, 2000);// you can change the money.
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 1)
	{
	    if(response)
		{
	        switch(listitem)
			{
	            case 0:
				{ 	// Farmer
					PlayerInfo[playerid][pJob] = 1;
					SendClientMessage(playerid, COLOR_GREY, "[Job Selector]: You are now working as a farmer.");
	            }
	        }
	    }
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}


CMD:harvest(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 1)
	{
   	 	new vehicleid = GetPlayerVehicleID(playerid);
		if(IsAFarverCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    if(gPlayerCheckpointStatus[playerid] == CHECKPOINT_NONE)
			{
			    SendClientMessage(playerid, COLOR_GREY, "[FarmerJob]:Follow The Checkpoints and get your reward.");
		        SetPlayerCheckpoint(playerid, -309.0990,-1381.1797,10.7049, 10);
		        Harvesting[playerid] =1;
      		}
	  	}
	    else return SendClientMessage(playerid, COLOR_GREY, "[FarmerJob]:You are not at Farm!!");
	}
	else return SendClientMessage(playerid, COLOR_GREY, "[FarmerJob]:You are not a Farmer!");
	return 1;
}

CMD:fshare(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 1)
	{
   	 	new vehicleid = GetPlayerVehicleID(playerid);
		if(IsAFarverCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    if(gPlayerCheckpointStatus[playerid] == CHECKPOINT_NONE)
			{
			    SendClientMessage(playerid, COLOR_GREY, "[FarmerJob]:Follow The Checkpoints and get your reward.");
			    SetPlayerCheckpoint(playerid,-335.1576,-1030.4205,59.1934, 10);
			    Sharing[playerid] =1;
			}
		}
		else return SendClientMessage(playerid, COLOR_GREY, "[FarmerJob]:You are not at Farm!");
	}
	else return SendClientMessage(playerid, COLOR_GREY, "[FarmerJob]:You are not Farmer!");
	return 1;
}

CMD:jobselect(playerid, params[])
{
	ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Chose your job", "Farmer", "Select", "Cancel");
	return 1 ;
}

/*	if(sscanf(params, "s[32]", params))
	{
	    SendClientMessage(playerid, COLOR_GREY, "[Jobs]: Farmer - Next - Next - Next - Next.");
	    return 1;
	}
	if(!strcmp(params, "farmer", true))
	{
 		PlayerInfo[playerid][pJob] = 1;
	  	SendClientMessage(playerid, COLOR_WHITE, "You are now working as a farmer.");
	}*/
	
CMD:quitjob(playerid, params[])
{
	SendClientMessage(playerid, COLOR_GREY, " You left your job.");
    PlayerInfo[playerid][pJob] = 0;
    return 1;
}
