import UIKit

class WeekDaysCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var dayOfMonth: UILabel!
    @IBOutlet weak var dayOfWeek: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        dayOfMonth.font = UIFont.setFontProximaNovaBold(ofSize: 18)
        dayOfWeek.font = UIFont.setFontProximaNovaMedium(ofSize: 12)
        self.setCornerRadius(16)
        self.addShadow(color: Color.lightBrownColor, alpha: 0.50, x: 0, y: 3, radius: 5)
    }
    
    // MARK: - Internal Methods
    
}
