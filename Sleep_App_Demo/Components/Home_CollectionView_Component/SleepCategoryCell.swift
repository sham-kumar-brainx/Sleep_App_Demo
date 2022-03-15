import Foundation
import UIKit

class SleepCategoryCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var circularProgressView: UIView!
    @IBOutlet weak var circularProgressValue: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linearProgressView: UIView!
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
    }
    
    // MARK: - Private Methods
    private func configureOnLoad() {
        
    }
    
    // MARK: - Internal Methods
   
}
