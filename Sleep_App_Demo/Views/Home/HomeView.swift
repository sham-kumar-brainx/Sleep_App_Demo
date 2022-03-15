import UIKit

class HomeView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    
    // MARK: Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
    }
    
    // MARK: Private Methods
    private func configureOnLoad() {
        topView.addGradient(.vertical, withColor: [Color.lightSkyTypeColor, Color.lightBlueTypeColor])
    }
    
    // MARK: Internal Methods
    
}
