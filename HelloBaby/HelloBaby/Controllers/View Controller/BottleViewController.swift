import UIKit

class BottleViewController: UIViewController {
    //Outlets
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        volume = 0
    }
    
    var volume: Double = 0
    
    func setNewVolume(to newVolume: Double) {
        volume = newVolume
        volumeLabel.text = "\(volume) ounces"
    }
    //MARK: Actions
    @IBAction func addFeedingTapped(_ sender: UIButton) {
        FeedingController.shared.createFeeding(volume: volume, date: Date(), isBottleFeeding: true, duration: 0)
    }
    @IBAction func volumeSliderValueDidChange(_ sender: UISlider) {
        let newVolumeValue = (Double(sender.value) * 20).rounded() / 2
        setNewVolume(to: newVolumeValue)
    }
}
