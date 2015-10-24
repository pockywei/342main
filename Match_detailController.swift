//
//  Match_detailController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/22.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class Match_detailController:UIViewController{

	@IBAction func back_button(sender: AnyObject) {
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
	@IBOutlet weak var teamBname: UILabel!
	@IBOutlet weak var teamAname: UILabel!
	@IBOutlet weak var matchdate: UILabel!
	@IBOutlet weak var MatchLocation: UILabel!
	@IBOutlet weak var tournament_name: UILabel!
	var match : Match?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

	if let matchdetail = match{
		
		teamAname.text = matchdetail.hometeam
		teamBname.text = matchdetail.awayteam
		matchdate.text = String(matchdetail.Matchdate)
		MatchLocation.text = matchdetail.location
		tournament_name.text = matchdetail.tournament
		
		}
	}
	
	
	
	


}