//
//  TMSTests.swift
//  TMSTests
//
//  Created by Nagarjuna KR on 12/3/24.
//

import Testing
@testable import TMS
import XCTest

struct TMSTests {

    @Test func example() async throws {
        
        let vm = ViewModel(networkManager: TestNetworkManager())
        
        do {
            let _ = try await vm.fetchUsers()
        } catch {
            XCTAssertEqual(error.localizedDescription, "invalidData")
        }

      
            
            // Assert that the actual response matches the expected response.
//            let httpResponse = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expected an HTTPURLResponse.")
           
    }
    
    @Test func test_success() async throws {
        
        let nm = TestNetworkManager()
        nm.success = true
        let vm = ViewModel(networkManager: nm)
        
        do {
            try await vm.fetchUsers()
            let user = vm.users.first
            XCTAssertEqual(user?.name , "xyz")
            XCTAssertNil(user?.image)
            XCTAssertNil(user?.gender)
            
        } catch {
            XCTAssertEqual(error.localizedDescription, "invalidData")
        }

      
            
            // Assert that the actual response matches the expected response.
//            let httpResponse = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expected an HTTPURLResponse.")
           
    }

}


class TestNetworkManager: NetworkManagerProtocol {
    
    var success = false
    
    func fetchusers() async throws -> [WelcomeElement] {
        if !success {
            throw TMSError.invalidData
        } else {
            return [WelcomeElement(id: 1, name: "xyz", image: "", gender: nil, hair: nil, age: nil, occupation: nil)]
        }
       
    }
    
    
}
