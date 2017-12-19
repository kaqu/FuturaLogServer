import Vapor
import FuturaLog

public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    
    services.register { (_) -> ContentConfig in
        var contentConfig = ContentConfig.default()
        contentConfig.use(encoder: Logger.jsonEncoder, for: .json)
        contentConfig.use(decoder: Logger.jsonDecoder, for: .json)
        return contentConfig
    }
}
