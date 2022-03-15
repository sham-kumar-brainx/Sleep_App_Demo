import UIKit

class HomeView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var availabilityStatusLabel: UILabel!
    @IBOutlet weak var greetingToUserLabel: UILabel!
    @IBOutlet weak var greetingTimeOfDayLabel: UILabel!
    
    // MARK: Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
    }
    
    // MARK: Private Methods
    private func configureOnLoad() {
        topView.addGradient(.vertical, withColor: [Color.lightSkyTypeColor, Color.lightBlueTypeColor])
        availabilityStatusLabel.font = UIFont.setFontProximaNovaBold(ofSize: 14)
        availabilityStatusLabel.backgroundColor = Color.lightGreenColor
        availabilityStatusLabel.setCornerRadius(12, andClipContent: true)
        greetingToUserLabel.font = UIFont.setFontProximaNovaBold(ofSize: 16)
        greetingTimeOfDayLabel.font = UIFont.setFontProximaNovaRegular(ofSize: 10)
        profileImage.setCornerRadius(53, andClipContent: true)
        profileImage.setBorderColor(Color.lightBlueTypeColor, andWidth: 5)
        
    }
    
    // MARK: Internal Methods
    
}
