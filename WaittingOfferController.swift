//
//  WaittingOfferController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class WaittingOfferController:UITableViewController {
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

	
	
	func post2PHP(message_of_offer:String) {
		let myUrl = NSURL(string: "http://")
		let request = NSMutableURLRequest(URL:myUrl!);
		request.HTTPMethod = "POST";
		// Compose a query string
		
		if(message_of_offer=="accept")
		{
			
		}
		else if(message_of_offer=="decline")
		{
			
		}
		
		
		let postString = "&username=cw473";
		
		request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
		
		let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
			data, response, error in
			
			if error != nil
			{
				print("error=\(error)")
				return
			}
			
			// You can print out response object
			
			// Print out response body
			let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
			print("responseString = \(responseString)")
			
			//Let’s convert response sent from a server side script to a NSDictionary object:
			
		}
		
		task.resume()
	}
	
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle==UITableViewCellEditingStyle.Delete{
			//Do something with post
			
			
			//tableView.reloadData()
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
		}
	}
	
}