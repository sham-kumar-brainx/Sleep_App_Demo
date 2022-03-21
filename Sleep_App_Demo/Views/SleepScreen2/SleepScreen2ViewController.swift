import Charts
import Foundation

class SleepScreen2ViewController: BaseViewController, ChartViewDelegate {
    
    @IBOutlet var sleepScreen2View: SleepScreen2View!
    
    var numbers : [Double] = [100, 70, 90, 80, 60, 75, 25, 50, 60, 45, 90, 73, 65, 50, 100] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleepScreen2View.setProgressViews()
        updateGraph()
    }
   
    func updateGraph(){
        sleepScreen2View.chartView.delegate = self

        var lineChartEntry = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.

        //here is the for loop
        for i in 0..<numbers.count {

            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry

            lineChartEntry.append(value) // here we add it to the data set
        }

        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
        

//        line1.colors = [UIColor.blue] //Sets the colour to blue

        line1.drawValuesEnabled = false
        line1.drawCirclesEnabled = false
        line1.drawFilledEnabled =  true
        line1.fillColor = UIColor.blue
        line1.drawHorizontalHighlightIndicatorEnabled = false
        line1.drawVerticalHighlightIndicatorEnabled = false
        
        
        let data = LineChartData() //This is the object that will be added to the chart

        data.append(line1)
        
        sleepScreen2View.chartView.data = data //finally - it adds the chart data to the chart and causes an update

    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}
