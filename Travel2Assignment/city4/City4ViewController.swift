import UIKit
import Kingfisher

private let identy = CityCollectionIdentifier.City.rawValue
let cityList = CityInfo()
//  let segment = citySegment.

// 아이덴티를 달라는건 아님
// 정확히는 xib 파일 이름입니다.
let xibCity4 = UINib(nibName: identy, bundle: nil)

// 이동시켜주려면 일단 스토리 보드를 연결해야 할것 같다.
// 클릭 감지로 한번 해볼까?


class City4ViewController: UIViewController {
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var segmenteCity: UISegmentedControl!
    
    // 잠깐씩 담아둘 리스트
    var filterList: [City] = []
    
    // 콜렉션 뷰 컨의 필수? -> 레이아웃.
    override func viewDidLoad() {
        super.viewDidLoad()
        // 레지스터 등록
        cityCollectionView.register(xibCity4, forCellWithReuseIdentifier: identy)
        
        // 부하직원들아 니들을 구현해준게 나야~!
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        // 아오 이건 다지인 구조체를 이용한 프로토콜 구현
        designCityLayout(collectioView: cityCollectionView)
 
        // 앱 화면 띄울때 전체 넣어놈
        filterList = cityList.city
        // print(filterList)
        
        
    }
    
    @IBAction func segmentChangedValue(_ sender: UISegmentedControl) {

        print(sender.selectedSegmentIndex)
        
        let segment = citySegment(rawValue: sender.selectedSegmentIndex) // ! 붙이면 none 없어짐
        
        var filteringList: [City] = []
        
        for item in cityList.city {
            switch segment {
            case .every: filteringList.append(item)
            case .korea: if item.domestic_travel {filteringList.append(item)}
            case .foreigner : if !item.domestic_travel {filteringList.append(item)}
            case .none:// 이거 citySegment 가 Optional 이라 그럼
                return
            }
            
        }
        
        filterList.removeAll()
        filterList = filteringList
        print(filteringList)
        cityCollectionView.reloadData()
    }
    

}



// Inheritance from non-protocol type 'UIViewController'
// 와 진짜 개패고 싶다 이미 상속 받고 있어서 필요가 없어
extension City4ViewController: UICollectionViewDataSource {
    
    // 셀(아이템) 개수는 몇개실까요?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterList.count //cityList.city.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀(아이템) 디자인은 우짜실까요?
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identy, for: indexPath) as! City4CollectionViewCell
            
            let city = filterList
            
            let url = URL(string: city[indexPath.item ].city_image )
            cell.mainImageView.kf.setImage(with: url)
        
            cell.mainLabel.text = "\(city[indexPath.item].city_name) | \(city[indexPath.item].city_english_name)"
            
            cell.subLabel.text = city[indexPath.item].city_explain
            
            return cell
    }
}

extension City4ViewController: UICollectionViewDelegate {
    // 이놈은 하는게 뭐였을까
}

extension City4ViewController: CityCollectionDesign {
    
    func designCityLayout(collectioView: UICollectionView) {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        let structLayout = CityCellLayout(screenWidth: screenWidth)
        
        layout.itemSize = structLayout.itemSize
        layout.sectionInset = structLayout.sectionInset
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
        
    }
}



// MARK: - 클릭감지
extension City4ViewController {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        // 1번 스토리 보드를 찾아준다.
        let city4InfoSB = UIStoryboard(name: "City4InfoStoryBoard", bundle: nil)
        // 2번 해당 안에 뷰 컨트롤러를 찾아준다.
        let city4VC = city4InfoSB.instantiateViewController(withIdentifier: "City4InfoViewController") as! City4InfoViewController
        // 3번 전환 방식 지정한다.
        // 단 Push방식을 채택하였기 때문에
        // 네비게이션을 넣어준다.
        //let city4Nav = city4VC.navigationController.
        
        // 네비게이션이 필요한 이유는
        // 내생각이지만, 뒤로가기 버튼이 생겨서로
        // 판단된다.
        city4VC.modalPresentationStyle = .automatic
        
        navigationController?.pushViewController(city4VC, animated: true)
        
        // 4번 다시 전환방식을 지정한다.
        
        return true
    }
    
}

