//
//  Identifiers.swift
//  Travel2Assignment
//
//  Created by Jae hyung Kim on 1/15/24.
//

import UIKit
//City4CollectionViewCell
enum storyBoardName: String {
    case City4Info = "City4InfoStoryBoard"
}


extension UICollectionView {
    static var identi: String {
        return String(describing: self)
    }
}
extension UICollectionViewCell {
    static var identi: String {
        return String(describing: self)
    }
}

extension UIViewController {
    static var identi: String {
        return String(describing: self)
    }
}
