//
//  URLAPIComponentsTest.swift
//  MedicalConnectTests
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/09/24.
//

import XCTest

@testable import MedicalConnect

final class URLAPIComponentsTest: XCTestCase {
    let app = AppEnvironment.shared

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
   
    
    func testLoginRequestInitialization(){
        let email = "juan.perez@example.com"
        let password = "password123"
        
        let loginRequest = LoginRequest(email: email, password: password)
        
        XCTAssertEqual(loginRequest.email, "juan.perez@example.com")
        XCTAssertEqual(loginRequest.password, "password123")
    }
    
    func testLoginRequestEncoding() throws {
        let email = "juan.perez@example.com"
        let password = "password123"
        
        let loginRequest = LoginRequest(email: email, password: password)
        
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(loginRequest)
        let jsonString = String(data: encodedData, encoding:  .utf8)
        
        let expectedJSONString = "{\"email\":\"juan.perez@example.com\",\"password\":\"password123\"}"
        
        XCTAssertEqual(jsonString, expectedJSONString)
    }
    
    func testAPIRequestSetUpURLIsCorrect() throws {
        
        let scheme = app.getScheme(scheme: .https)
        let path: String = "/patients/user"
        let host = app.getURL(api: .test)
     
        let expectedURL = "https://f91bcd24-26d5-4794-b928-69b896db429a.mock.pstmn.io/patients/user"
        
        guard let setupURL = try APIRequest<LoginRequest, LoginResponse>.setupURL(
            scheme: scheme,
            host: host,
            path: path
        ) else { throw URLError(.badURL) }

        let stringURL = setupURL.absoluteString
        
        
        XCTAssertEqual(stringURL, expectedURL)

    }
    
    func testAPIRequestCallIsCorrect() async throws {
        let email = "juan.perez@example.com"
        let password = "password123"
        
        let loginRequest = LoginRequest(email: email, password: password)
        
        let app = AppEnvironment.shared
        let scheme = app.getScheme(scheme: .https)
        let path: String = "/patients/user"
        let host = app.getURL(api: .test)
        let method : HTTPMethod = .POST
        
         let loginResponse = try await APIRequest<LoginRequest, LoginResponse>.call(
            scheme: scheme,
            host: host,
            path: path,
            method: .POST,
            parameters: loginRequest
        )
        
        print(loginResponse)
        
        
        XCTAssertNotNil(loginResponse, "Response shouldn't be nil")
    }
    
}
