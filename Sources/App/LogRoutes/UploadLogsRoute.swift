import Vapor
import Routing
import FuturaLog

internal enum UploadLogsRoute {
    
    internal static func routeHandler(_ request: Request) throws -> Response {
        try LogStorage.sort(request.content.decode(LogPackage.self))
        let response = request.makeResponse()
        response.http = HTTPResponse(status: .accepted)
        return response
    }
}
