//
//  OfferController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/16.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class OfferTableViewController: UIViewController{

	@IBOutlet weak var menuButton: UIBarButtonItem!
	
	@IBOutlet weak var Decline: UIImageView!
	@IBOutlet weak var Accept: UIImageView!
	override func viewDidLoad() {
	super.viewDidLoad()
		self.Accept.userInteractionEnabled = true
		self.Decline.userInteractionEnabled = true
		let tapGesture_accept = UITapGestureRecognizer(target: self, action: Selector("handleTap_accept:"))
		
		let tapGesture_decline = UITapGestureRecognizer(target: self, action: Selector("handleTap_decline:"))
		
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		Decline.addGestureRecognizer(tapGesture_decline)
		Accept.addGestureRecognizer(tapGesture_accept)
	
	}
	
	
	
	func handleTap_accept(sender : UIImageView) {
		
		print("Tap Gesture recognized accept")
		
		
		// Only allow photos to be picked, not taken.
		
	}
	
	
	func handleTap_decline(sender : UIImageView) {
		
		print("Tap Gesture recognized decline")
		
		
		// Only allow photos to be picked, not taken.
		
	}
	
	
	
	


}