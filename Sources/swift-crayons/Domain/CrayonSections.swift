import UIKit

extension Crayon {
    public static let allCrayons = grayCrayons + redCrayons + greenCrayons + blueCrayons
    
    public static let lightCrayons = allLightCrayons
    
    public static let allLightCrayons = [
        cayenneLight, mochaLight, plumLight, maroonLight, maraschinoLight, tangerineLight, lemonLight, magentaLight, strawberryLight, salmonLight, cantaloupe, bananaLight, carnationLight
    ]
    
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
}
