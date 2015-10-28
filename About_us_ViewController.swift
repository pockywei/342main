//
//  About_us_ViewController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class About_us_ViewController:UIViewController{
	@IBOutlet weak var menuButton:UIBarButtonItem!

	@IBOutlet weak var transpancy: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 380, 700)
		self.transpancy.addSubview(bluredEffectView)
		
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		// Do any additional setup after loading the view.
		
		

}
}