//
//  City4CollectionViewCell.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/9/24.
//

import UIKit

class City4CollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designMainImage()
        designSubLabel()
        designMainLabel()
    }
    func designMainImage(){
 
        print("이미지 높이 : ", mainImageView.frame.size.height)
        mainImageView.clipsToBounds = true
        print("이미지 높이 : ", mainImageView.frame.size.height)
        print("이미지 넓이 : ", mainImageView.frame.size.width)
        mainImageView.backgroundColor = .lightGray
        
        mainImageView.contentMode = .scaleAspectFill
    }
    
    func designMainLabel() {
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 16, weight: .heavy)
    }
    func designSubLabel(){
        subLabel.font = .systemFont(ofSize: 12)
        subLabel.numberOfLines = 2
        subLabel.textColor = .gray
        subLabel.textAlignment = .center
    }
}
