import Foundation

class HomeScreenViewModel {
    
    // MARK: - Private Properties
    private let date = Date()
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    // MARK: - Internal Properties
    var weekDays = [WeekDaysModel]()
    
    // MARK: - Self Instance
    static var shared = HomeScreenViewModel()
    
    // MARK: Initializer Methods
    private init() {
        loadWeekDaysDate()
    }
    
    // MARK: - Private Methods
    private func loadWeekDaysDate() {
        var currentDate = calendar.startOfDay(for: date)
        dateFormatter.dateFormat = "E"
        for i in 1 ... 7 {
            let dayOfTheWeekString = dateFormatter.string(from: currentDate)
            let day = calendar.component(.day, from: currentDate)
            weekDays.append(WeekDaysModel(dayOfMonth: day, dayOfWeekInShortForm: dayOfTheWeekString))
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? date
        }
    }
}
