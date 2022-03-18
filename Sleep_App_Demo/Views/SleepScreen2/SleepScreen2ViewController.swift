import Foundation

class SleepScreen2ViewController: BaseViewController {
    
    @IBOutlet var sleepScreen2View: SleepScreen2View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleepScreen2View.setProgressViews()
    }
}
