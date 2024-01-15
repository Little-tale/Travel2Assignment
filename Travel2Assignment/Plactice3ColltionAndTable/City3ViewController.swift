//
//  City3ViewController.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/9/24.
//

import UIKit
import Kingfisher
/*
 UIViewContoller + CollectionView
 1. 아웃렛 연결 필요
    - 원래는 애플이 이름을 지어준 상태
    - 지금은 컬렉션 뷰룰 두개 이상 사용할 수 있어서 이름을 직접 지어주어야 합니다.
 2. 부하직원 등록 필요 UICollectionViewDelegate, UICollectionViewDataSource\
 
 3. XIB Register
    - 컬렉션뷰에 어떤 셀을 쓸지 뷰 디드로드 에서 등록하는 과정이 필요함
 
 4. 컬렉션 뷰와 부하 직원을 연결
    - 바보같이 컬렉션 뷰가 부하 직원을 찾지 못함..
 
 5. 컬렉션뷰 레이아웃 구현
 */
let infoList = CityInfo()

let xibCell = UINib(nibName: "City3CollectionViewCell", bundle: nil)

private let identi = "City3CollectionViewCell"

// 이제 아웃렛 연결을 하자
class City3ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    // 부하직원 이 ICollectionViewDelegate, UICollectionViewDataSource
    // 이 두명을 연결해
    // 프로토콜 구현해준다.
    
    // 셀몇개?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CityInfo.city.count
    }
    // 디자인은?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: City3CollectionViewCell.identi, for: indexPath) as! City3CollectionViewCell
       
        let indexItem = indexPath.item
        let infoCity = CityInfo.city[indexItem]
        
        // cell.backgroundColor = .gray
        
        // 이미지 넣기
        let url = URL(string: infoCity.city_image)
        cell.infoImageView.kf.setImage(with: url)
        
        // 텍스트 넣기
        let mainText = infoCity.city_name + " | " + infoCity.city_english_name
        cell.infoMainLabel.text = mainText
        cell.infoSubLabel.text = infoCity.city_explain
     
        return cell
    }
    
    
    
    @IBOutlet var City3CollectionView: UICollectionView!
    
    
    @IBOutlet var citySegmant: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // xib 레지스터 등록을 해주어야 한다
        // 그 두명이 찾아야함 이놈이 찾는게 아님 ㅜㅜㅜㅠ
        
        City3CollectionView.register(xibCell, forCellWithReuseIdentifier: City3CollectionViewCell.identi)
        
        // 이제 부하직원 2명 연결해 주어야 합니다.
        // UICollectionViewDelegate, UICollectionViewDataSource
        
        City3CollectionView.dataSource = self
        City3CollectionView.delegate = self
        
        // 이제 화면에 뜨실때, 레이아웃 잡아 드립시다.
        
        let layout = UICollectionViewFlowLayout()
        
        // 일단 화면 가져오기 키원드 -> 스크린 과 바운드
        let screenWidth = UIScreen.main.bounds.width
        let virSpacing: CGFloat = 24
        
        let cellWidth = screenWidth - (virSpacing * 3)
        let horSpacing: CGFloat = 12
        
        layout.sectionInset = UIEdgeInsets(top: horSpacing, left: virSpacing, bottom: horSpacing, right: virSpacing)
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: 250)
        
        City3CollectionView.collectionViewLayout = layout
    }
    

}
