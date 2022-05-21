import Foundation
import Alamofire

struct RequestRoute {
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
