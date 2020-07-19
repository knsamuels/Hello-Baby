import CoreData
import Foundation

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HelloBaby")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("\(error.localizedDescription)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    static func saveToPersistentStore() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print( "There was an error in \(#function) : \(error) \(error.localizedDescription)")
            }
        }
    }
}

