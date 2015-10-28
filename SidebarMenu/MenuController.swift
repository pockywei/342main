//
//  MenuController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
	
	@IBOutlet weak var transpancy: UIImageView!
	@IBOutlet weak var thetitle_user: UILabel!
	
	@IBAction func logout(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			
			navigationController!.popViewControllerAnimated(true)
		} else {
			
			dismissViewControllerAnimated(true, completion: nil)
			
		}
		
	}
	//var role_play = Player()
	let user = User.sharedInstance
	//var referee = Referee()
	var aUid:String?
    override func viewDidLoad() {
        super.viewDidLoad()

		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 0, 380, 700)
		self.view.addSubview(bluredEffectView)
		self.view.sendSubviewToBack(bluredEffectView)
		
		        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ceystalhorizon")!)
		//print(referee.username)
		thetitle_user.text = "Hi " + user.name
		print(self.user.userId)
	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    // MARK: - Table view data source

/*
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}

	
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
		if indexPath.row == 0 {
			cell.textLabel?.text = "Hi"+"Player"
			
		
		}
		else if indexPath.row == 1 {
			cell.textLabel?.text = "Home"
			cell.imageView?.image = UIImage(named: "news")
		
		}
		else if indexPath.row == 2 {
		
			cell.textLabel?.text = "My team"
			cell.imageView?.image = UIImage(named: "map")
		
		}
		else if indexPath.row == 3 {
		
			cell.textLabel?.text = "Profile"
			cell.imageView?.image = UIImage(named: "photo")
		
		
		}
		



        return cell
    }
	
	
	override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
	{
		if indexPath.row == 1
		{
			print("Segue1")
			self.performSegueWithIdentifier("Match", sender: self)
		}
		else if indexPath.row == 2
		{
			print("Segue2")
			self.performSegueWithIdentifier("Team", sender: self)
		}
		else if indexPath.row == 3
		{
			print("Segue3")
			self.performSegueWithIdentifier("Profile", sender: self)
		}
		
	}
	*/
	
	
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
