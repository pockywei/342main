//
//  AcceptedOfferDetail.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class AcceptedOfferDetail:UIViewController{

	var acceptOffer:Offer?

	@IBAction func back_button(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			dismissViewControllerAnimated(true, completion: nil)
			
		} else {
			
			navigationController!.popViewControllerAnimated(true)
			
		}
		
	
	}
	@IBOutlet weak var Tournament_name: UILabel!

	@IBOutlet weak var HomeTeam: UILabel!


	@IBOutlet weak var AwayTeam: UILabel!
	
	
	@IBOutlet weak var Offer_Date: UILabel!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		if let acceptOffer_tetail = acceptOffer {
			
			Tournament_name.text = acceptOffer_tetail.Tournament
			
			
			HomeTeam.text = acceptOffer_tetail.TeamA_name
			
			
			AwayTeam.text = acceptOffer_tetail.TeamB_name
			
			Offer_Date.text = acceptOffer_tetail.Match_date
			
			
			
			
			
		}
		
		
		
	}


}