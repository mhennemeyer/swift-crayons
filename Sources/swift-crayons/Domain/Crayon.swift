#if !os(macOS)
import UIKit

public class Crayon {
    
    public static var currentCrayon: Crayon {
        crayonBy(name: SwiftCrayonsDefaults.crayonName)
    }
    
    public static var primaryColor: UIColor {
        currentCrayon.backgroundColor
    }
    
    public static var primaryDarkerColor: UIColor {
        primaryColor.darker()
    }
    
    public static var secondaryColor: UIColor {
        currentCrayon.textColor
    }
    
    public static var tertiaryColor: UIColor {
        currentCrayon.backgroundColor.withAlphaComponent(0.7)
    }
    
    public static var sectionColor: UIColor {
        currentCrayon.sectionColor
    }
    
    public static var okColor: UIColor {
        // TODO
        currentCrayon.sectionColor
    }
    
    public static var warnColor: UIColor {
        // TODO
        currentCrayon.sectionColor
    }
    
    public static var grayishColor: UIColor {
        // TODO
        currentCrayon.sectionColor
    }
    
    public static func colorize(cell: UITableViewCell) {
        cell.backgroundColor = primaryColor
        cell.tintColor = secondaryColor
        cell.allSubviews.forEach { subview in
            guard subview.tag != 999 else { return }
            if subview.responds(to: Selector(("textColor"))) {
                subview.setValue(secondaryColor, forKey: "textColor")
            }
            //subview.tintColor = secondaryColor
        }
    }
    
    public static func colorize(bar: UINavigationBar?) {
        guard let bar = bar else { return }
        bar.barTintColor = primaryColor
        bar.tintColor = secondaryColor
        bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : secondaryColor]
    }
    
    public static func colorize(view: UIView?) {
        guard let view = view else { return }
        view.backgroundColor = primaryDarkerColor
        view.tintColor = secondaryColor
    }
    
    public static func fullColorize(view: UIView?) {
        guard let view = view else { return }
        view.backgroundColor = primaryDarkerColor
        view.tintColor = secondaryColor
        view.allSubviews.forEach { subview in
            guard subview.tag == 999 else { return }
            fullColorize(view: subview)
        }
    }
    
    public var backgroundColor: UIColor
    public var textColor: UIColor
    public var sectionColor: UIColor
    public var name: String
    public var scheme: CrayonScheme
    
    public init(
        backgroundColor: UIColor,
        textColor: UIColor,
        sectionColor: UIColor,
        name: String,
        scheme: CrayonScheme
    ) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.sectionColor = sectionColor
        self.name = name
        self.scheme = scheme
    }
    
    // MARK: - Coding
    
    enum CodingKeys: String, CodingKey {
        case backgroundColor
        case textColor
        case sectionColor
        case name
    }
    
    // MARK: - Equatable
    
    public static func ==(lhs: Crayon, rhs: Crayon) -> Bool {
        return lhs.name == rhs.name
    }
    
    // MARK: - Access
    
    public static func crayonBy(name: String) -> Crayon {
        for scheme in allCrayons {
            if scheme.name == name {
                return scheme
            }
        }
        fatalError()
    }
}

#endif
