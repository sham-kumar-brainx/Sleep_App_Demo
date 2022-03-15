import Foundation
import UIKit

enum AdherenceType {
    case circular
    case linear
}

class SleepCategoryCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var circularProgressView: CircularProgressBarView!
    @IBOutlet weak var circularProgressValue: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linearProgressView: ProgressBarView!
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
    }
    
    // MARK: - Private Methods
    private func configureOnLoad() {
        self.setCornerRadius(26)
        self.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        title.font = UIFont.setFontProximaNovaBold(ofSize: 18)
        descriptionLabel.font = UIFont.setFontProximaNovaRegular(ofSize: 14)
        circularProgressValue.font = UIFont.setFontProximaNovaBold(ofSize: 18)
        circularProgressView.addShadow(color: Color.lightBrownColor, alpha: 0.4, x: 0, y: 3, radius: 5)
        linearProgressView.setCornerRadius(4, andClipContent: true)
        
    }
    
    // MARK: - Internal Methods
    func setAdherence(_ value: Double, color: UIColor, forType type: AdherenceType) {
        let label: UILabel
        let circularProgressBar: CircularProgressBarView
        
        switch type {
        case .circular:
            label = circularProgressValue
            circularProgressBar = circularProgressView
        case .linear:
            return
        }
        
        label.text = "\(Int(value))"
        circularProgressBar.progress = CGFloat(value/100)
        circularProgressBar.fillColor = color
    }
}
