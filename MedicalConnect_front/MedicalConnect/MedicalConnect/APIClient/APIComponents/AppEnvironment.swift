/// `AppEnvironment` is a singleton class used to manage and provide environment-specific configurations, such as API base URLs and network schemes (HTTP/HTTPS).
/// It helps to easily switch between different environments (e.g., local, test) and protocols (e.g., HTTP, HTTPS) throughout the app.

import Foundation

class AppEnvironment {
    static let shared: AppEnvironment = AppEnvironment()
    
    private init(){}
    
    
    /// `Scheme` is an enum representing the two available network protocols.
    enum Scheme {
        case https
        case http
    }
    
    
    ///`getScheme` returns the string representation of the selected network scheme (either "http" or "https").
    /// - Parameter scheme: The scheme type (`.https` or `.http`).
    /// - Returns: A `String` representing the scheme ("https" or "http").
    func getScheme(scheme: Scheme) -> String {
        switch scheme {
            case .https:
                return "https"
            case .http:
                return "http"
        }
    }
    
    
    /// `Base` is an enum representing different environments the app can connect to, such as local development or testing.
    enum Base {
        case local
        case test
    }
    
    
    /// `getURL` returns the base URL string for the selected environment.
    /// - Parameter api: The environment (`.local` or `.test`) for which the base URL is required.
    /// - Returns: A `String` representing the base URL for the selected environment.
    func getURL(api: Base) -> String  {
        switch api {
            case .local:
                return "localhost:8080"
            case .test:
                return "f91bcd24-26d5-4794-b928-69b896db429a.mock.pstmn.io"
                 
        }
    }
}
