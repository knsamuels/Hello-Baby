import Foundation
import CoreData

class FeedingController {
    static let shared = FeedingController()
    
    var fetchedResultsControler: NSFetchedResultsController<Feeding>
    
    init () {
        let fetchRequest: NSFetchRequest<Feeding> = Feeding.fetchRequest()
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.fetchedResultsControler = resultsController
        
        do {
            try fetchedResultsControler.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createFeeding(volume: Double, date: Date, isBottleFeeding: Bool, duration: Double, isLeftSide: Bool) {
        Feeding(volume: volume, date: date, isBottleFeeding: isBottleFeeding, isLeftSide: isLeftSide, duration: duration)
        CoreDataStack.saveToPersistentStore()
    }
    
    func update(feeding: Feeding, volume: Double, date: Date, duration: Double, isLeftSide: Bool) {
        feeding.volume = volume
        feeding.date = date
        feeding.isLeftSide = isLeftSide
        feeding.duration = NSNumber(value: duration)
        
        CoreDataStack.saveToPersistentStore()
    }
   
    func deleteFeeding(feeding: Feeding) {
        CoreDataStack.context.delete(feeding)
        CoreDataStack.saveToPersistentStore()
    }
}
