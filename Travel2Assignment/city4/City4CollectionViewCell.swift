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
        let imageLayer = ImageViewConerRadius(uiImageView: mainImageView)
        designMainImage()
        designSubLabel()
        designMainLabel()
        designImageConerRadius(imagelayer: imageLayer)
    }
    
    
}


extension City4CollectionViewCell : CityCollectionCellDesign {
    
    func designMainImage(){
 
        print("이미지 높이 : ", mainImageView.frame.size.height)
        mainImageView.clipsToBounds = true
        print("이미지 높이 : ", mainImageView.frame.size.height)
        print("이미지 넓이 : ", mainImageView.frame.size.width)
        mainImageView.backgroundColor = .lightGray
        
        mainImageView.contentMode = .scaleAspectFill
    }
    // 알아보니 레이아웃이 변경될때마다 호출되는 함수로 이미지
    // 코너 레디우스를 해결할수 있을것 같다.
    override func layoutSubviews() {
        super.layoutSubviews()
       let imageLayer = ImageViewConerRadius(uiImageView: mainImageView)
        designImageConerRadius(imagelayer: imageLayer)
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
    
    func designImageConerRadius(imagelayer: ImageViewConerRadius){
        print(imagelayer.conerRadius)
        mainImageView.layer.cornerRadius = imagelayer.conerRadius
        // 벗어나는걸 막기
        mainImageView.clipsToBounds = true
    }
    
    
    
}
