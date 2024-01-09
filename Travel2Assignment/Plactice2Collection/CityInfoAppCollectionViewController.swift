
import UIKit
import Kingfisher

let infoCityList = CityInfo()

private let Identi = "CityInfoAppCollectionViewCell"

// 시작하기에 앞서 이번에는 셀부분을
// 독립적으로 관리하기위해서 XIB를 생성하겼기 때문에
// Xib를 연결해줄 필요가 있다.
// 오늘 배웠듯이 부하 직원 두명이 필요 하기 때문에
// 더욱 집중해서 공부해 보자.

// 1. XiB 파일을 가져와 보자
let xib = UINib(nibName: "CityInfoAppCollectionViewCell", bundle: nil)

// 1.0 -> 진짜 이것 때문에 울었다....
    // xib를 가져왔으면 UICollectionViewDataSource와 UICollectionViewDelegate 프로토콜을 구현해 주어야 한다.
// 아까는 fix 나와서 자동으로 생성해 주었는데 즨장 안나온다.
class CityInfoAppCollectionViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1-1
        // xiv를 생성했으면 그것을 연결해 주어야 한다.
        // 등록시켜주자 register
        collectionView.register(xib, forCellWithReuseIdentifier: Identi)
        
        // 1-2
        // xiv 를 등록 시켜 주었다면
        // 부하 직원을 고용해 연결해 주어야 합니다.
        
        
        // 2-3 레이아웃 디자인
         // 플로우 레이아웃 객체 생성
        let layout = UICollectionViewFlowLayout()
        // 레이아웃 아이템 사이즈 정하기
        // 이번에는 화면 크기를 받아와 거기서 2등분 처리를 해보려고 합니다.
        let screenWidth = UIScreen.main.bounds.width
        // let screenHeigh = UIScreen.main.bounds.height
        
        // 수직
        let virspacing: CGFloat = 16
        // 수평
        let horSpacing: CGFloat = 16
        
        let cellWidth = screenWidth - (virspacing * 3)
        // let cellHeight = screenHeigh - (horSpacing * 5)
        
        let itemWidth = cellWidth / 2
        let itemHeight: CGFloat = 250
        
        print("스크린 길이", screenWidth)
        print("셀 길이 : ",cellWidth)
        
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        // 수평으로 할건지 수직으로 할건지
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: virspacing, left: horSpacing, bottom: virspacing, right: horSpacing)
        layout.minimumLineSpacing = 16
        collectionView.collectionViewLayout = layout
        
    }
    // 2. 콜렉션뷰를 생성하기에 필수 조건
    // 2-1. 셀은 몇개인가? -> 아이템 개수는 몇개냐?
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 셀보다는 아이템에 더 가까울것 같다 셀은 뭔가 줄에 가까워 보인다.
        // 즉 아이템 개수는 몇개냐?
        // 리스트의 속 자료들의 개수만큼 유동적
        return infoCityList.city.count
    }
    
    // 2-2. 셀의 디자인은?
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 참고로 아이덴디 파이는 보안을 신경쓰셔야 한다고 하셨다.
        // 그래서 위에서 프라이베이트를 통해 해결해 보도록 하겠다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identi , for: indexPath) as! CityInfoAppCollectionViewCell
        // print(cell)
        // cell.backgroundColor = .green
        
        let url = URL(string: infoCityList.city[indexPath.item].city_image)
        
        cell.infoImageView.kf.setImage(with: url)
         
        let mainText = infoCityList.city[indexPath.item].city_name + " | " + infoCityList.city[indexPath.item].city_english_name
        
        cell.infoMainLabel.text = mainText
       
        
        cell.infoSubLabel.text = infoCityList.city[indexPath.item].city_explain
       
        return cell
        
    }
    
}
