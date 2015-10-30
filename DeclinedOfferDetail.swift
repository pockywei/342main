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


	@IBAction func back_button(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			dismissViewControllerAnimated(true, completion: nil)
			
		} else {
			
			navigationController!.popViewControllerAnimated(true)
			
		}
		
	}

	
	@IBOutlet weak var decline_reason: UILabel!
	
	@IBOutlet weak var location: UILabel!
	
	@IBOutlet weak var matchdate: UILabel!
	
	
	@IBOutlet weak var Offer_Date: UILabel!

	@IBOutlet weak var sb: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)
		self.sb.addSubview(bluredEffectView)

	
	if let declineOffer_tetail = declineOffer {
		
		decline_reason.text	= declineOffer_tetail.declinedReason
		location.text=declineOffer_tetail.nameOfLocation
		matchdate.text=declineOffer_tetail.dateOfMatch
		Offer_Date.text=declineOffer_tetail.dateOfOffer
	}
	
	}
	


}