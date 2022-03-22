import Foundation
import UIKit

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
        self.backgroundColor = Color.collectionItemBackgroundColor
        title.font = UIFont.setFontProximaNovaBold(ofSize: 18)
        descriptionLabel.font = UIFont.setFontProximaNovaRegular(ofSize: 14)
        circularProgressValue.font = UIFont.setFontProximaNovaBold(ofSize: 18)
        linearProgressView.setCornerRadius(4, andClipContent: true)
    }
    
    // MARK: - Internal Methods
    func setCellData(with model: SleepCategoryModel) {
        title.text = model.title
        descriptionLabel.text = model.description
        circularProgressValue.text = "\(model.totalHoursSlept)"
        circularProgressValue.textColor = model.progressColor
        circularProgressView.updateCircularProgressBarWith(totalHoursSlept: model.totalHoursSlept, totalHourToSleep: model.totalHoursToSleep, color: model.progressColor)
        linearProgressView.updateLinearProgressBarWith(totalHoursSlept: model.totalHoursSlept, totalHourToSleep: model.totalHoursToSleep, color: model.progressColor)
    }
}
