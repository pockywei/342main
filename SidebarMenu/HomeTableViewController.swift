//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
	let user = User.sharedInstance
	var id:String?
	var Matchlist = [Match]()
	var hometeamID = [Int]()
	
	@IBOutlet weak var indecate: UIActivityIndicatorView!
	
	
	let apibaseurl = "http://csci342.azurewebsites.net/api/matchApi/"
    override func viewDidLoad() {
        super.viewDidLoad()
		indecate.startAnimating()
		getRemoteData()
		
		
		
		//let IMG = UIImage(named: "horse")
		
		
		
		
		
			
		
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

	func getRemoteData() {
		let url = NSURL(string: apibaseurl + user.userId)
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
			print("hello")
			//if let list = json as? NSArray {
				//for (var i = 0; i < list.count; i++) {
					if let dataBlock = json as? NSDictionary {
						print("hello2")
						//print(dataBlock["myUpcommingReferee"])
						if let myUpcommingReferee = dataBlock["myUpcommingReferee"] as? NSArray
						{
							//if let list = json as? NSArray {
								for (var i = 0; i < myUpcommingReferee.count; i++) {
									if let matchdetail = myUpcommingReferee[i] as? NSDictionary {
										print(matchdetail)
										Matchlist.append(Match(data: matchdetail))
										if let homeid = matchdetail["teamAId"] as? Int
										{
											hometeamID.append(homeid)
										}
										
										print(Matchlist[Matchlist.count-1])
									}
									else
									{
										print("no data of match")
									}
								}
							
							user.hometeamid = hometeamID
							
							print(user.hometeamid)
							//}
							
							indecate.stopAnimating()
							
							
							//print(myUpcommingReferee)
						}
						else{
							var tField: UITextField!
							
							indecate.stopAnimating()
							
							indecate.hidden=true
							
							func handleCancel(alertView: UIAlertAction!)
							{
								print("Cancelled !!")
							}
							var alert = UIAlertController(title: "No upcoming match", message: "", preferredStyle: UIAlertControllerStyle.Alert)
							
							
							alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:handleCancel))
							self.presentViewController(alert, animated: true, completion: {
								print("completion block")
							})
							
							print("no data")
						}
						//records.append(tableCellData(data: dataBlock))
						//print(records[records.count-1])
					}
				//}
			//}
		}
		refershTable()
	}
	
	func refershTable() {
		dispatch_async(dispatch_get_main_queue(), {
			self.indecate.hidden=true
			self.tableView.reloadData()
			return
		})
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Matchlist.count
	}

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HomeTableViewCell

		
		let matchcell = Matchlist[indexPath.row]
		
		cell.postImageView.image = UIImage(named: "horse")
		
		let index=Matchlist[indexPath.row].matchDate.startIndex.advancedBy(11)
		
		let index2=Matchlist[indexPath.row].matchDate.startIndex.advancedBy(10)
		
		var time = ""
		var date = ""
		
		date = Matchlist[indexPath.row].matchDate.substringToIndex(index2)
		time = Matchlist[indexPath.row].matchDate.substringFromIndex(index)
		
		cell.postTitleLabel.text = "The game Date: " + date + "               The time is: " + time
		cell.authorLabel.text = "Tournament: " + Matchlist[indexPath.row].TournamentName
		cell.sport.text = "location: "+Matchlist[indexPath.row].location
		cell.authorImageView.image = UIImage(named: "TM2")

		
        // Configure the cell...
//        if indexPath.row == 0 {
//            cell.postImageView.image = UIImage(named: "horse")
//            cell.postTitleLabel.text = "This game after 2 days"
//            cell.authorLabel.text = "Wollongong Team"
//			cell.sport.text = "location: "+"Wollongong"
//            cell.authorImageView.image = UIImage(named: "author")
//
//        } else if indexPath.row == 1 {
//            cell.postImageView.image = UIImage(named: "AFL_Logo_Clings_Carlton")
//            cell.postTitleLabel.text = "This game after 3 days"
//            cell.authorLabel.text = "AFL Carlton"
//			cell.sport.text = "location: "+"SYD"
//            cell.authorImageView.image = UIImage(named: "appcoda-300")
//            
//        } else {
//            cell.postImageView.image = UIImage(named: "AFL_Logo_Clings_Hawthorn")
//            cell.postTitleLabel.text = "This game after 4 days"
//            cell.authorLabel.text = "Hawthorn"
//			cell.sport.text = "location: "+"SYD"
//            cell.authorImageView.image = UIImage(named: "appcoda-300")
//            
//        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
		print("Show_team_detail")
		if segue.identifier == "Show_Detail_Match" {
			print("Show_team_detail")
			let view = segue.destinationViewController as! UINavigationController
			let matchDetailViewController = view.topViewController as! Match_detailController
			
			if let selectedMealCell = sender as? UITableViewCell {
				let indexPath = tableView.indexPathForCell(selectedMealCell)!
				//if(searchActive){
				let selectedMeal = Matchlist[indexPath.row]
				matchDetailViewController.match = selectedMeal
				
				
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

extension NSDate
{
	convenience
	init(dateString:String) {
		let dateStringFormatter = NSDateFormatter()
		dateStringFormatter.dateFormat = "yyyy-MM-dd"
		dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
		let d = dateStringFormatter.dateFromString(dateString)!
		self.init(timeInterval:0, sinceDate:d)
	}
}
