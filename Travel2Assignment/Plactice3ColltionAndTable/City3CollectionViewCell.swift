//
//  City3CollectionViewCell.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/9/24.
//

import UIKit

// 자 다시한번 생각해봐라
// UIB를 생성해서 이친구가 연결되어 있다.
// 일단은 아웃렛 연결

class City3CollectionViewCell: UICollectionViewCell {
    @IBOutlet var infoImageView: UIImageView!
    @IBOutlet var infoMainLabel: UILabel!
    @IBOutlet var infoSubLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designSubLabel()
        designMainLabel()
        designMainImageView()
    }
    
    func designSubLabel(){
        infoSubLabel.font = .systemFont(ofSize: 12)
        infoSubLabel.numberOfLines = 2
        infoSubLabel.textColor = .gray
        infoSubLabel.textAlignment = .center
    }
    
    func designMainLabel() {
        infoMainLabel.textAlignment = .center
        infoMainLabel.font = .systemFont(ofSize: 16, weight: .heavy)
    }
    
    func designMainImageView(){
        infoImageView.layer.cornerRadius = 70
        infoImageView.contentMode = .scaleAspectFill
    }
}
