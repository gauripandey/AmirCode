//
//  TaskAssignmentTests.swift
//  TaskAssignmentTests
//
//

import XCTest
@testable import TaskAssignment

final class TaskAssignmentTests: XCTestCase {

    
    func test_ServerApi(){
        let expectation = expectation(description: "server_Api")
        Task{
            try await  ServerApi.shared.fatchAPIData{
                data in
                XCTAssertNotNil(data?.data)
                XCTAssertEqual(data?.data?.first?.symbol as? String ?? "", "AAPL")
                expectation.fulfill()
            }
        }
       
        waitForExpectations(timeout: 10, handler: nil)
        
    }
   
}
