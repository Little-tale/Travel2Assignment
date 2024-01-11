//
//  City4_AD_TableViewCell.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/11/24.
//

import UIKit

class City4_AD_TableViewCell: UITableViewCell {
    @IBOutlet var adTextLabel: UILabel!
    @IBOutlet var adLogoLabel: UILabel!
    @IBOutlet var adBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adBackgroundView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: .random(in: 0...1))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      

    }
    
}
