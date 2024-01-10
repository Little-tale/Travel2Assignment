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
        // Initialization code
        designMainImage()
        designSubLabel()
        designMainLabel()
    }
    func designMainImage(){
        // 완벽한 원 구현 해보자
        // mainImageView.layer.cornerRadius = mainImageView.frame.width / 2
//        mainImageView.layer.cornerRadius = mainImageView.frame.size.width / 2
        print("이미지 높이 : ", mainImageView.frame.size.height)
        mainImageView.clipsToBounds = true
        print("이미지 높이 : ", mainImageView.frame.size.height)
        print("이미지 넓이 : ", mainImageView.frame.size.width)
        mainImageView.backgroundColor = .lightGray
        //let squareNum = mainImageView.frame.size.width / 2 / 1.4
        // 213이 어떻게 나오지
        // let screenSize = UIScreen.main.bounds.width
        // print(screenSize)
        // print(squareNum)
        // print("자신 사이즈 윋드 : ",self.frame.size.width)
        
        
        // mainImageView.layer.cornerRadius = squareNum
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
