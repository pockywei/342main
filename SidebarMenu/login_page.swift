//
//  login_page.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/22.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class loing_page:UIViewController{


	@IBOutlet weak var Username: UITextField!
	@IBOutlet weak var Password: UITextField!

	
	func post2PHP() {
		let myUrl = NSURL(string: "http://")
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

}