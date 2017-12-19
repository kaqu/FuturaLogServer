import Foundation
import FuturaLog

internal class LogStorage {
    
    private static let queue = DispatchQueue(label: "LogStorageQueue", qos: .default)
    
    private static var storage: [String:ApplicationLogStorage] = [:]
    
    internal static func sort(_ package: LogPackage) {
        queue.async {
            let applicationLogStorage: ApplicationLogStorage
            if let currentStorage = storage[package.applicationID] {
                applicationLogStorage = currentStorage
            } else {
                applicationLogStorage = ApplicationLogStorage(applicationID: package.applicationID)
                storage[package.applicationID] = applicationLogStorage
            }
            
            let environmentLogStorage: EnvironmentLogStorage
            if let currentStorage = applicationLogStorage.environments.first(where: { $0.environment == package.environment }) {
                environmentLogStorage = currentStorage
            } else {
                environmentLogStorage = EnvironmentLogStorage(environment: package.environment)
                applicationLogStorage.environments.append(environmentLogStorage)
            }
            
            let sessionLogStorage: SessionLogStorage
            if let currentStorage = environmentLogStorage.sessions.first(where: { $0.sessionID == package.sessionID }) {
                sessionLogStorage = currentStorage
            } else {
                sessionLogStorage = SessionLogStorage(sessionID: package.sessionID)
                environmentLogStorage.sessions.append(sessionLogStorage)
            }
            
            sessionLogStorage.logs.append(contentsOf: package.logs)
        }
    }
    
    internal static func getEnvironmentStorages(forApplication applicationID: String) -> [EnvironmentLogStorage]? {
        return queue.sync { storage[applicationID]?.environments }
    }
}
