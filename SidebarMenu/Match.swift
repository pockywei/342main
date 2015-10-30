//
//  Match.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/15.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class Match{


	var teamAname : String
	var teamBname : String
	var location : String
	var MatchId : Int
	var matchDate : String
	var halfTimeDuration : Int
	var matchLength : Int
	var TournamentName : String
	var lat : String
	var lon : String
	
	init(data: NSDictionary) {
		teamAname = data["teamA"] as! String
		teamBname = data["teamB"] as! String
		location = data["locationId"] as! String
		MatchId = data["MatchId"] as! Int
		matchDate = data["matchDate"] as! String
		halfTimeDuration = data["halfTimeDuration"] as! Int
		matchLength = data["matchLength"] as! Int
		TournamentName = data["tournamentName"] as! String
		lat = data["lon"] as! String
		lon = data["lat"] as! String
		
	}
	
	
	
	

}