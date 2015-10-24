//
//  DeclinedOfferDetail.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation





class DeclinedOfferDetail:UIViewController{
	
	
	var declineOffer:Offer?

	@IBOutlet weak var Tournament: UILabel!

	@IBOutlet weak var HomeTeam: UILabel!
	@IBAction func back_button(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			dismissViewControllerAnimated(true, completion: nil)
			
		} else {
			
			navigationController!.popViewControllerAnimated(true)
			
		}
		
	}

	@IBOutlet weak var AwayTeam: UILabel!

	@IBOutlet weak var Offer_Date: UILabel!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
	if let declineOffer_tetail = declineOffer {
		
		Tournament.text = declineOffer_tetail.Tournament
		
		
		HomeTeam.text = declineOffer_tetail.TeamA_name
		
		
		AwayTeam.text = declineOffer_tetail.TeamB_name
		
		Offer_Date.text = declineOffer_tetail.Match_date
		
		
		
		
		
	}
	
	}
	


}