//
//  TravelCollectionViewController.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/9/24.
//

import UIKit
import Kingfisher
// 연습을 위해 시티 인포 인스턴스를 생성한다.
let cityInfo = CityInfo()
// 구조체를 만들어서 셀 사이즈 해볼꺼임


// private let reuseIdentifier = "Cell"
private let reuseIdentifier = "TravelCollectionViewCell"

class TravelCollectionViewController: UICollectionViewController {
    
    func layoutFor(layOut: UICollectionViewFlowLayout) -> UICollectionViewFlowLayout {
        let screenWidth = UIScreen.main.bounds.width
        let cellSizeFor = CellSizeForCity(screenWidth: screenWidth)
        
        // 셀 너비 계산 (화면 너비의 절반에서 좌우 중간 여백을 뺌 )
        let cellWidth = (screenWidth - (cellSizeFor.right * 3)) / 2
        let cellHeight = cellSizeFor.height

        print(cellWidth)
        
        layOut.itemSize = CGSize(width: cellWidth, height: cellHeight)

        // 섹션의 상하좌우 여백 설정
        layOut.sectionInset = UIEdgeInsets(top: cellSizeFor.top, left: cellSizeFor.left, bottom: cellSizeFor.bottom, right: cellSizeFor.right)
        
        // 셀 간  최소 수평 간격
        layOut.minimumInteritemSpacing = cellSizeFor.horSpacing
        // 셀 간 최소 수직 간격
        layOut.minimumLineSpacing = cellSizeFor.virticalSpacing

        // 스크롤 방향 설정 수직으로
        layOut.scrollDirection = .vertical
        
        return layOut
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // 컬렉션뷰 아이템 레이아웃 잡기
        let layout = UICollectionViewFlowLayout()
        
        collectionView.collectionViewLayout = layoutFor(layOut: layout)
    }
    

 
    // 섹션은 몇개?
   
    // 셀은 몇개?
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // print(cityInfo.city.count) // 15
        return CityInfo.city.count
    }
    // 셀 디자인?
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TravelCollectionViewController
        // TravelCollectionViewCell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TravelCollectionViewCell
    
        // 테스트를 위해 파랑으로 일단 해놓는다
        // cell.backgroundColor = .green
        
        // 셀 이미지를 넣어본다. KingFisher 를 이용해 보겠어
        let url = URL(string: CityInfo.city[indexPath.item].city_image)
        // print(cell.imageView)
        cell.imageView.kf.setImage(with: url)
        //cell.imageView.clipsToBounds = true
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.layer.cornerRadius = 70
        
        cell.mainLabel.textAlignment = .center
        cell.subLabel.textAlignment = .center
        
        let text = CityInfo.city[indexPath.item].city_name + " | " + CityInfo.city[indexPath.item].city_english_name
        
        cell.mainLabel.text = text
        cell.subLabel.text = CityInfo.city[indexPath.item].city_explain
        
        cell.mainLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        cell.subLabel.font = .systemFont(ofSize: 12)
        
        cell.subLabel.textColor = .gray
        
        cell.subLabel.numberOfLines = 2
        return cell
    }

}









