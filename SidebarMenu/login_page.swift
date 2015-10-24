//
//  login_page.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/22.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class loing_page:UIViewController{

	let user = User.sharedInstance
	
	
	@IBOutlet weak var Username: UITextField!
	@IBOutlet weak var Password: UITextField!

	override func viewDidAppear(animated: Bool) {
		
		
		
		//id="auauau"
		//self.performSegueWithIdentifier("login", sender: self)
	}
	
	
	
	
	
	func post2PHP() {
		let myUrl = NSURL(string: "http://www.")
		let request = NSMutableURLRequest(URL:myUrl!);
		request.HTTPMethod = "POST";
		// Compose a query string
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
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier=="login"
		{
			//print(re!.username)
			
			
			
			
			
				//colorViewController.referee.username = re!.username
				self.user.userId = 42
				self.user.name = "Anthoni Giskegjerde"
				
			
		}
		
	}

}