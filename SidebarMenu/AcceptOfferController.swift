//
//  AcceptOfferController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class AcceptOfferController:UITableViewController{
	let user = User.sharedInstance
	
	@IBOutlet weak var indecate: UIActivityIndicatorView!
	
	
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
	
	
		var offerlist = [Offer]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		indecate.startAnimating()
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)
		self.view.addSubview(bluredEffectView)
		self.view.sendSubviewToBack(bluredEffectView)

		
		self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ceystalhorizon")!)
		getRemoteData()
		
		
		
	}
	
	func getRemoteData() {
		let url = NSURL(string: "http://csci342.azurewebsites.net/api/AcceptedOffers/" + user.userId + "?userId=" + user.name)
		print(url)
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
						offerlist.append(Offer(data: dataBlock))
						print(offerlist[offerlist.count-1])
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

	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return offerlist.count
	}
	
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Accept_cell", forIndexPath: indexPath) as! OfferCell
		
		
		let offer_cell = offerlist[indexPath.row]
		
		
		
		
		cell.Tournament.text = "Name of location: "+offer_cell.nameOfLocation
		
		cell.Offer_date.text = "Date of offer: "+offer_cell.dateOfOffer
		
		cell.textLabel?.textColor = UIColor.whiteColor()
		
		cell.Offer_date.textColor = UIColor.whiteColor()
		
		return cell
		
		
		
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// Get the new view controller using [segue destinationViewController].
		// Pass the selected object to the new view controller.
		//print("accept_detail")
		if segue.identifier == "accept_detail" {
			//print("Show_team_detail")
			let view = segue.destinationViewController as! UINavigationController
			let offerDetailViewController = view.topViewController as! AcceptedOfferDetail
			
			if let selectedMealCell = sender as? UITableViewCell {
				let indexPath = tableView.indexPathForCell(selectedMealCell)!
				//if(searchActive){
				let selectedMeal = offerlist[indexPath.row]
				offerDetailViewController.acceptOffer = selectedMeal
				
				
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