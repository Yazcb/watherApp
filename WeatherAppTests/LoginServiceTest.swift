//
//  LoginServiceTest.swift
//  WeatherAppTests
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import XCTest
@testable import WeatherApp

final class LoginServiceTest: XCTestCase, BaseServiceDelegate {

    var expectation: XCTestExpectation?
    private var _service: LoginService?
    
    
    override func setUp()  {
        _service = LoginService()
        _service?.delegate = self
    }

    override func tearDown() {
        super.tearDown()
        _service = nil
    }

    func testExample() throws {
        self.expectation = expectation(description:"Verify service")
        _service?.initLogin(completion: { response in
            self.expectation?.fulfill()
            if let login: LoginModel = response {
                print(login.description)
            }
        })
        self.waitForExpectations(timeout: 80.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func processFailWitError(code: Int, error: String) {
        
    }
    

    
}
