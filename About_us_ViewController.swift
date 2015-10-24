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

	override func viewDidLoad() {
		super.viewDidLoad()
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		// Do any additional setup after loading the view.
		
		

}
}