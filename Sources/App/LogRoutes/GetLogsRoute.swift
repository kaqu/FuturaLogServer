import Vapor
import Routing
import FuturaLog

internal enum GetLogsRoute {
    
    internal class ApplicationID : Parameter {
        typealias ResolvedParameter = String
        
        static func make(for parameter: String, using container: Container) throws -> String {
            return parameter
        }
    }
    
    internal static func routeHandler(_ request: Request) throws -> Response {
        let response = request.makeResponse()
        
        let applicationID: String
        do {
            applicationID = try request.parameter(ApplicationID.self)
        } catch {
            response.http = HTTPResponse(status: .badRequest)
            return response
        }
        
        guard let applicationEnvironmentStorages = LogStorage.getEnvironmentStorages(forApplication: applicationID) else {
            response.http = HTTPResponse(status: .noContent)
            return response
        }
        
        do {
            response.http = HTTPResponse(status: .ok)
            try response.content.encode(applicationEnvironmentStorages)
        } catch {
            response.http = HTTPResponse(status: .internalServerError)
        }
        return response
    }
}
