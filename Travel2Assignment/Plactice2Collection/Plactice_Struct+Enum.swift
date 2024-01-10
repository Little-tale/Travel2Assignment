
// 자 이번엔 구조체 + Enum을 해보자
import UIKit

enum CellofIdentifier: String {
    case travelCell = "CityInfoAppCollectionViewCell"
}
/*
 layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
 */
/*
 layout.sectionInset = UIEdgeInsets(top: virspacing, left: horSpacing, bottom: virspacing, right: horSpacing)
 */
/*
 layout.minimumLineSpacing = 16
 */

struct CityCollectionViewLayout {
    let screenSize: CGFloat
    let itemSize: CGSize
    let sectionInset: UIEdgeInsets
   
    let minLineSpacing: CGFloat
    let virtiCalSpacing: CGFloat = 16
    let horizenSpacing: CGFloat = 16
    
    let itemHeight: CGFloat = 250
    let minSpacing: CGFloat = 16
    let contentCount: CGFloat = 3
    
    // screenSize는 init에 안넣었었는데
    // 문제 발생했었음 아마 다 넣어야 해요 인듯
    init(screenWidth: CGFloat){
        screenSize = screenWidth
        let cellWidth = (screenWidth - (virtiCalSpacing * contentCount))
        self.itemSize = CGSize(width: cellWidth, height: itemHeight)
        self.sectionInset = UIEdgeInsets(top: horizenSpacing, left: virtiCalSpacing, bottom: horizenSpacing, right: virtiCalSpacing)
        self.minLineSpacing = 16
    }
    
    
    
}

