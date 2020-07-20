import UIKit

class NursingViewController: UIViewController {

    //Mark- Outlets
    
    @IBOutlet weak var leftSideButton: UIButton!
    @IBOutlet weak var rightSideButton: UIButton!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightSideButton.setTitleColor(.gray, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startButton.isHidden = false
        pauseButton.isHidden = true
        stopButton.isHidden = true
        
    }
    
    var timer: Timer? = nil

    var isLeftSide = true

// Mark- Actions
    @IBAction func leftSideButtonTapped(_ sender: UIButton) {
        leftSideButton.setTitleColor(.blue, for: .normal)
        rightSideButton.setTitleColor(.gray, for: .normal)
        isLeftSide = true
    }
    
    @IBAction func rightSideButtonTapped(_ sender: UIButton) {
        leftSideButton.setTitleColor(.gray, for: .normal)
        rightSideButton.setTitleColor(.blue, for: .normal)
        isLeftSide = false
    }
    
    var timerSeconds = 0
    var timerMinutes = 0

    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timerSeconds = 0
        timerMinutes = 1
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.incrementTime()
        }
        startButton.isHidden = true
        pauseButton.isHidden = false
        stopButton.isHidden = false
        stopButton.isEnabled = false
    }
    
    func incrementTime() {
        self.timerSeconds += 1
        if self.timerSeconds == 60 {
            self.timerMinutes += 1
            self.timerSeconds = 0
        }
        let secondsString = self.timerSeconds < 10 ? "0\(self.timerSeconds)" : "\(self.timerSeconds)"
        self.secondLabel.text = secondsString
        
        let minuteString = self.timerMinutes < 10 ? "0\(self.timerMinutes)" : "\(self.timerMinutes)"
        self.minuteLabel.text = minuteString
        
        if timerMinutes > 0 {
//            self.stopButton.setTitleColor(.systemBlue, for: .normal)
            stopButton.isEnabled = true
        }
    }
    
    var isPaused = false
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if isPaused {
            pauseButton.setTitle("Pause", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.incrementTime()
            }
            isPaused = false
        } else {
            pauseButton.setTitle("Resume", for: .normal)
            timer?.invalidate()
            isPaused = true
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        FeedingController.shared.createFeeding(volume: 0, date: Date(), isBottleFeeding: false, duration: Double(timerMinutes * 60 + timerSeconds), isLeftSide: isLeftSide)
            timer?.invalidate()
        minuteLabel.text = "00"
        secondLabel.text = "00"
    }
}
