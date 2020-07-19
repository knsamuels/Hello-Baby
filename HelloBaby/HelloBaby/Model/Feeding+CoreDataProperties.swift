import Foundation
import CoreData

extension Feeding {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feeding> {
        return NSFetchRequest<Feeding>(entityName: "Feeding")
    }

    @NSManaged public var date: Date?
    @NSManaged public var duration: NSNumber?
    @NSManaged public var isBottleFeeding: Bool
    @NSManaged public var volume: Double
    @NSManaged public var isLeftSide: Bool
}
