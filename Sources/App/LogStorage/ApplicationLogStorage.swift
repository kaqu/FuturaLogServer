import Foundation
import FuturaLog

internal class ApplicationLogStorage : Codable {
    
    internal let applicationID: String
    internal var environments: [EnvironmentLogStorage]
    
    internal init(applicationID: String, environments: [EnvironmentLogStorage] = []) {
        self.applicationID = applicationID
        self.environments = environments
    }
}
