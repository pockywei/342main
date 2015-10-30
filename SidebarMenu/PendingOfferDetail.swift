//
//  PendingOfferDetail.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/24.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class PendingOfferDetail:UIViewController{

	@IBOutlet weak var sb: UIImageView!
	var pendingOffer:Offer?
	
	@IBOutlet weak var decline_reason: UILabel!
	
	@IBOutlet weak var location: UILabel!
	
	@IBOutlet weak var matchdate: UILabel!
	
	
	@IBOutlet weak var Offer_Date: UILabel!


	@IBAction func back_button(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			dismissViewControllerAnimated(true, completion: nil)
			
		} else {
			
			navigationController!.popViewControllerAnimated(true)
			
		}
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)
		self.sb.addSubview(bluredEffectView)


	
	if let pending = pendingOffer{
		decline_reason.text = pending.declinedReason
		
		location.text = pending.nameOfLocation
		
		matchdate.text = pending.dateOfMatch
		
		
		Offer_Date.text = pending.dateOfOffer
	}
	
	
	}



}