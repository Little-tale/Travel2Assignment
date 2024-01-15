//
//  City4TouristTableViewCell.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/11/24.
//

import UIKit


class City4TouristTableViewCell: UITableViewCell {
    @IBOutlet var ciTyNameLabel: UILabel!
    @IBOutlet var CityInfoLabel: UILabel!
    @IBOutlet var starStackView: UIStackView!
    @IBOutlet var city4_SaveLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityLikeImageView: UIImageView!
      
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
