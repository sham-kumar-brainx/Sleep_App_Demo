import Foundation

enum LocalizedKey: String {
    
    // MARK: - Internal Properties
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    // MARK: - Enum cases
    case emptyString = ""
    case deepSleep = "Deep Sleep"
    case sleep = "sleep"
    case awake = "Awake"
    case deepSleepDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    case awakeDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. This is description for awake."
    case sleepDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. This is description for sleep. You need to sleep a bit more"
}
