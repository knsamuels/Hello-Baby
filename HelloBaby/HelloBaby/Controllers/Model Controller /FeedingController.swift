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
    
    func createFeeding(volume: Double, date: Date, isBottleFeeding: Bool, duration: Double) {
        Feeding(volume: volume, date: date, isBottleFeeding: isBottleFeeding, duration: duration)
        CoreDataStack.saveToPersistentStore()
    }
    
    func update(feeding: Feeding, volume: Double, date: Date, duration: Double) {
        feeding.volume = volume
        feeding.date = date
        feeding.duration = NSNumber(value: duration)
        CoreDataStack.saveToPersistentStore()
    }
   
    func deleteFeeding(feeding: Feeding) {
        CoreDataStack.context.delete(feeding)
        CoreDataStack.saveToPersistentStore()
    }
}
