//
//  User.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/15.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class User{
	
	class var sharedInstance: User {
		struct Static {
			static var instance: User?
			static var token: dispatch_once_t = 0
		}
		
		dispatch_once(&Static.token) {
			Static.instance = User()
		}
		
		return Static.instance!
	}
	
	var userId: Int = 0
	var name: String = ""
}