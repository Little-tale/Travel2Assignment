//
//  City4InfoViewController.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/11/24.
//

import UIKit
import Kingfisher

/*
 struct Travel{
     var title: String?
     var description: String?
     var travel_image: String?
     var grade: Double?
     var save: Double?
     var like: Bool?
     var ad: Bool?
 }
 */

// 별점 은 우짤까.. 흠....
enum starEnum: String{
    case harf = "star.leadinghalf.filled"
    case full = "star.fill"
    case none = "star"
}

let travelStruct = TravelInfo()

class City4InfoViewController: UIViewController {
    @IBOutlet var CityInfo_TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designNaviItem()
        // 레지스터 등록
        let cityInfoxib = UINib(nibName: "City4TouristTableViewCell", bundle: nil)
        let cityAD = UINib(nibName: "City4_AD_TableViewCell", bundle: nil)
        
        
        CityInfo_TableView.register(cityInfoxib, forCellReuseIdentifier: "City4TouristTableViewCell")
        
        CityInfo_TableView.register(cityAD, forCellReuseIdentifier: "City4_AD_TableViewCell")
        
        CityInfo_TableView.delegate = self
        CityInfo_TableView.dataSource = self
        
        
        
    }
    
}



// MARK: - 네비게이션 영역
extension City4InfoViewController {
    // City4View 컨에서 네비까지 넣어준것으로 보인다.
    // 여기서 바로 쓸수 있을까?
    
    // 뷰 디드로드로 가져가야 한다. 함수로 전환
    // 예상은 화면을 그리기도전에 처리는 안하나 봄
    func designNaviItem(){
        navigationItem.title = "도시상세 정보"
       designBackButton()
    }
    // 사진 찾기 너무 힘들어서
    // 심볼 5를 설치했다...!
    func designBackButton() {
        // 이미지만 바꿔주었다 메서드 연결은 필요없다.
               //navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: .none, action: .none)
        
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "lessthan")
        // 이거 안됨
        navigationItem.leftBarButtonItem?.tintColor = .black
        // 이거도 안됨
        navigationItem.titleView?.tintColor = .black
        
        navigationController?.navigationBar.tintColor = .black
        
        //let backButton = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action:#selector(backButtonTapped) )
        //backButton.tintColor = .black  // 색상 변경
        
        //self.navigationItem.leftBarButtonItem = backButton
        
        // self.navigationItem.leftBarButtonItem?.image = UIImage(systemName: "lessthan")
        
        
        // 아 증말 두개가 동시에 안떠 왜냐구
        
        // 원래 뒤로가기 버튼이 저렇게 떳나? 과제 다하고 알아보기
    }
    
    @objc func backButtonTapped() {
            // 네비게이션 컨트롤러를 통해 이전 화면으로 돌아가기
            self.navigationController?.popViewController(animated: true)
        }
    
}




// MARK: - 뒤로가는 기능 구현
// 아니 생각해 보니까 이미 있음 나 바보인가봐


