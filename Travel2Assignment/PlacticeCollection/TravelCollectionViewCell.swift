//
//  TravelCollectionViewCell.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/9/24.
//

import UIKit

class TravelCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    // 알아봐
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
    }
}
