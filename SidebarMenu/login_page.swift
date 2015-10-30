//
//  login_page.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/22.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation


class loing_page:UIViewController,UITextFieldDelegate{

	@IBOutlet weak var transpancy: UIImageView!
	@IBOutlet weak var indecate: UIActivityIndicatorView!
	let user = User.sharedInstance
	let apibaseurl = "http://csci342.azurewebsites.net/api/Authentication/"
	
	@IBOutlet weak var login_button: UIButton!
	
	@IBOutlet weak var Username: UITextField!
	@IBOutlet weak var Password: UITextField!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		login_button.backgroundColor = UIColor.clearColor()
		login_button.layer.cornerRadius = 5
		login_button.layer.borderWidth = 1
		login_button.layer.borderColor = UIColor.whiteColor().CGColor
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)
		self.transpancy.addSubview(bluredEffectView)
        self.transpancy.sendSubviewToBack(bluredEffectView)
		
	}
	
	override func viewDidAppear(animated: Bool) {
		
		

		
		self.Username.delegate = self;
		self.Password.delegate = self;
		
		indecate.hidden = true
		self.login_button.userInteractionEnabled = true
		let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))

		login_button.addGestureRecognizer(tapGesture)
		//id="auauau"
		
		
		
		//
	}
	
	
	func handleTap(sender : UIButton){
	
		//post2website
		//verify the password
		//set the ID
		print(Username.text)
		print(Password.text)
		
		
		//self.user.userId = 42
		self.user.name = Username.text!
		self.user.password = Password.text!
		indecate.hidden = false
		indecate.startAnimating()
		post2MVC_rao()
		
		
		//
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		self.view.endEditing(true)
		self.user.name = Username.text!
		self.user.password = Password.text!
		indecate.hidden = false
		indecate.startAnimating()
		post2MVC_rao()
		return false
	}
	
	
	func post2MVC_rao() {
		
		var flag = false
		
		
			let url = NSURL(string: apibaseurl + user.name + "?password=" + user.password)
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
					print(json)
					self.initialTableArray(json!)
					print("get it")
					//return
				})
			}
			task.resume()
		
		
		
	}
	
	func initialTableArray(data : NSString){
		print("hello1")
		var parseError: NSError?
		let jsonData:NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
		let json: AnyObject?
		do {
			print("hello2")
			json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
		} catch let error as NSError {
			print("hello3")
			parseError = error
			json = nil
		}
	
		
		if (parseError == nil) {
			if let dataBlock = json as? NSDictionary {
				
				if let userids = dataBlock["apiKey"] as? String{
					user.userId=userids
				}
				else{
					user.userId="-1"
				}
				
				print(user.userId)
				if user.userId=="-1"
				{
					var tField: UITextField!
					
					indecate.stopAnimating()
					
					indecate.hidden=true
					
					func handleCancel(alertView: UIAlertAction!)
					{
						print("Cancelled !!")
					}
					var alert = UIAlertController(title: "Password or username is wrong", message: "", preferredStyle: UIAlertControllerStyle.Alert)
					
					
					alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:handleCancel))
					self.presentViewController(alert, animated: true, completion: {
						print("completion block")
					})

					
					print("fail login")
				}else{
					print("hello")
					indecate.stopAnimating()
					self.performSegueWithIdentifier("login", sender: self)
				}
			
			}
		}
	}
	
	
		
	
			
			
	
	
	

						//records.append(tableCellData(data: dataBlock))
						//print(records[records.count-1])
			
		
		
		//refershTable()
		
		
	
			
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}