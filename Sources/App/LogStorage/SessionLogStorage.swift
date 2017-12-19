import Foundation
import FuturaLog

internal class SessionLogStorage : Codable {
    
    internal let sessionID: String
    internal var logs: [Log]
    
    init(sessionID: String, logs: [Log] = []) {
        self.sessionID = sessionID
        self.logs = logs
    }
}
