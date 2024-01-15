
import UIKit
import Kingfisher

let infoCityList = CityInfo()

private let identy = CellofIdentifier.travelCell.rawValue

let xib = UINib(nibName: identy, bundle: nil)

class CityInfoAppCollectionViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.register(xib, forCellWithReuseIdentifier: identy)
       
        let layout = UICollectionViewFlowLayout()
        let ScreenSize  = UIScreen.main.bounds.width
        
        // 구조체에서 왼만하면 수행하게 했는데
        // 이게 맞냐? XX아 넌 진짜 더 열심히 해야해
        let CityLayOut = CityCollectionViewLayout(screenWidth: ScreenSize)
        
        layout.itemSize = CityLayOut.itemSize
        layout.scrollDirection = .vertical
        
        layout.sectionInset = CityLayOut.sectionInset
        layout.minimumLineSpacing = CityLayOut.minLineSpacing
        collectionView.collectionViewLayout = layout
        
    }
    // 아이템 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CityInfo.city.count
    }
    
    // 2-2. 셀의 디자인은?
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identy , for: indexPath) as! CityInfoAppCollectionViewCell

        let url = URL(string: CityInfo.city[indexPath.item].city_image)
        
        cell.infoImageView.kf.setImage(with: url)
         
        let mainText = CityInfo.city[indexPath.item].city_name + " | " + CityInfo.city[indexPath.item].city_english_name
        
        cell.infoMainLabel.text = mainText
               
        cell.infoSubLabel.text = CityInfo.city[indexPath.item].city_explain
       
        return cell
        
    }
    
}
