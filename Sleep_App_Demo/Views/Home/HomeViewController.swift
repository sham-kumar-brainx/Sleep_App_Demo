import UIKit

enum Section: Int, CaseIterable {
    
    // MARK: - Enum cases
    case weekDays
    case sleepCategories
    case sleepCategories1
}

class HomeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet var homeView: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        self.view.backgroundColor = Color.lightBrownTypeColor
    }
    
    // MARK: - Private Methods
    private func setUpCollectionView() {
        homeView.collectionView.register(WeekDaysCell.nibForCollection(), forCellWithReuseIdentifier: WeekDaysCell.reuseIdentifierForCollection)
        homeView.collectionView.register(SleepCategoryCell.nibForCollection(), forCellWithReuseIdentifier: SleepCategoryCell.reuseIdentifierForCollection)
        homeView.collectionView.register(CollectionViewHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.reuseIdentifierForHeaderAndFooter)
        homeView.collectionView.collectionViewLayout = createLayout()
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

// MARK: - Extention for confroming UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Internal Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .weekDays:
            return HomeScreenViewModel.shared.weekDays.count
        case .sleepCategories:
            return 3
        case .sleepCategories1:
            return 3
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .weekDays:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekDaysCell.reuseIdentifierForCollection, for: indexPath as IndexPath) as! WeekDaysCell
            cell.setCellData(with: HomeScreenViewModel.shared.weekDays[indexPath.row])
            return cell
        case .sleepCategories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepCategoryCell.reuseIdentifierForCollection, for: indexPath) as! SleepCategoryCell
            cell.setAdherence(70, color: .green, forType: .circular)
            //            cell.setCellData(with: verticalItemListData[indexPath.row])
            return cell
        case .sleepCategories1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepCategoryCell.reuseIdentifierForCollection, for: indexPath) as! SleepCategoryCell
            cell.setAdherence(70, color: .green, forType: .circular)
            return cell
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.reuseIdentifierForHeaderAndFooter, for: indexPath) as! CollectionViewHeader
        return headerView
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.section)
//        if indexPath.section == 0 {
//            let cell = collectionView.cellForItem(at: indexPath) as! WeekDaysCell
//            cell.isSelected = true
//            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
//            //                cell.didSelect(indexPath: indexPath as NSIndexPath)
//        } else if indexPath.section == 1 {
//            return
//        }else {
//            return
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            let cell = collectionView.cellForItem(at: indexPath) as! WeekDaysCell
//            cell.isSelected = true
//            //            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
//            //                cell.didSelect(indexPath: indexPath as NSIndexPath)
//        } else if indexPath.section == 1 {
//            return
//        }else {
//            return
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.section == 0 {
            if collectionView.indexPathsForSelectedItems?.first == nil && indexPath.row == 0
            {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
            }
        } else if indexPath.section == 1 {
            return
        }else {
            return
        }
//        //Select 1st cell when the collection view is first loaded
//        if collectionView.indexPathsForSelectedItems?.first == nil && indexPath.row == 0
//        {
//            cell.isSelected = true
//            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
//        }
    }
    
}


