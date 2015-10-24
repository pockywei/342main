//
//  OfferCell.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/23.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation




class OfferCell:UITableViewCell{

	@IBOutlet weak var Tournament: UILabel!
	@IBOutlet weak var Offer_date: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		
		// Initialization code
		
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}



}