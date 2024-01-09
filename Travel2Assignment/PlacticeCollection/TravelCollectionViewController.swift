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

// private let reuseIdentifier = "Cell"
private let reuseIdentifier = "TravelCollectionViewCell"

class TravelCollectionViewController: UICollectionViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

       // 컬렉션뷰는 레지스터 과정이 필요해 보인다.
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // 이때 위에 있는 코드를 통해 할경우 문제가 발생한다.
        
        // XIB 없을땐 하지마세요
        
        // self.collectionView!.register(TravelCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // 컬렉션뷰는 레이아웃을 잡아줘야 할것 같다.
        // 이건 쉽게 하는거라고 한다...
        let layout = UICollectionViewFlowLayout()
        
        // 셀(아이템) 사이즈
        layout.itemSize = CGSize(width: 150, height: 250)
        // 셀 상하좌우 여백
        layout.sectionInset = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        // 수평으로 할건지 수직으로 할건지
        layout.scrollDirection = .vertical
        
        // 레이아웃을 짜주었으면 레이아웃을 넣어줘야 한다.
        collectionView.collectionViewLayout = layout
        
        // 시티 정보 테스트
        print(cityInfo)
        print(cityInfo.city)
        // print(cityInfo.city.first)
    }

 
    // 섹션은 몇개?
   
    // 셀은 몇개?
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(cityInfo.city.count) // 15
        return cityInfo.city.count
    }
    // 셀 디자인?
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TravelCollectionViewController
        // TravelCollectionViewCell
        print(type(of: TravelCollectionViewCell.self))
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TravelCollectionViewCell
    
        // 테스트를 위해 파랑으로 일단 해놓는다
        // cell.backgroundColor = .green
        
        // 셀 이미지를 넣어본다. KingFisher 를 이용해 보겠어
        let url = URL(string: cityInfo.city[indexPath.item].city_image)
        // print(cell.imageView)
        cell.imageView.kf.setImage(with: url)
        //cell.imageView.clipsToBounds = true
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.layer.cornerRadius = 70
        
        cell.mainLabel.textAlignment = .center
        cell.subLabel.textAlignment = .center
        
        let text = cityInfo.city[indexPath.item].city_name + " | " + cityInfo.city[indexPath.item].city_english_name
        
        cell.mainLabel.text = text
        cell.subLabel.text = cityInfo.city[indexPath.item].city_explain
        
        cell.mainLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        cell.subLabel.font = .systemFont(ofSize: 12)
        
        cell.subLabel.textColor = .gray
        
        cell.subLabel.numberOfLines = 2
        return cell
    }
    // 셀 높이?
    
    
    // 레이아웃으로 해결해야함


}
