import Foundation
import UIKit

class SleepScreen2View: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var progressView1: CircularProgressBarView!
    @IBOutlet weak var progressView2: CircularProgressBarView!
    @IBOutlet weak var progressView3: CircularProgressBarView!
    @IBOutlet weak var progressView4: CircularProgressBarView!
    @IBOutlet weak var progressView1Value: UILabel!
    @IBOutlet weak var progressView2Value: UILabel!
    @IBOutlet weak var progressView3Value: UILabel!
    @IBOutlet weak var progressView4Value: UILabel!
    @IBOutlet weak var sleepQualityView: UIView!
    @IBOutlet weak var sleepQualityProgressView: CircularProgressBarView!
    @IBOutlet weak var sleepQualityProgressValue: UILabel!
    @IBOutlet weak var sleepStatusView1: UIView!
    @IBOutlet weak var sleepStatusView2: UIView!
    @IBOutlet weak var graphContentView: UIView!
    @IBOutlet weak var awakeGraphProgressView: CircularProgressBarView!
    @IBOutlet weak var sleepGraphProgressView: CircularProgressBarView!
    @IBOutlet weak var deepSleepProgressView: CircularProgressBarView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
    }
    
    // MARK: - Private Methods
    private func configureOnLoad() {
        self.backgroundColor = Color.lightBrownTypeColor
        progressView1.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        progressView2.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        progressView3.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        progressView4.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        awakeGraphProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepGraphProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        deepSleepProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepQualityProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepQualityView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepQualityView.setCornerRadius(26, andClipContent: true)
        sleepStatusView1.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepStatusView1.setCornerRadius(26, andClipContent: true)
        sleepStatusView2.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepStatusView2.setCornerRadius(26, andClipContent: true)
        graphContentView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        graphContentView.setCornerRadius(26, andClipContent: true)
    }
    
    // Mark: - Internal Methods
    func setProgressViews() {
        progressView1.updateCircularProgressBarWith(totalHoursSlept: 7, totalHourToSleep: 8, color: Color.lightSkyTypeColor)
        progressView1Value.textColor = Color.lightSkyTypeColor
        progressView2.updateCircularProgressBarWith(totalHoursSlept: 5, totalHourToSleep: 8, color: Color.lightGreenColor)
        progressView2Value.textColor = Color.lightGreenColor
        progressView3.updateCircularProgressBarWith(totalHoursSlept: 3, totalHourToSleep: 8, color: Color.lightBrownColor)
        progressView3Value.textColor = Color.lightBrownColor
        progressView4.updateCircularProgressBarWith(totalHoursSlept: 6, totalHourToSleep: 8, color: Color.lightBlueTypeColor)
        progressView4Value.textColor = Color.lightBlueTypeColor
        sleepQualityProgressView.updateCircularProgressBarWith(totalHoursSlept: 6, totalHourToSleep: 8, color: Color.lightBlueTypeColor)
        sleepQualityProgressValue.textColor = Color.lightBlueTypeColor
        awakeGraphProgressView.updateCircularProgressBarWith(totalHoursSlept: 3, totalHourToSleep: 8, color: Color.lightSkyTypeColor, width: 4)
        sleepGraphProgressView.updateCircularProgressBarWith(totalHoursSlept: 5, totalHourToSleep: 8, color: Color.lightGreenColor, width: 4)
        deepSleepProgressView.updateCircularProgressBarWith(totalHoursSlept: 6, totalHourToSleep: 8, color: Color.lightBlueTypeColor, width: 4)
    }
}
