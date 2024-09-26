/// `APIError` is an enum that represents various errors that can occur during the creation of the API. Each case in the enum corresponds to a specific error scenario. 
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding
    case response
}
