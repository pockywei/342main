//
//  MapViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class TeamViewController: UITableViewController {
    
	@IBOutlet weak var menuButton: UIBarButtonItem!

	var team_list = [team]()
    override func viewDidLoad() {
        super.viewDidLoad()
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
        // Do any additional setup after loading the view.
		
		let team_temp = team(Team_name: "Wollongong A", Team_location: "Wollongong", Team_age_group: 18, Team_grade: 4, Team_Manage: "zhaokk")
		
		team_list.append(team_temp)
		team_list.append(team_temp)
		team_list.append(team_temp)
		team_list.append(team_temp)
		team_list.append(team_temp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return team_list.count
	}

	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
		
		
		let teamcell = team_list[indexPath.row]
		
		cell.textLabel?.text = teamcell.Team_name
		
		return cell
	}
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "show_team_detail" {
			let view = segue.destinationViewController as! UINavigationController
			let teamDetailViewController = view.topViewController as! TeamDetailController
			
			if let selectedMealCell = sender as? UITableViewCell {
				let indexPath = tableView.indexPathForCell(selectedMealCell)!
				//if(searchActive){
					let selectedMeal = team_list[indexPath.row]
					teamDetailViewController.Team = selectedMeal
				
					
				//}
//				else{
//					let selectedMeal = clipping[indexPath.row]
//					mealDetailViewController.clip = selectedMeal
//					mealDetailViewController.coll_detail = coll
//					
//				}
				
				
				
			}
			
			
			
			
		}
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	

}
