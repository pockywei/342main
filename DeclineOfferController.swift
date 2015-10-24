//
//  DeclineOfferController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class DeclineOfferController: UITableViewController {
	
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
	
	struct tableCellData {
		var teamAId : Int
		var teamBId : Int
		var locationId : Int
		
		init(data: NSDictionary) {
			teamAId = data["teamAId"] as! Int
			teamBId = data["teamBId"] as! Int
			locationId = data["locationId"] as! Int
		}
	}
	
	var records = [tableCellData]()
	var offerlist = [Offer]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let offer = Offer(Match_date: "10/14/2015", TeamA_name: "Team A", TeamB_name: "Team B", Tournament: "NSW game")
		
		offerlist.append(offer)
		offerlist.append(offer)
		offerlist.append(offer)
		offerlist.append(offer)
		
	}

	
	
	func getRemoteData() {
		let url = NSURL(string: "http://342.azurewebsites.net/api/matches")
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
						records.append(tableCellData(data: dataBlock))
						print(records[records.count-1])
					}
				}
			}
		}
		//refershTable()
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return offerlist.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		print("Decline_cell")
		let cell = tableView.dequeueReusableCellWithIdentifier("Decline_cell", forIndexPath: indexPath) as! OfferCell
		
		
		let offer_cell = offerlist[indexPath.row]
		
		
		
		cell.Tournament.text = offer_cell.Tournament
		cell.Offer_date.text = offer_cell.Match_date
		
		
		
		
//		cell.Tournament.text = offer_cell.Tournament
//		
//		cell.Offer_date.text = offer_cell.Match_date
		
		
		return cell
		
		
		
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// Get the new view controller using [segue destinationViewController].
		// Pass the selected object to the new view controller.
		//print("accept_detail")
		if segue.identifier == "decline_detail" {
			//print("Show_team_detail")
			let view = segue.destinationViewController as! UINavigationController
			let offerDetailViewController = view.topViewController as! DeclinedOfferDetail
			
			if let selectedMealCell = sender as? UITableViewCell {
				let indexPath = tableView.indexPathForCell(selectedMealCell)!
				//if(searchActive){
				let selectedMeal = offerlist[indexPath.row]
				offerDetailViewController.declineOffer = selectedMeal
				
				
				//}
				//				else{
				//					let selectedMeal = clipping[indexPath.row]
				//					mealDetailViewController.clip = selectedMeal
				//					mealDetailViewController.coll_detail = coll
				//
				//				}
				
				
				
			}
			
			
			
			
		}
		
	}
	
	
}