//
//  Team.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/15.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class team{

	var Team_name : String?
	var Team_location : String?
	var Team_age_group : Int?
	var Team_grade : Int?
	var Team_Manage : String?
	
	
	init(Team_name : String,Team_location : String,Team_age_group : Int,Team_grade : Int,Team_Manage : String){
		self.Team_name = Team_name
		self.Team_location = Team_location
		self.Team_age_group = Team_age_group
		self.Team_grade = Team_grade
		self.Team_Manage = Team_Manage
	
	}

}

