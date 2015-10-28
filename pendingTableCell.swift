//
//  pendingTableCell.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/24.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation



class pendingTableCell:UITableViewCell{


	@IBOutlet weak var OfferDate: UILabel!
	@IBOutlet weak var Accept_button: UIImageView!
	


	override func awakeFromNib() {
		super.awakeFromNib()
		
		// Initialization code
		
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}



}