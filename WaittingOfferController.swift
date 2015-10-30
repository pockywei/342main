//
//  WaittingOfferController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class WaittingOfferController:UITableViewController {
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
		let url = NSURL(string: "http://csci342.azurewebsites.net/api/PendingOffers/" + user.userId + "?userId=" + user.name)
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
				print(json)
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

	

	func post2PHP(offid:Int) {
		let url = NSURL(string: "http://csci342.azurewebsites.net/api/PendingOffers/"+user.userId+"?offerId="+String(offid)+"&flag=1")
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
				//self.initialTableArray(json!)
				print("get it")
				print(json)
				return
			})
		}
		task.resume()
	}
	
	
	
	func handleTap_pendingOffer_to_accept(sender: UITapGestureRecognizer){
	print("hello")
		let tapLocation = sender.locationInView(self.tableView)
		let indexPath = self.tableView.indexPathForRowAtPoint(tapLocation)
		let cell = self.tableView.cellForRowAtIndexPath(indexPath!)
		
		
		let cell_pending = cell as! pendingTableCell
		
		print(cell_pending.offerid)
		
		post2PHP(cell_pending.offerid!)
		cell?.imageView?.image = UIImage(named: "accepted")
		
		offerlist.removeAtIndex(indexPath!.row)
		tableView.reloadData()
		
		
	}
	
	func declinePost(offid:Int){
	
		
			let url = NSURL(string: "http://csci342.azurewebsites.net/api/PendingOffers/"+user.userId+"?offerId="+String(offid)+"&flag=0")
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
					//self.initialTableArray(json!)
					print("get it")
					print(json)
					return
				})
			}
			task.resume()
		
	
	
	
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return offerlist.count
	}
	
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		print("panding_cell")
		let cell = tableView.dequeueReusableCellWithIdentifier("pending_cell", forIndexPath: indexPath) as! pendingTableCell
		
		
		let offer_cell = offerlist[indexPath.row]
		cell.offerid = offer_cell.offerId
		cell.Accept_button.userInteractionEnabled = true
		
		let tapGesture_pending = UITapGestureRecognizer(target: self, action: Selector("handleTap_pendingOffer_to_accept:"))

		cell.Accept_button.addGestureRecognizer(tapGesture_pending)
		
		cell.Accept_button.image = UIImage(named:"accept")
		cell.OfferDate.text = offer_cell.dateOfOffer
		
		cell.OfferDate.textColor = UIColor.whiteColor()
		
		
		
		
		//		cell.Tournament.text = offer_cell.Tournament
		//
		//		cell.Offer_date.text = offer_cell.Match_date
		
		
		return cell
		
		
		
	}

	
	func handleTap_pendingOffer_to_accept(sender: UITapGestureRecognizer){
	print("hello")
		let tapLocation = sender.locationInView(self.tableView)
		let indexPath = self.tableView.indexPathForRowAtPoint(tapLocation)
		let cell = self.tableView.cellForRowAtIndexPath(indexPath!)
		
		cell?.imageView?.image = UIImage(named: "accepted")
		
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return offerlist.count
	}
	
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		print("panding_cell")
		let cell = tableView.dequeueReusableCellWithIdentifier("pending_cell", forIndexPath: indexPath) as! pendingTableCell
		
		
		let offer_cell = offerlist[indexPath.row]
		
		cell.Accept_button.userInteractionEnabled = true
		
		let tapGesture_pending = UITapGestureRecognizer(target: self, action: Selector("handleTap_pendingOffer_to_accept:"))

		cell.Accept_button.addGestureRecognizer(tapGesture_pending)
		
		cell.Accept_button.image = UIImage(named:"accept")
		cell.OfferDate.text = offer_cell.dateOfOffer
		
		cell.OfferDate.textColor = UIColor.whiteColor()
		
		
		
		
		//		cell.Tournament.text = offer_cell.Tournament
		//
		//		cell.Offer_date.text = offer_cell.Match_date
		
		
		return cell
		
		
		
	}

	
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle==UITableViewCellEditingStyle.Delete{
			//Do something with post
			offerlist.removeAtIndex(indexPath.row)
			
			let cell = tableView.dequeueReusableCellWithIdentifier("pending_cell", forIndexPath: indexPath) as! pendingTableCell
			declinePost(cell.offerid!)
			//tableView.reloadData()
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
		}
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// Get the new view controller using [segue destinationViewController].
		// Pass the selected object to the new view controller.
		//print("accept_detail")
		if segue.identifier == "pending_offer_detail" {
			//print("Show_team_detail")
			let view = segue.destinationViewController as! UINavigationController
			let offerDetailViewController = view.topViewController as! PendingOfferDetail
			if let selectedMealCell = sender as? UITableViewCell {
				let indexPath = tableView.indexPathForCell(selectedMealCell)!
				//if(searchActive){
				let selectedMeal = offerlist[indexPath.row]
				offerDetailViewController.pendingOffer = selectedMeal
				
				
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