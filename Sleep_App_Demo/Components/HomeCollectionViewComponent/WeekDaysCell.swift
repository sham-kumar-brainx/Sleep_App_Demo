import UIKit

class WeekDaysCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var dayOfMonth: UILabel!
    @IBOutlet weak var dayOfWeek: UILabel!
    
    // MARK: - Private properties
    private var currentSelect = false
    
    // MARK: - Internal properties
    override var isSelected: Bool {
        didSet {
            self.isSelected ? didSelect() : setCellDefault()
        }
    }
    
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
        self.backgroundColor = Color.collectionItemBackgroundColor
    }
    
    private func didSelect() {
        if !currentSelect {
            self.addGradient(.vertical, withColor: [Color.lightSkyTypeColor, Color.lightBlueTypeColor])
            dayOfWeek.textColor = .white
            dayOfMonth.textColor = .white
            self.setCornerRadius(16, andClipContent: true)
            currentSelect = true
        }
    }
    
    private func setCellDefault() {
        dayOfMonth.textColor = .black
        dayOfWeek.textColor = .black.withAlphaComponent(0.5)
        if let layers = (self.layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
            self.layer.sublayers?.removeFirst()
        }
        currentSelect = false
    }
    
    // MARK: - Internal Methods
    func setCellData(with model: WeekDaysModel) {
        dayOfMonth.text = String(model.dayOfMonth)
        dayOfWeek.text = model.dayOfWeekInShortForm
    }
}
