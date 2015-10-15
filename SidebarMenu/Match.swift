//
//  Match.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/15.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class Match{


	var Matchdate:NSDate?
	var location:String?
	var hometeam:String?
	var awayteam:String?
	var img_of_teamA:UIImage?
	var img_of_teamB:UIImage?
	var tournament:String?
	
	init(Matchdate:NSDate,location:String,hometeam:String,awayteam:String,img_of_teamA:UIImage,img_of_teamB:UIImage,tournament:String){
		self.Matchdate = Matchdate
		self.location=location
		self.hometeam=hometeam
		self.awayteam=awayteam
		self.img_of_teamA=img_of_teamA
		self.img_of_teamB=img_of_teamB
		self.tournament=tournament
		
	}
	
		
	
	

}