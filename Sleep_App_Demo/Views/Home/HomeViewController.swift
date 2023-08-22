import UIKit

enum Section: Int, CaseIterable {
    
    // MARK: - Enum cases
    case weekDays
    case sleepCategories
    case sleepCategories1
}

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var homeView: HomeView!
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
            return HomeScreenViewModel.shared.sleepCategoriesData.count
        case .sleepCategories1:
            return HomeScreenViewModel.shared.sleepCategoriesData.count
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
            cell.setCellData(with: HomeScreenViewModel.shared.sleepCategoriesData[indexPath.row])
            return cell
        case .sleepCategories1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepCategoryCell.reuseIdentifierForCollection, for: indexPath) as! SleepCategoryCell
            cell.setCellData(with: HomeScreenViewModel.shared.sleepCategoriesData[indexPath.row])
            return cell
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.reuseIdentifierForHeaderAndFooter, for: indexPath) as! CollectionViewHeader
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if collectionView.indexPathsForSelectedItems?.first == nil && indexPath.row == 0 {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
            }
        }
    }
}
