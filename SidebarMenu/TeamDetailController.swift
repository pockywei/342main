//
//  TeamDetailController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/16.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation
import UIKit



class TeamDetailController:UIViewController{

	@IBOutlet weak var Team_manage: UILabel!
	@IBOutlet weak var Team_grade: UILabel!
	@IBOutlet weak var Team_age: UILabel!
	@IBOutlet weak var Team_name: UILabel!
	@IBOutlet weak var Team_location: UILabel!
	var Team : team?
	
	@IBOutlet weak var sb: UIImageView!
	
	@IBAction func Back_button(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			print("2")
			navigationController!.popViewControllerAnimated(true)
		} else {
			print("3")
			dismissViewControllerAnimated(true, completion: nil)
			
		}

	}

	override func viewDidLoad() {
		super.viewDidLoad()
	
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)

		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)

		self.sb.addSubview(bluredEffectView)

		
		if let team_detail = Team {
		
		Team_manage.text = "Team manager: "+team_detail.managerName
			
			//let myString = String(team_detail.Team_grade!)
			Team_grade.text = "Team grade: "+team_detail.grade
			
			//let myString2 = String(team_detail.Team_age_group!)
			Team_age.text = "Team age: "+String(team_detail.ageBracket)
			
			Team_name.text = "Team name: "+team_detail.name
			
			Team_location.text = "The sport type: "+team_detail.sport
			
		
		
		}
	
	
	
	}






}