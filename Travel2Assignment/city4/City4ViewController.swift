// 미해결 적는란 -> 이미지 크기에 따라 원을 주고 싶은데 안됨
// -> 
//
// 필터링 하는데 리스트 길이는 변화됨
// 문제는 글씨랑 이미지를 어떻게 변하게 해야 하냐는 거임


// 모두 누를떄는 모두 나오면 되고
// 국내를 누르면 국내만 나오고
// 해외를 누르면 해외만 나오게 하고 싶다.
/*
 struct City {
     var city_name: String
     var city_english_name: String
     var city_explain: String
     var city_image: String
     var domestic_travel: Bool
 }
 */

// domestic_travel 이걸 이용하라..? 혹시 히든 먹나?
// is Hidden 해봤자 진짜로 공간은 두고 없어짐

import UIKit
import Kingfisher

private let identy = "City4CollectionViewCell"
let cityList = CityInfo()

// 아이덴티를 달라는건 아님
// 정확히는 xib 파일 이름입니다.
let xibCity4 = UINib(nibName: identy, bundle: nil)

// 1. 아웃렛 연결 ( 컬렉션 뷰 )
// 2. 부하직원 고용 UICollectionViewDelegate,UICollectionViewDataSource
// 3. 부하직원 프로토콜 구현
// 4. xib Register을 통해 등록해줘야..
// 5. 부하직원들이 나(구현해준 놈)를 찾아야...

class City4ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var segmenteCity: UISegmentedControl!
    
    // 잠깐씩 담아둘 리스트
    var filterList: [City] = []
    
    // 콜렉션 뷰 컨의 필수? -> 레이아웃.
    
    // 셀(아이템) 개수는 몇개실까요?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // 이부분도 수정 오버됨
        return filterList.count //cityList.city.count
    }
    // 셀(아이템) 디자인은 우짜실까요?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identy, for: indexPath) as! City4CollectionViewCell
        
        // 필터링 한후에는 이걸 주석해야 도
        //let city = cityList.city
        let city = filterList
        
        //cell.backgroundColor = .black
        let url = URL(string: city[indexPath.item ].city_image )
        cell.mainImageView.kf.setImage(with: url)
        
        
        let mainText = city[indexPath.item].city_name + " | " + city[indexPath.item].city_english_name
        cell.mainLabel.text = mainText
        
        cell.subLabel.text = city[indexPath.item].city_explain
        // isHidden 테스트
//        if indexPath.item == 1 {
//            cell.isHidden = true
//        }
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 레지스터 등록
        cityCollectionView.register(xibCity4, forCellWithReuseIdentifier: identy)
        
        // 부하직원들아 니들을 구현해준게 나야~!
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        // 콜렉션 뷰 레이어 쉽게 해주는 친구
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // 아이템 셀 함수화
        designItemCell(CollectionLayOut: layout)
 
        // 앱 화면 띄울때 전체 넣어놈
        filterList = cityList.city
        print(filterList)
        
    }
    
    func designItemCell(CollectionLayOut: UICollectionViewFlowLayout) {
        // 스크린 넓이 얻고
        let screenWidth = UIScreen.main.bounds.width
        let virticalSpacing: CGFloat = 24
        let contentCount: CGFloat = 2
        
        // 최소한의 간격 (아이템간)
        CollectionLayOut.minimumLineSpacing = 8
        
        // 콘텐츠가 2개 라면 좌 중 우 총 3개의 여백이 생긴다. 즉
        let totalSpaing = virticalSpacing * (contentCount + 1)
        // 아이탬의 넓이는 화면에서 전체 여백을 빼고 컨텐트 개수만큼 나누면 나온다
        let cellWidth = (screenWidth -  totalSpaing) / contentCount
        
        let cellHeight:CGFloat = 260
        let horSpacing:CGFloat = 16
        CollectionLayOut.itemSize = CGSize(width: cellWidth, height: cellHeight)
        CollectionLayOut.sectionInset = UIEdgeInsets(top: horSpacing, left: virticalSpacing, bottom: horSpacing, right: virticalSpacing)
       

        cityCollectionView.collectionViewLayout = CollectionLayOut
    }
    @IBAction func segmentChangedValue(_ sender: UISegmentedControl) {
//        print(segmenteCity)
//        print(segmenteCity.selectedSegmentIndex.self)
//        print(segmenteCity.numberOfSegments)
//        print(segmenteCity.isEnabled)
        
        // 국내 일떄, ? , 1, 3, True
        // 해외 일때, ? , 2, 3, true
        // 모두 일때, ? , 0, 3, true
        
//        print(segmenteCity.isEnabledForSegment(at: 0))
//        print(segmenteCity.isEnabledForSegment(at: 1))
//        print(segmenteCity.isEnabledForSegment(at: 2))
        
        // 쓰레기 같은 코드 였음 저건 활성화 상태임
        
//        switch segmenteCity.selectedSegmentIndex.self {
//        case 0 : 
//        default:
//            <#code#>
//        }
        // sender.selectedSegmentIndex 이놈이 선택된 값들 보여주네
        print(sender.selectedSegmentIndex)
        
        var filteringList: [City] = []
        
        for item in cityList.city {
            switch sender.selectedSegmentIndex {
            case 0 : filteringList.append(item)
            case 1 : if item.domestic_travel == true {
                filteringList.append(item)
                }
            case 2 : if item.domestic_travel == false {
                filteringList.append(item)
                }
            default : break
            }
        }
        filterList.removeAll()
        filterList = filteringList
        print(filteringList)
        cityCollectionView.reloadData()
    }
    

}
