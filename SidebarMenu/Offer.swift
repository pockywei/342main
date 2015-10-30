//
//  Offer.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/16.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class Offer{

	var dateOfOffer : String
	var declinedReason : String
	var dateOfMatch : String
	var nameOfLocation : String

	var offerId : Int

	init(data: NSDictionary) {
		dateOfOffer = data["dateOfOffer"] as! String
		
		if let null = data["declinedReason"] as? NSNull
		{
			declinedReason=""
		}
		else
		{
			declinedReason = data["declinedReason"] as! String
		}
		
		dateOfMatch = data["dateOfMatch"] as! String
		nameOfLocation = data["nameOfLocation"] as! String

		offerId = data["offerId"] as! Int

		
		
	}



}