//
//  CityInfoAppCollectionViewCell.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/9/24.
//

import UIKit

class CityInfoAppCollectionViewCell: UICollectionViewCell {
// 이제부턴 XIB 를 생성해서 작업할 것이다.
    // 지금 내가 너무 부족해서 코드 복붙은 금물이다.
    
    // 1. xib에서 생성한 객체(?)들을 가져온다.
    @IBOutlet var infoImageView: UIImageView!
    @IBOutlet var infoMainLabel: UILabel!
    @IBOutlet var infoSubLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // infoImageView.backgroundColor = .blue
        designInfoSubLabel()
        designMainLabel()
        designImageView()
    }
    
    func designInfoSubLabel(){
        infoSubLabel.font = .systemFont(ofSize: 12)
        infoSubLabel.textColor = .gray
        infoSubLabel.textAlignment = .center
        infoSubLabel.numberOfLines = 2
    }
    func designMainLabel() {
        infoMainLabel.textAlignment = .center
       infoMainLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
    }
    
    func designImageView(){
        infoImageView.contentMode = .scaleAspectFill
        
        let width = infoImageView.frame.size.width
        print(width)
        infoImageView.layer.cornerRadius = 70
       
    }

}
