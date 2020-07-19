import CoreData
import UIKit

class FeedingViewController: UIViewController {
    
    @IBOutlet weak var addFeedingButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var feedingTypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    
    var isBottleFeeding: Bool = true
    var minutes = 0
    var seconds = 0
    var timer = NursingTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        let shapeLayer = CAShapeLayer()
        //
        //        let center = view.center
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        //        shapeLayer.path = circularPath.cgPath
        //
        //        shapeLayer.strokeColor = UIColor.systemPink.cgColor
        //        shapeLayer.lineWidth = 10
        //
        //
        //        view.layer.addSublayer(shapeLayer)
        //
        //        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
    }
    //Mark: Nursing 
    
    @IBAction func leftSideButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func rightSideButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if timer.isActive {
            timer.stopTimer()
        }
        
    }
    
    // Mark- Bottle Feeding
    @IBAction func volumeSliderMoved(_ sender: UISlider) {
        volumeLabel.text = String((sender.value * 20).rounded()/2)
    }
    
    @IBAction func finishFeedingButtonTapped(_ sender: UIButton) {
        guard let volume = volumeLabel.text else {fatalError()}
        guard let newVolume = Double(volume) else {fatalError()}
        FeedingController.shared.createFeeding(volume: newVolume, date: Date(), isBottleFeeding: isBottleFeeding, duration: 0.0)
    }
    
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
    //switch sender.selectedSegmentIndex {
    //        case 0:
    //            self.feedingType = .nursing
    //        case 1:
    //            self.feedingType = .bottleFed
    //        default:
    //            break
    //        }
    
}

//extension FeedingViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//}
