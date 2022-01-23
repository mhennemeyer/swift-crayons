import Foundation
import swift_toolbox

protocol SwiftCrayonsViewController {
    var navigationTitle: String { get }
    var sectionsCount: Int { get }
    func itemsCount(for section: Int) -> Int
    var selectedColorName: String { get }
    func colorName(for index: Int, section: Int) -> String
}

extension SwiftCrayonsViewController {
    var navigationTitle: String {
        "Color scheme"
    }
    
    var sectionsCount: Int { 3 }
    
    func itemsCount(for section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return Crayon.lightCrayons.count
        case 2:
            return Crayon.allCrayons.count
        default:
            return Crayon.allCrayons.count
        }
    }
    
    func colorName(for index: Int, section: Int) -> String {
        switch section {
        case 1:
            return Crayon.lightCrayons[index].name
        case 2:
            return Crayon.allCrayons[index].name
        default:
            return Crayon.allCrayons[index].name
        }
    }
    
    var selectedColorName: String {
        SwiftCrayonsDefaults.crayonName
    }
}
