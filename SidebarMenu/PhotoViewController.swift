//
//  PhotoViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
	let user = User.sharedInstance
	
	@IBOutlet weak var tanspancy: UIImageView!
	@IBOutlet weak var indecate: UIActivityIndicatorView!
	@IBOutlet weak var ffanum: UILabel!
	
	@IBOutlet weak var phonenum: UILabel!
	
	@IBOutlet weak var email: UILabel!
	
	
	let apibaseurl = "http://csci342.azurewebsites.net/api/AccountApi/"

	
    @IBOutlet weak var menuButton:UIBarButtonItem!
	@IBOutlet weak var User_fullname: UILabel!
	@IBOutlet weak var Team_belong: UILabel!

	@IBOutlet weak var head_pic: UIImageView!
	@IBOutlet weak var birthday: UILabel!
	@IBOutlet weak var location: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
		//indecate.hidden=true
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 380, 700)
		self.tanspancy.addSubview(bluredEffectView)
		
		
		head_pic.hidden=true
		indecate.startAnimating()
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		getRemoteData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	func getRemoteData() {
		let url = NSURL(string: apibaseurl + user.userId + "?userId=" + user.name)
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
			//if let list = json as? NSArray {
				//for (var i = 0; i < list.count; i++) {
					if let dataBlock = json as? NSDictionary {
						let me = profile(data: dataBlock)
						indecate.stopAnimating()
						indecate.hidden=true
						head_pic.hidden=false
						
						if let url = NSURL(string: me.photo) {
							if let data = NSData(contentsOfURL: url){
								head_pic.contentMode = UIViewContentMode.ScaleAspectFit
								
								head_pic.image = UIImage(data: data)
							}
						}

						let index=me.dob.startIndex.advancedBy(10)
						
						User_fullname.text = "The username: "+me.firstName + me.lastName
						birthday.text = "Date of birth: "+me.dob.substringToIndex(index)
						location.text = "Location: "+me.street + " " + me.city
						Team_belong.text = me.state + " " + me.country + " " + String(me.postcode)
						ffanum.text = "FFA number: "+String(me.ffaNum)
						phonenum.text = "Phone number: "+String(me.phoneNum)
						email.text = "Email: "+me.email
						
					}
				//}
			//}
		}
		//refershTable()
	}

	
	


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
