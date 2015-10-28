//
//  Team.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/15.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class team{

	var teamId : Int
	var name : String
	var ageBracket : Int
	var grade : String
	var sport : String
	var managerName : String
	
	
	init(data: NSDictionary) {
		teamId = data["teamId"] as! Int
		name = data["name"] as! String
		ageBracket = data["ageBracket"] as! Int
		grade = data["grade"] as! String
		sport = data["sport"] as! String
		managerName = data["managerName"] as! String
	}

}

