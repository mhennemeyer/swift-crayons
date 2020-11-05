import Foundation

public struct SwiftCrayonsDefaults {
    static let store = UserDefaults.standard
    private static let crayonKey = "SwiftCrayonsDefaults.key"
    
    static var defaultCrayonName = "sky"
    
    public static var crayonName: String {
        get {
            store.string(forKey: crayonKey) ?? defaultCrayonName
        }
        
        set {
            store.set(newValue, forKey: crayonKey)
        }
    }
}