// MARK: - Table뷰 세팅
extension City4InfoViewController :UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelStruct.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if travelStruct.travel[indexPath.row].ad ?? false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "City4_AD_TableViewCell", for: indexPath) as! City4_AD_TableViewCell
            
            designAdTestLabel(uiLabel: cell.adTextLabel, indexPath: indexPath)
            
            designAdLabel(uiLabel: cell.adLogoLabel, indexPath: indexPath)
            
            // 선택.효과 제거
            cell.selectionStyle = .none
            
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "City4TouristTableViewCell", for: indexPath) as! City4TouristTableViewCell
            
            designCityNameLabel(uiLabel: cell.ciTyNameLabel, indexPath: indexPath)
            designCityInfoLabel(uiLabel:cell.CityInfoLabel, indexPath: indexPath)
            designCitySaveLabel(uiLabel:cell.city4_SaveLabel , indexPath: indexPath)
            designCityImage(uiImageView: cell.cityImageView, indexPath: indexPath)
            desingLikeImage(uiImageView: cell.cityLikeImageView , indexPath: indexPath)
            
            // 진짜 컨텐츠만 눌렀다 꺼지게 해보자
            
            return cell
        }
        
       
        
        
        // MARK: - 화면전환 구현
      
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travelStruct.travel[indexPath.row].ad ?? false{
            return 100
        }else {
            return 150
        }
        
    }
    
    // MARK: !!!!  셀 클릭시 !!!! 효과제거
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travelStruct.travel[indexPath.row].ad ?? false {
            print("Test ")
            clickedAdCell()
        }else {
            clickedInfoCell()
        }
        
        
        // 선택 셀 효과 제거
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - 글씨 넣어주는 + 디자인 라인
extension City4InfoViewController {
    func designCityNameLabel(uiLabel : UILabel, indexPath : IndexPath) {
        uiLabel.text = travelStruct.travel[indexPath.row].title
        
        uiLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    func designCityInfoLabel(uiLabel : UILabel, indexPath : IndexPath) {
        uiLabel.text = travelStruct.travel[indexPath.row].description
            
        uiLabel.font = UIFont.systemFont(ofSize: 12)
        uiLabel.textColor = .gray
        
    }
    func designCitySaveLabel(uiLabel : UILabel, indexPath : IndexPath) {
        if let saveText = travelStruct.travel[indexPath.row].save {
            uiLabel.text = "(3) - 저장 \(saveText)"
        }else {
            print("세이브 텍스트 통과")
            uiLabel.text = ""
        }
        uiLabel.textColor = .systemGray2
        uiLabel.font = .systemFont(ofSize: 10)
    }
    
    func designCityImage(uiImageView: UIImageView, indexPath: IndexPath) {
        let url = URL(string: travelStruct.travel[indexPath.row].travel_image ?? "")
        
        uiImageView.kf.setImage(with: url)
        
        uiImageView.contentMode = .scaleAspectFill
        
        uiImageView.clipsToBounds = true
        uiImageView.layer.cornerRadius = 12
        // print(#function)
    }
    func desingLikeImage(uiImageView: UIImageView, indexPath: IndexPath){
        
        if travelStruct.travel[indexPath.row].like ?? false {
            uiImageView.image = UIImage(systemName: "heart")
            uiImageView.tintColor = .white
        }else {
            uiImageView.image = UIImage(systemName: "heart.fill")
            uiImageView.tintColor = .systemPink
        }
        
        
        // uiImageView.showsLargeContentViewer = true
    }
    
    func designStarScoew() {

    }

}


// MARK: - 광고 글자 디자인 라인

extension City4InfoViewController {
    func designAdTestLabel(uiLabel : UILabel, indexPath : IndexPath) {
        uiLabel.text = travelStruct.travel[indexPath.row].title
        
        uiLabel.textColor = .black
        
        uiLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    func designAdLabel(uiLabel : UILabel, indexPath : IndexPath) {
        
        uiLabel.backgroundColor = .white
        uiLabel.clipsToBounds = true
        uiLabel.layer.cornerRadius = 8
        uiLabel.font = UIFont.systemFont(ofSize: 12)
    }
}



extension City4InfoViewController {
    
    // 1. 스토리 보드 찾아준다.
    // 2. 스토리 보드 안에 뷰를 찾아준다
    // 2-1 만약 푸시 팝이라면 네비게이션 달아주어야한다.
    // 왜냐하면 뒤로가기 버튼이 생겨서? 일듯 하다.
    // 3. 연결할 방식을 정한다.
    func clickedInfoCell(){
        let touristAttractionSB = UIStoryboard(name: "TouristAttracionStoryBoard", bundle: nil)
        
        let touristVC = touristAttractionSB.instantiateViewController(withIdentifier:"TouristAttractionViewController")
        
        navigationController?.pushViewController(touristVC, animated: true)
        
        
    }
    
    func clickedAdCell() {
        let adStoyBoard = UIStoryboard(
            name: "ADStoryboard", bundle: nil)
        
        // 와 진짜.... as! 이거 왜,.....
        // 이거 없다고 아무것도 안하는게 참 마음이 아프다.
        // 이게 문제였다
        let adViewCon = adStoyBoard.instantiateViewController(withIdentifier: "ADViewController") as! ADViewController
        
       
        // 네비게이션 생성 및 설정
        let adViewNavi = UINavigationController(rootViewController: adViewCon)
        adViewNavi.modalPresentationStyle = .fullScreen
        
        // 좌측 버튼 생성
            // 일단 액션은 닐로 해보고
        let uiBarButton = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(goBack) )
        
        //adViewNavi.navigationItem.leftBarButtonItem = uiBarButton
        // 안되네..?
        // 셀프로 테스트 하니 잘 나온다.
        // self.navigationItem.leftBarButtonItem = uiBarButton
        uiBarButton.tintColor = .red
        
        adViewCon.navigationItem.leftBarButtonItem = uiBarButton
        
        
        present(adViewNavi, animated: true)
    }
    
    @objc func goBack() {
        // 선물은 지금이야~ 프레센토와 디스미스 ~
        self.dismiss(animated: true)
    }

    
}
