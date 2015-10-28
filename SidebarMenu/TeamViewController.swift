//
//  MapViewController.swift
//  SidebarMenu
//
//  Created by Simon WEI on 10/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class TeamViewController: UITableViewController {
    
	@IBOutlet weak var indecate: UIActivityIndicatorView!
	@IBOutlet weak var menuButton: UIBarButtonItem!
	let user = User.sharedInstance
	
	var team_list = [team]()
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 380, 700)
		self.view.addSubview(bluredEffectView)
		self.view.sendSubviewToBack(bluredEffectView)
		
		self.indecate.hidden=false
		indecate.startAnimating()
		print("this is team")
		print(user.userId)
		self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ceystalhorizon")!)
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
        // Do any additional setup after loading the view.
		getRemoteData()
		
    }

	func getRemoteData() {
		let url = NSURL(string: "http://csci342.azurewebsites.net/api/TeamApi/" + user.userId)
		let session = NSURLSession.sharedSession()
		
		let request = NSMutableURLRequest(URL: url!)
		
		let task = session.dataTaskWithRequest(request) {
			(let data, let response, let error) in
			guard let _:NSData = data, let _:NSURLResponse = response where error == nil else {
				print("error")
				return
			}
			
			dispatch_async(dispatch_get_main_queue(), {
				let json = NSString(data: data!, encoding: NSASCIIStringEncoding)
				self.initialTableArray(json!)
				print(json)
				print("get it")
				return
			})
		}
		task.resume()
	}

	
	func initialTableArray(data : NSString) {
		var parseError: NSError?
		let jsonData:NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
		let json: AnyObject?
		do {
			json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
		} catch let error as NSError {
			parseError = error
			json = nil
		}
		
		if (parseError == nil) {
			if let list = json as? NSArray {
				for (var i = 0; i < list.count; i++) {
					if let dataBlock = list[i] as? NSDictionary {
						team_list.append(team(data: dataBlock))
						print(team_list[team_list.count-1])
					}
				}
			}
		}
		refershTable()
	}
	
	func refershTable() {
		dispatch_async(dispatch_get_main_queue(), {
			self.indecate.stopAnimating()
			self.indecate.hidden=true
			self.tableView.reloadData()
			return
		})
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
		cell.contentView.backgroundColor = UIColor.clearColor()
		cell.backgroundColor = UIColor.clearColor();
		
		
		let teamcell = team_list[indexPath.row]
		
		cell.textLabel?.text = teamcell.name
		
		cell.textLabel?.textColor = UIColor.whiteColor()
		
		return cell
	}
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		print("Show_team_detail")
		if segue.identifier == "Show_team_detail" {
			print("Show_team_detail")
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
