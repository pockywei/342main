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
	
		
		if let team_detail = Team {
		
		Team_manage.text = team_detail.Team_Manage
			
			let myString = String(team_detail.Team_grade)
			Team_grade.text = myString
			
			let myString2 = String(team_detail.Team_age_group)
			Team_age.text = myString2
			
			Team_name.text = team_detail.Team_name
			
			Team_location.text = team_detail.Team_location
			
		
		
		}
	
	
	
	}






}