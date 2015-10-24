//
//  Referee.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/15.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class Referee{


	
	var name : String?
	var location : String?
	var head_pic : UIImage?
	//var team_belong : [String]?
	
	var birthday : String?
	var username : String?
	var password : String?
	
	init(){}
	
	init(name : String,location : String,head_pic : UIImage,team_belong : [String],birthday : String){
		
		self.name = name
		self.location = location
		self.head_pic = head_pic
		//self.team_belong = team_belong
		self.birthday = birthday
		
		
	}




}