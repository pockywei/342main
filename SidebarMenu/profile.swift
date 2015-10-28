//
//  profile.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/24.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class profile{

	var firstName : String
	var UserName : String
	var ffaNum : Int
	var lastName : String
	var phoneNum : Int
	var email : String
	var country : String
	var postcode : Int
	var street : String
	var city : String
	var state : String
	var dob : String
	var photo : String
	
	init(data: NSDictionary) {
		firstName = data["firstName"] as! String
		UserName = data["UserName"] as! String
		ffaNum = data["ffaNum"] as! Int
		lastName = data["lastName"] as! String
		phoneNum = data["phoneNum"] as! Int
		
		email = data["email"] as! String
		country = data["country"] as! String
		
		postcode = data["postcode"] as! Int
		street = data["street"] as! String
		city = data["city"] as! String
		state = data["state"] as! String
		dob = data["dob"] as! String
		photo = data["photoDir"] as! String
		
		
	}







}