import Charts
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
    @IBOutlet weak var chartView: LineChartView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
        setChartView()
    }
    
    // MARK: - Private Methods
    private func configureOnLoad() {
        self.backgroundColor = Color.backgroundViewColor
        progressView1.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        progressView2.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        progressView3.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        progressView4.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        awakeGraphProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        sleepGraphProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        deepSleepProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        sleepQualityProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 1, radius: 1)
        sleepQualityView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepQualityView.setCornerRadius(26, andClipContent: true)
        sleepStatusView1.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepStatusView1.setCornerRadius(26, andClipContent: true)
        sleepStatusView2.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        sleepStatusView2.setCornerRadius(26, andClipContent: true)
        graphContentView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        graphContentView.setCornerRadius(26, andClipContent: true)
        sleepQualityView.backgroundColor = Color.collectionItemBackgroundColor
        graphContentView.backgroundColor = Color.collectionItemBackgroundColor
        sleepStatusView1.backgroundColor = Color.collectionItemBackgroundColor
        sleepStatusView2.backgroundColor = Color.collectionItemBackgroundColor
    }
    
    private func setChartView() {
        chartView.highlightPerTapEnabled = true
        chartView.highlightPerDragEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.setScaleEnabled(false)
        chartView.doubleTapToZoomEnabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.xAxis.drawLabelsEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.legend.enabled = false
        chartView.chartDescription.enabled = false
        chartView.dragEnabled = true
        chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)
        let marker = BalloonMarker(color: .white,
                                   font: UIFont.setFontProximaNovaBold(ofSize: 9) ?? .systemFont(ofSize: 12),
                                   textColor: .black,
                                   insets: UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15))
        marker.chartView = chartView
        marker.chartView?.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        marker.minimumSize = CGSize(width: 65, height: 40)
        chartView.marker = marker
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
