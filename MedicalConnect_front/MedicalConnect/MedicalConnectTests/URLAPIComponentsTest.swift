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
        let email = "ana.peters@example.com"
        let password = "password123"
        
        let loginRequest = LoginRequest(email: email, password: password)
        
        XCTAssertEqual(loginRequest.email, "juan.perez@example.com")
        XCTAssertEqual(loginRequest.password, "password123")
    }
    
    func testLoginRequestEncoding() throws {
        let email = "ana.peters@example.com"
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
    
    func testAPIRequestCallGetTokens() async throws {
        let email = "ana.peters@example.com"
        let password = "password123"
        let loginRequest = LoginRequest(email: email, password: password)
        
        let response = try await LoginAction(parameters: loginRequest).call()
        
        let accessToken = response.data.accessToken
        let refreshToken = response.data.refreshToken
        
        XCTAssertEqual(accessToken, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiZHVsY2VpdGFtYXIyMkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InBhc3N3b3JkMTIzIn0.XGDFjkdPKDd_flu09mKhVo5cQH_sYhKCaIxGVSvKz-s")
        XCTAssertEqual(refreshToken, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiZHVsY2VpdGFtYXIyMkBnbWFpbC5jb20iLCJwYXNzd29yZCI6InBhc3N3b3JkMTIzX3JlZnJlc2hUb2tlbiJ9.V821guNXHr0-MqUyScftxeZMTeBJe3N5FL7Sv8zz4Fw")
        
    }
    
    
    
    
    
    func testAPIRequestCallGetUser() async throws {
        let email = "ana.peters@example.com"
        let password = "password123"
        
        let loginRequest = LoginRequest(email: email, password: password)
        let response = try await LoginAction(parameters: loginRequest).call()
        let receivedData = response.data.user
        
        
        
        XCTAssertEqual(receivedData.id, "0be29abe-9b45-4ea7-9e09-26e0b2f3a604")
        XCTAssertEqual(receivedData.gender, Gender.FEMALE)
        XCTAssertEqual(receivedData.allergies, "Frutos secos")
        XCTAssertEqual(receivedData.birthdate, "1990-03-11")
        
        
        guard let card = receivedData.paymentMethods?.first else {
                  XCTFail("No card found")
                  return
              }
        XCTAssertEqual(card.name, "VISA 1243")
        XCTAssertEqual(card.id, "97c6a6a9-e3dc-4ad0-9371-dbce3f41038d")
        XCTAssertEqual(card.cardNumber, "4152142587452452")
        XCTAssertEqual(card.expiredDate, "05/29")
        XCTAssertNil(card.cvv)
        
        
        
        XCTAssertEqual(receivedData.user.name, "Ana Peters")
        XCTAssertEqual(receivedData.user.email, "ana.peters@example.com")
        XCTAssertEqual(receivedData.user.password, "password123")
        XCTAssertEqual(receivedData.user.phone, "123-456-7890")
        XCTAssertEqual(receivedData.user.typeOfUser, TypeOfUsers.patient)
        XCTAssertEqual(receivedData.user.typeOfSignup, TypeOfAuth.EmailAuth)

//        
    }
    
}
