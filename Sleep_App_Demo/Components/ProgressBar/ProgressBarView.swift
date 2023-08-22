import UIKit

enum ProgressBarStyle {
    
    // MARK: - Enum cases
    case rounded
    case square
}

class ProgressBarView: UIView {
    
    // MARK: - Private Properties
    private var progressBarColor: UIColor = Color.filledHorizentalProgressBar
    var progressBackgroundColor: UIColor = Color.emptyHorizentalProgressBar
    var style: ProgressBarStyle = .rounded
    var progress: Double = 0.0
    
    // MARK: - Outlets
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var progressWidthCnst: NSLayoutConstraint!
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Private Methods
    private func commonInit() {
        guard let contentView = self.loadFromNib() else {
            fatalError("Failed to load nib")
        }
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.backgroundColor = Color.backgroundViewColor
        progressBarView.backgroundColor = progressBarColor
        guard style == .rounded else { return }
        let height = contentView.bounds.height
        progressBarView.setCornerRadius(height / 2)
    }
    
    // MARK: - Internal Methods
    func updateLinearProgressBarWith(totalHoursSlept: Float, totalHourToSleep: Float, color: UIColor) {
        progressBarView.backgroundColor = color
        progress = CGFloat(totalHoursSlept / totalHourToSleep)
        progressWidthCnst = progressWidthCnst.changeMultiplier(multiplier: CGFloat(progress))
        progressWidthCnst.isActive = true
    }
}
