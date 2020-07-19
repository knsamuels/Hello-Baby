import CoreData
import Foundation

protocol NursingTimerDelegate: AnyObject {
    func timerSecondTicked()
    func timerStopped()
}

class NursingTimer {
    
    var isActive: Bool = false
    var timePassed: Double? = 0
    var timeCounter: Timer? = nil
    
    init () {
    }
    
    weak var delegate: NursingTimerDelegate?
    
    func startTimer(time: TimeInterval) {
        if !isActive {
            timePassed = time
            timeCounter = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
                self.secondTicked()
            }
        }
    }
    func stopTimer() {
        delegate?.timerStopped()
    }
    
    private func secondTicked()  {
        guard let timePassed = timePassed else { return }
        if timePassed > 0 {
            self.timePassed = timePassed + 1
            delegate?.timerSecondTicked()
        } else {
            self.timePassed = nil
            timeCounter?.invalidate()
        }
    }
}

