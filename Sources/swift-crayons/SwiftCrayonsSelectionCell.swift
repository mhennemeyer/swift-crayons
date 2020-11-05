import UIKit
import swift_toolbox

class SwiftCrayonsSelectionCell: UICollectionViewCell {
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    func configure(colorScheme: MHColorScheme) {
        backgroundColor = colorScheme.backgroundColor
        colorNameLabel.text = colorScheme.name
        colorNameLabel.textColor = colorScheme.textColor
    }
}
