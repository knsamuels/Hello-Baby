import Foundation
import CoreData


extension Feeding {
    @discardableResult
    convenience init(volume: Double, date: Date, isBottleFeeding: Bool, duration: Double) {
        self.init(context: CoreDataStack.context)
        self.volume = volume
        self.date = date
        self.isBottleFeeding = isBottleFeeding
        self.duration = NSNumber(value: duration)
    }
}
