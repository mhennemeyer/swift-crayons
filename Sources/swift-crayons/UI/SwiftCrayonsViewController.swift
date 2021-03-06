import Foundation
import swift_toolbox

protocol SwiftCrayonsViewController {
    var navigationTitle: String { get }
    var sectionsCount: Int { get }
    func itemsCount(for section: Int) -> Int
    var selectedColorName: String { get }
    func colorName(for index: Int) -> String
}

extension SwiftCrayonsViewController {
    var navigationTitle: String {
        "Color scheme"
    }
    
    var sectionsCount: Int { 2 }
    
    func itemsCount(for section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return Crayon.allCrayons.count
        }
    }
    
    func colorName(for index: Int) -> String {
        Crayon.allCrayons[index].name
    }
    
    var selectedColorName: String {
        SwiftCrayonsDefaults.crayonName
    }
}
