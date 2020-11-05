import UIKit

class SwiftCrayonsSelectCell: UICollectionViewCell {

    func configure(colorName: String, color: UIColor, selected: Bool = false) {
        backgroundColor = color
    }
}
