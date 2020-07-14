import CoreData
import UIKit

class FeedingViewController: UIViewController {
    
    var coreDataStack: CoreDataStack! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataStack = CoreDataStack.shared
    }
    
    @IBAction func finishFeedingButtonTapped(_ sender: UIButton) {
        
        let feeding = Feeding(context: coreDataStack.managedObjectContext)
        feeding.volume = 4
        
        coreDataStack.saveContext()
    }
    
    @IBOutlet weak var feedingTypeSegmentedControl: UISegmentedControl!
}
