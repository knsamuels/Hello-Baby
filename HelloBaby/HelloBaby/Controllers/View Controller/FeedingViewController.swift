import CoreData
import UIKit

class FeedingViewController: UIViewController {
    
    @IBOutlet weak var feedingTypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var nursingContainerView: UIView!
    @IBOutlet weak var bottleContainerView: UIView!
    
    // Mark- Both
    @IBAction func feddingTypeValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5) {
                self.nursingContainerView.alpha = 1
                self.bottleContainerView.alpha = 0
            }
            
        } else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.5) {
                self.nursingContainerView.alpha = 0
                self.bottleContainerView.alpha = 1
            }
        }
    }
}
