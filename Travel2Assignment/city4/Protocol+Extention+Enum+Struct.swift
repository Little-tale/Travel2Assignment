// 자 여기에 다시 정리해보자
// Enum은 내가볼땐, 타입의 안정성 위주임
// Struct 는 관련 데이터 그룹임
// Extension은 아직 내가 느끼기엔 코드 분리 가독성 임
// 프로토콜은 가이드 책 느낌임
import UIKit

enum CityCollectionIdentifier: String {
    case City = "City4CollectionViewCell"
}

struct CityCellLayout {
    // 고정적인거 넣어야 겠어
    let cellHeight : CGFloat = 260
    
    let horSpacing: CGFloat = 16
    let virticalSpacing: CGFloat = 24
    let minSpacing: CGFloat = 8
    let contentCount:CGFloat = 2
    
    let cellWidth : CGFloat //
    let screenWidth : CGFloat //
    
    let itemSize: CGSize //
    let sectionInset: UIEdgeInsets //
    let totalSpacing: CGFloat //
    
    
    init(screenWidth: CGFloat ) {
        self.screenWidth = screenWidth
        totalSpacing = virticalSpacing * (contentCount + 1)
        cellWidth = (screenWidth - totalSpacing) / contentCount
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        sectionInset = UIEdgeInsets(top: horSpacing, left: virticalSpacing, bottom: horSpacing, right: virticalSpacing)
    }
}


struct ImageViewConerRadius {
    // 안보이게 되려나?
    private var imageWidth: Double
    
    // var conerRadius: CGFloat
    
    // 이렇게 하면 읽기 전용으로만 가능하다고 한다.
    var conerRadius:CGFloat {
        return imageWidth / 2
    }
    
    init(uiImageView : UIImageView){
        imageWidth = uiImageView.frame.size.width
    }
}

protocol CityCollectionDesign {
    func designCityLayout( collectioView: UICollectionView)
}

protocol CityCollectionCellDesign {
    func designMainImage()
    func designMainLabel()
    func designSubLabel()
    func designImageConerRadius(imagelayer: ImageViewConerRadius)
}
