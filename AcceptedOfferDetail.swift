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
	

	@IBOutlet weak var decline_reason: UILabel!

	@IBOutlet weak var location: UILabel!

	@IBOutlet weak var matchdate: UILabel!
	
	
	@IBOutlet weak var Offer_Date: UILabel!
	
	@IBOutlet weak var sb: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0,460, 800)
		self.sb.addSubview(bluredEffectView)

		if let acceptOffer_tetail = acceptOffer {
			
			let index=acceptOffer_tetail.dateOfOffer.startIndex.advancedBy(10)
			
			
			decline_reason.text=""
			
			location.text=acceptOffer_tetail.nameOfLocation
			
			Offer_Date.text=acceptOffer_tetail.dateOfOffer.substringToIndex(index)
			
			matchdate.text=acceptOffer_tetail.dateOfMatch.substringToIndex(index)
			
		}
		
		
		
	}


}