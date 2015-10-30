//
//  weatherController.swift
//  TManager
//
//  Created by WEI on 15/10/30.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class weatherController:UITableViewController {
	
	var count = 0.0;
	@IBOutlet weak var indecate: UIActivityIndicatorView!

	@IBAction func back_button(sender: AnyObject) {
		
			let isPresentingInAddMealMode = presentingViewController is UINavigationController
			print("1")
			if isPresentingInAddMealMode {
				print("2")
				dismissViewControllerAnimated(true, completion: nil)
				
			} else {
				print("3")
				navigationController!.popViewControllerAnimated(true)
				
				
			}
		
	}
	
	var weathers = [Weather]()
	var latitude : String?
	var longitude : String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 460, 800)
		self.view.addSubview(bluredEffectView)
		self.view.sendSubviewToBack(bluredEffectView)
		
		self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ceystalhorizon")!)
		getRemoteData()

		
		self.indecate.hidden=false
		indecate.startAnimating()
		//print("this is team")
		//print(user.userId)
		
		// Do any additional setup after loading the view.
		
		
	}
	
	func getRemoteData() {
		print("http://api.openweathermap.org/data/2.5/forecast/daily?lat="+latitude!+"&lon="+longitude!+"&cnt=10&mode=json&appid=064861200d3781d69a07ca2a7db2ca1c")
		
		let url = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast/daily?lat="+latitude!+"&lon="+longitude!+"&cnt=10&mode=json&appid=064861200d3781d69a07ca2a7db2ca1c")
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
				//print(json)
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
			//weathers.append(Weather(json))
					if let dataBlock = json!["city"] as? NSDictionary {
						print(dataBlock)
						let city = dataBlock["name"] as! String
						if let lists = json!["list"] as? NSArray {
							for (var i = 0; i < lists.count; i++) {
								weathers.append(Weather(ns: lists[i] as! NSDictionary,cityS: city))
								print(weathers[weathers.count-1])
							}
							
							
						}
							print(city)
						
						
					}
					else{
						print("no json")
					}
				//}
			//}
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
		return weathers.count
	}
	
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("weathercell", forIndexPath: indexPath) as! WeatherCell
		cell.contentView.backgroundColor = UIColor.clearColor()
		cell.backgroundColor = UIColor.clearColor();
		
		
		let weacell = weathers[indexPath.row]
		
		//cell.pic_weather = weacell.weather_icon
		
		cell.The_wea_info.text = "average temperature: "+String(weacell.temp_C_day!-273)+"°C"
		
		var date = NSDate()
		let index=String(date.dateByAddingTimeInterval(1*count*24*3600)).startIndex.advancedBy(10)
		cell.The_tem_c.text = " Date: " + String(date.dateByAddingTimeInterval(1*count*24*3600)).substringToIndex(index)+" "+weacell.weather_info!
		count++
		
		if let url = NSURL(string: "http://openweathermap.org/img/w/"+weacell.weather_icon!+".png") {
			if let data = NSData(contentsOfURL: url){
				cell.icon_wea.contentMode = UIViewContentMode.ScaleAspectFit
				
				cell.icon_wea.image = UIImage(data: data)
			}
		}
		
		cell.The_wea_info.textColor = UIColor.whiteColor()
		cell.The_tem_c.textColor = UIColor.whiteColor()
		
		
		return cell
	}
	
	
	
	
}


