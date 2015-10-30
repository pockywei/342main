//
//  OfferController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/16.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class OfferTableViewController: UIViewController{
	
	
	@IBOutlet weak var sb: UIImageView!
	
	@IBOutlet weak var pendingOffer: UIImageView!

	@IBOutlet weak var menuButton: UIBarButtonItem!
	
	@IBOutlet weak var Decline: UIImageView!
	@IBOutlet weak var Accept: UIImageView!
	override func viewDidLoad() {
	super.viewDidLoad()
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)
		self.sb.addSubview(bluredEffectView)
		//self.sb.sendSubviewToBack(bluredEffectView)
		
		
		self.Accept.userInteractionEnabled = true
		self.Decline.userInteractionEnabled = true
		self.pendingOffer.userInteractionEnabled = true
		
		let tapGesture_pending = UITapGestureRecognizer(target: self, action: Selector("handleTap_pending:"))
		
		
		let tapGesture_accept = UITapGestureRecognizer(target: self, action: Selector("handleTap_accept:"))
		
		let tapGesture_decline = UITapGestureRecognizer(target: self, action: Selector("handleTap_decline:"))
		
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		pendingOffer.addGestureRecognizer(tapGesture_pending)
		Decline.addGestureRecognizer(tapGesture_decline)
		Accept.addGestureRecognizer(tapGesture_accept)
	
	}
	
	func handleTap_pending(sender : UIImageView) {
		
		print("Tap Gesture recognized pending")
		self.performSegueWithIdentifier("waitting_offer", sender: self)
		
		
		
		// Only allow photos to be picked, not taken.
		
	}
	
	
	
	func handleTap_accept(sender : UIImageView) {
		
		print("Tap Gesture recognized accept")
		self.performSegueWithIdentifier("accept_segues", sender: self)
		
		// Only allow photos to be picked, not taken.
		
	}
	
	
	func handleTap_decline(sender : UIImageView) {
		
		print("Tap Gesture recognized decline")
		self.performSegueWithIdentifier("decline_segues", sender: self)
		
		
		// Only allow photos to be picked, not taken.
		
	}
	
	
	
	
	
	
	


}