//
//  AvaliblityController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/21.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation

class AvaliblityController:UIViewController {
	@IBOutlet weak var BarButtom: UIBarButtonItem!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.revealViewController() != nil {
			BarButtom.target = self.revealViewController()
			BarButtom.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
	}

}