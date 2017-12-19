import Foundation
import FuturaLog

internal class EnvironmentLogStorage : Codable {
    
    internal let environment: LogEnvironment
    internal var sessions: [SessionLogStorage]
    
    init(environment: LogEnvironment, sessions: [SessionLogStorage] = []) {
        self.environment = environment
        self.sessions = sessions
    }
}
