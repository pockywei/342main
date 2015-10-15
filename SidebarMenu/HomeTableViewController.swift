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
	
	var Matchlist = [Match]()
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		let date_temp=NSDate(dateString:"2014-06-06")
		
		let IMG = UIImage(named: "horse")
		let IMG2 = UIImage(named: "AFL_Logo_Clings_Carlton")
		
		
		
			let Matchs = Match(Matchdate: date_temp, location: "Wollongong", hometeam: "XXX team", awayteam: "Wollongong teamA", img_of_teamA: IMG!, img_of_teamB: IMG2!, tournament: "NSW")
		
		
			Matchlist.append(Matchs)
			Matchlist.append(Matchs)
			Matchlist.append(Matchs)
		
		
			
		
		
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
		
		cell.postImageView.image = matchcell.img_of_teamA
		cell.postTitleLabel.text = "This game after 2 days"
		cell.authorLabel.text = "Wollongong Team"
		cell.sport.text = "location: "+matchcell.location!
		cell.authorImageView.image = matchcell.img_of_teamA
		
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
