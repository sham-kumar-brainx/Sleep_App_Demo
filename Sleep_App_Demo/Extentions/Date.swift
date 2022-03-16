import UIKit

extension Date {
    
    // MARK: - Static Methods
    func getCurrentDayInShortForm() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        let dayOfTheWeekString = dateFormatter.string(from: self)
        return dayOfTheWeekString
    }
    
    func getCurrentDayOfMonth() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        guard let dayOfMonth = components.day else { return 0 }
        return dayOfMonth
    }
}
