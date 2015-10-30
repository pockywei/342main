//
//  Weather.swift
//  TManager
//
//  Created by WEI on 15/10/29.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation

class Weather{

	var city : String?
	var cnt : Int?
	
	var temp_C_day : Int?
	var temp_C_min : Int?
	var temp_C_max : Int?
	var temp_C_night : Int?
	var temp_C_eve : Int?
	var temp_C_morn : Int?
	
	
	var weather_info : String?
	
	var weather_desc : String?
	var weather_icon : String?
	
	init(ns:NSDictionary,cityS : String){
		
		city = cityS
		
		let data = ns as NSDictionary
		
		let tempdata = data["temp"] as! NSDictionary
		
		if let a = tempdata["day"] as? Int{
		temp_C_day=a
		}
		else
		{
			print("no day")
		}
		
		if let b = tempdata["min"] as? Int{
			temp_C_min=b
		}
		else
		{
			print("no min")
		}
		if let c = tempdata["max"] as? Int{
			temp_C_day=c
		}
		else
		{
			print("no max")
		}
		if let d = tempdata["night"] as? Int{
			temp_C_day=d
		}
		else
		{
			print("no night")
		}
		if let e = tempdata["eve"] as? Int{
			temp_C_day=e
		}
		else
		{
			print("no eve")
		}
		if let f = tempdata["morn"] as? Int{
			temp_C_day=f
		}
		else
		{
			print("no morn")
		}
		
		
		
		
		
		let weathers = data["weather"] as! NSArray
		
		let weather_i = weathers[0] as! NSDictionary
		
		
		if let mains = weather_i["main"] as? String{
			weather_info=mains
		}
		else
		{
			print("no main")
		}
		
		if let weather_descs = weather_i["description"] as? String{
			weather_desc=weather_descs
		}
		else
		{
			print("no description")
		}
	
		if let weather_icons = weather_i["icon"] as? String{
			weather_icon=weather_icons
		}
		else
		{
			print("no icon")
		}
		
	
	}



}