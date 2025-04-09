//
//  CountryListTableViewCell.swift
//  SunilPracticalAvdevs
//
//  Created by sunil prajapati on 09/04/25.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    @IBOutlet weak var lblCapital: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
