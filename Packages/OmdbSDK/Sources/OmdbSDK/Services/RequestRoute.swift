import Foundation

struct RequestRoute {
    enum HTTPMethod: String {
        case connect = "CONNECT"
        case delete = "DELETE"
        case get = "GET"
        case head = "HEAD"
        case options = "OPTIONS"
        case patch = "PATCH"
        case post = "POST"
        case put = "PUT"
        case trace = "TRACE"
    }
    
    let method: HTTPMethod
    let path: String
    let parameters: [String: Any]?
    
    private static let encoder = JSONEncoder()

    init<Payload: Encodable>(
        method: HTTPMethod,
        path: String,
        payload: Payload?
    ) {
        var dictionary: [String: Any]? = nil
        if
            let data = try? Self.encoder.encode(payload),
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
            let jsonDictionary = jsonObject as? [String: Any]
        {
            dictionary = jsonDictionary
        }
        
        self.method = method
        self.path = path
        self.parameters = dictionary
    }
}
