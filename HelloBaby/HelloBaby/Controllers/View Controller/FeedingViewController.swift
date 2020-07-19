import CoreData
import UIKit

class FeedingViewController: UIViewController {
    
    @IBOutlet weak var feedingTypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var nursingContainerView: UIView!
    @IBOutlet weak var bottleContainerView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setVisibility(index: feedingTypeSegmentedControl.selectedSegmentIndex, animated: false)
    }
    
    func setVisibility(index: Int, animated: Bool) {
        if index == 0 {
            UIView.animate(withDuration: animated ? 0.5 : 0) {
                self.nursingContainerView.alpha = 1
                self.bottleContainerView.alpha = 0
            }
        } else if index == 1 {
            UIView.animate(withDuration: animated ? 0.5 : 0) {
                self.nursingContainerView.alpha = 0
                self.bottleContainerView.alpha = 1
            }
        }
    }
    
    // Mark- Both
    @IBAction func feddingTypeValueChanged(_ sender: UISegmentedControl) {
        setVisibility(index: sender.selectedSegmentIndex, animated: true)
    }
}
