//
//  FirstMVPTests.swift
//  FirstMVPTests
//
//  Created by vchan on 2021/2/19.
//

import XCTest
@testable import MVP

class FirstMVPTests: XCTestCase {
    var titleString: String?
    var contentString: String?
    
    var networkExpection: XCTestExpectation?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        networkExpection = expectation(description: "networkDownSuccess")
        
        let presenter = FirstMVPPresenter()
        presenter.setView(self)
        
        let result = XCTWaiter(delegate: self).wait(for: [self.networkExpection!], timeout:  2)
        if result == .timedOut {
            print("超时")
        }
        
        networkExpection = expectation(description: "networkDownSuccess")
        
        presenter.textFieldCommit("aaa")
        
        let result1 = XCTWaiter(delegate: self).wait(for: [self.networkExpection!], timeout:  1)
        if result1 == .timedOut {
            print("超时")
        }
        
        XCTAssert(self.contentString == "aaa")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension FirstMVPTests : FirstMVPViewProtocol {
    func setContent(_ content: String?) {
        self.contentString = content
        self.networkExpection!.fulfill()
    }
    
    func setTitle(_ title: String?) {
        self.titleString = title
    }
}
