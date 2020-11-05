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
            if subview.responds(to: Selector("textColor")) {
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
    
    public init(backgroundColor: UIColor, textColor: UIColor, sectionColor: UIColor, name: String) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.sectionColor = sectionColor
        self.name = name
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
    
    public static let allCrayons = grayCrayons + redCrayons + greenCrayons + blueCrayons
    
    public static let colorfulCrayons = redCrayons + greenCrayons + blueCrayons
    
    public static func crayons(at section: Int) -> [Crayon] {
        let schemes = sections[section]["Crayons"] as! [Crayon]
        return schemes
    }
    
    public static func sectionName(at section: Int) -> String {
        let name = sections[section]["SectionName"] as! String
        return name
    }
    
    public static func sectionColor(at section: Int) -> UIColor {
        let color = sections[section]["SectionColor"] as! UIColor
        return color
    }
    
    public static let sections = [
        ["Crayons": grayCrayons, "SectionColor": graySectionColor, "SectionName":"Gray Schemes"],
        ["Crayons": redCrayons, "SectionColor": redSectionColor, "SectionName":"Red Schemes"],
        ["Crayons": greenCrayons, "SectionColor": greenSectionColor, "SectionName":"Green Schemes"],
        ["Crayons": blueCrayons, "SectionColor": blueSectionColor, "SectionName":"Blue Schemes"]
    ]
    
    public static let grayCrayons = [licorice, lead, tungsten, iron, steel, tin, nickel, aluminum, magnesium, silver, mercury, snow]
    public static let graySectionColor = UIColor.iron
    
    public static let redCrayons = [cayenne, mocha, plum, maroon, maraschino, tangerine, lemon, magenta, strawberry, salmon, cantaloupe, banana, carnation]
    public static let redSectionColor = UIColor.maraschino
    
    public static let greenCrayons = [aspargus, fern, clover, moss, teal, lime, spring, seaFoam, honeydew, flora, spindrift ]
    public static let greenSectionColor = UIColor.moss
    
    public static let blueCrayons = [ocean, midnight, eggplant, turquoise, aqua, blueberry, grape, ice, sky, orchid, lavender]
    public static let blueSectionColor = UIColor.ocean
    
    // MARK: - Crayons
    
    static let cantaloupe = Crayon(backgroundColor: .cantaloupe, textColor: .white, sectionColor: .cantaloupe, name: "cantaloupe")
    static let honeydew =   Crayon(backgroundColor: .honeydew, textColor: .tungsten, sectionColor: .honeydew, name: "honeydew")
    static let spindrift =  Crayon(backgroundColor: .spindrift, textColor: .tungsten, sectionColor: .spindrift, name: "spindrift")
    static let sky =        Crayon(backgroundColor: .sky, textColor: .white, sectionColor: .sky, name: "sky")
    static let lavender =   Crayon(backgroundColor: .lavender, textColor: .white, sectionColor: .lavender, name: "lavender")
    static let carnation =  Crayon(backgroundColor: .carnation, textColor: .white, sectionColor: .carnation, name: "carnation")
    static let licorice =   Crayon(backgroundColor: .licorice, textColor: .white, sectionColor: .licorice, name: "licorice")
    static let snow =       Crayon(backgroundColor: .snow, textColor: .tungsten, sectionColor: .snow, name: "snow")
    static let salmon =     Crayon(backgroundColor: .salmon, textColor: .white, sectionColor: .salmon, name: "salmon")
    static let banana =     Crayon(backgroundColor: .banana, textColor: .tungsten, sectionColor: .banana, name: "banana")
    static let flora =      Crayon(backgroundColor: .flora, textColor: .tungsten, sectionColor: .flora, name: "flora")
    static let ice =        Crayon(backgroundColor: .ice, textColor: .tungsten, sectionColor: .ice, name: "ice")
    static let orchid =     Crayon(backgroundColor: .orchid, textColor: .white, sectionColor: .orchid, name: "orchid")
    static let bubblegum =  Crayon(backgroundColor: .bubblegum, textColor: .white, sectionColor: .bubblegum, name: "bubblegum")
    static let lead =       Crayon(backgroundColor: .lead, textColor: .white, sectionColor: .lead, name: "lead")
    static let mercury =    Crayon(backgroundColor: .mercury, textColor: .tungsten, sectionColor: .mercury, name: "mercury")
    static let tangerine =  Crayon(backgroundColor: .tangerine, textColor: .white, sectionColor: .tangerine, name: "tangerine")
    static let lime =       Crayon(backgroundColor: .lime, textColor: .tungsten, sectionColor: .lime, name: "lime")
    static let seaFoam =    Crayon(backgroundColor: .seaFoam, textColor: .tungsten, sectionColor: .seaFoam, name: "Sea Foam")
    static let aqua =       Crayon(backgroundColor: .aqua, textColor: .white, sectionColor: .aqua, name: "aqua")
    static let grape =      Crayon(backgroundColor: .grape, textColor: .white, sectionColor: .grape, name: "grape")
    static let strawberry = Crayon(backgroundColor: .strawberry, textColor: .white, sectionColor: .strawberry, name: "strawberry")
    static let tungsten =   Crayon(backgroundColor: .tungsten, textColor: .white, sectionColor: .tungsten, name: "tungsten")
    static let silver =     Crayon(backgroundColor: .silver, textColor: .tungsten, sectionColor: .silver, name: "silver")
    static let maraschino = Crayon(backgroundColor: .maraschino, textColor: .white, sectionColor: .maraschino, name: "maraschino")
    static let lemon =      Crayon(backgroundColor: .lemon, textColor: .tungsten, sectionColor: .lemon, name: "lemon")
    static let spring =     Crayon(backgroundColor: .spring, textColor: .tungsten, sectionColor: .spring, name: "spring")
    static let turquoise =  Crayon(backgroundColor: .turquoise, textColor: .tungsten, sectionColor: .turquoise, name: "turquoise")
    static let blueberry =  Crayon(backgroundColor: .blueberry, textColor: .white, sectionColor: .blueberry, name: "blueberry")
    static let magenta =    Crayon(backgroundColor: .magenta, textColor: .white, sectionColor: .magenta, name: "magenta")
    static let iron =       Crayon(backgroundColor: .iron, textColor: .white, sectionColor: .iron, name: "iron")
    static let magnesium =  Crayon(backgroundColor: .magnesium, textColor: .white, sectionColor: .magnesium, name: "magnesium")
    static let mocha =      Crayon(backgroundColor: .mocha, textColor: .white, sectionColor: .mocha, name: "mocha")
    static let fern =       Crayon(backgroundColor: .fern, textColor: .white, sectionColor: .fern, name: "fern")
    static let moss =       Crayon(backgroundColor: .moss, textColor: .white, sectionColor: .moss, name: "moss")
    static let ocean =      Crayon(backgroundColor: .ocean, textColor: .white, sectionColor: .ocean, name: "ocean")
    static let eggplant =   Crayon(backgroundColor: .eggplant, textColor: .white, sectionColor: .eggplant, name: "eggplant")
    static let maroon =     Crayon(backgroundColor: .maroon, textColor: .white, sectionColor: .maroon, name: "maroon")
    static let steel =      Crayon(backgroundColor: .steel, textColor: .white, sectionColor: .steel, name: "steel")
    static let aluminum =   Crayon(backgroundColor: .aluminum, textColor: .white, sectionColor: .aluminum, name: "aluminum")
    static let cayenne =    Crayon(backgroundColor: .cayenne, textColor: .white, sectionColor: .cayenne, name: "cayenne")
    static let aspargus =   Crayon(backgroundColor: .aspargus, textColor: .white, sectionColor: .aspargus, name: "aspargus")
    static let clover =     Crayon(backgroundColor: .clover, textColor: .white, sectionColor: .clover, name: "clover")
    static let teal =       Crayon(backgroundColor: .teal, textColor: .white, sectionColor: .teal, name: "teal")
    static let midnight =   Crayon(backgroundColor: .midnight, textColor: .white, sectionColor: .midnight, name: "midnight")
    static let plum =       Crayon(backgroundColor: .plum, textColor: .white, sectionColor: .plum, name: "plum")
    static let tin =        Crayon(backgroundColor: .tin, textColor: .white, sectionColor: .tin, name: "tin")
    static let nickel =     Crayon(backgroundColor: .nickel, textColor: .white, sectionColor: .nickel, name: "nickel")
}

#endif
