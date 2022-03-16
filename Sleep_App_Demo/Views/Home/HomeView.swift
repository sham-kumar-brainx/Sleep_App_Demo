import UIKit

class HomeView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var availabilityStatusLabel: UILabel!
    @IBOutlet weak var greetingToUserLabel: UILabel!
    @IBOutlet weak var greetingTimeOfDayLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOnLoad()
        setUpCollectionView()
    }
    
    // MARK: - Private Methods
    private func configureOnLoad() {
        self.backgroundColor = Color.lightBrownTypeColor
        topView.addGradient(.vertical, withColor: [Color.lightSkyTypeColor, Color.lightBlueTypeColor])
        availabilityStatusLabel.font = UIFont.setFontProximaNovaBold(ofSize: 14)
        availabilityStatusLabel.backgroundColor = Color.lightGreenColor
        availabilityStatusLabel.setCornerRadius(12, andClipContent: true)
        greetingToUserLabel.font = UIFont.setFontProximaNovaBold(ofSize: 16)
        greetingTimeOfDayLabel.font = UIFont.setFontProximaNovaRegular(ofSize: 10)
        profileImage.setCornerRadius(53, andClipContent: true)
        profileImage.setBorderColor(Color.lightBlueTypeColor, andWidth: 5)
        bottomView.setCornerRadius(20, forCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], andClipContent: true)
        bottomView.backgroundColor = Color.lightBrownTypeColor
    }
    
    private func setUpCollectionView() {
        collectionView.register(WeekDaysCell.nibForCollection(), forCellWithReuseIdentifier: WeekDaysCell.reuseIdentifierForCollection)
        collectionView.register(SleepCategoryCell.nibForCollection(), forCellWithReuseIdentifier: SleepCategoryCell.reuseIdentifierForCollection)
        collectionView.register(CollectionViewHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.reuseIdentifierForHeaderAndFooter)
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayoutKind = Section(rawValue: sectionIndex) else { return nil }
            var groupWidth: CGFloat = 0.0
            var groupHeight: CGFloat = 0.0
            var interGroupSpacing: CGFloat = 30.0
            switch sectionLayoutKind {
            case .weekDays:
                groupWidth = 59
                groupHeight = 61
                interGroupSpacing = 20
            case .sleepCategories, .sleepCategories1:
                groupWidth = 230
                groupHeight = 253
            }
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(groupHeight))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 16.0, leading: 32.0, bottom: 16.0, trailing: 32.0)
            section.orthogonalScrollingBehavior = .groupPaging
            section.interGroupSpacing = interGroupSpacing
            if sectionIndex == 0 {
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80.0))
                let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [headerView]
            }
            return section
        }
        return layout
    }
}
