import Foundation

class HomeScreenViewModel {
    
    // MARK: - Private Properties
    private let date = Date()
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    // MARK: - Internal Properties
    var weekDays = [WeekDaysModel]()
    var sleepCategoriesData = [SleepCategoryModel]()
    
    // MARK: - Self Instance
    static var shared = HomeScreenViewModel()
    
    // MARK: - Initializer Methods
    private init() {
        loadWeekDaysDate()
        loadSleepCategoriesData()
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
    
    private func loadSleepCategoriesData() {
        sleepCategoriesData.append(SleepCategoryModel(title: LocalizedKey.sleep.string, description: LocalizedKey.sleepDescription.string, totalHoursToSleep: 8, totalHoursSlept: 6, progressColor: Color.filledHorizentalProgressBar))
        sleepCategoriesData.append(SleepCategoryModel(title: LocalizedKey.awake.string, description: LocalizedKey.awakeDescription.string, totalHoursToSleep: 8, totalHoursSlept: 4, progressColor: Color.lightGreenColor))
        sleepCategoriesData.append(SleepCategoryModel(title: LocalizedKey.deepSleep.string, description: LocalizedKey.deepSleepDescription.string, totalHoursToSleep: 8, totalHoursSlept: 5, progressColor: Color.lightSkyTypeColor))
    }
}
