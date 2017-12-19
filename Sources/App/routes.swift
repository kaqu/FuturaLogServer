import Routing
import Vapor

final class Routes: RouteCollection {
    
    let app: Application

    init(app: Application) {
        self.app = app
    }

    func boot(router: Router) throws {
        router.post("uploadLogs", use: UploadLogsRoute.routeHandler)
        router.post("getLogs", GetLogsRoute.ApplicationID.parameter, use: GetLogsRoute.routeHandler)
    }
}
