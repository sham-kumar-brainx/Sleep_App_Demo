import Foundation
import UIKit

struct SleepCategoryModel: Hashable {
    
    // MARK: - Internal Properties
    let title: String
    let description: String
    let totalHoursToSleep: Float
    let totalHoursSlept: Float
    let progressColor: UIColor
}

