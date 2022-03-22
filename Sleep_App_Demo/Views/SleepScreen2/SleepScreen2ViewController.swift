import Charts
import Foundation

class SleepScreen2ViewController: BaseViewController, ChartViewDelegate {
    // MARK: - Outlets
    @IBOutlet var sleepScreen2View: SleepScreen2View!
    
    // MARK: - Private Properties
    private var numbers : [Double] = [100, 70, 90, 80, 60, 75, 25, 50, 60, 45, 90, 73, 65, 50, 100]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        sleepScreen2View.setProgressViews()
        updateGraph()
    }
   
    // MARK: - Internal Methods
    func updateGraph(){
        sleepScreen2View.chartView.delegate = self
        var lineChartEntry = [ChartDataEntry]()
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            lineChartEntry.append(value)
        }
        let setOne = LineChartDataSet(entries: lineChartEntry, label: "Number")
        setOne.drawValuesEnabled = false
        setOne.drawCirclesEnabled = false
        setOne.drawFilledEnabled =  true
        setOne.fillColor = UIColor.blue
        setOne.drawHorizontalHighlightIndicatorEnabled = false
        setOne.drawVerticalHighlightIndicatorEnabled = false
        let data = LineChartData()
        data.append(setOne)
        sleepScreen2View.chartView.data = data
    }
}
