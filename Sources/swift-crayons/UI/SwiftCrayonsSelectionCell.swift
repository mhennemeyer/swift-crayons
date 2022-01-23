#if !os(macOS)
import UIKit
import swift_toolbox

class SwiftCrayonsSelectionCell: UICollectionViewCell {
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    func configure(crayon: Crayon) {
        backgroundColor = crayon.backgroundColor
        colorNameLabel.text = crayon.name
        colorNameLabel.textColor = crayon.textColor
    }
}
#endif

