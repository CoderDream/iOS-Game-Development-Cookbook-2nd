//
//  TestsAndAssertionsTests.swift
//  TestsAndAssertionsTests
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import XCTest

class SomeAwesomeObject {
    func doSomethingCool() -> Bool {
        return true
    }
}

class TestsAndAssertionsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDoingSomethingCool() {
        let object = SomeAwesomeObject()
        let succeeded = object.doSomethingCool()
        
        if succeeded == false {
            XCTFail("Failed to do something cool");
        }
    }
    
    func testDemo() {
        var X: String? = nil
        
        // Fails if X is not nil
        // 如果 X 不为空，测试失败
        XCTAssertNil(X, "X should be nil")
        
        X = "hello"
        
        // Fails if X IS nil
        // 如果 X 为空，测试失败
        XCTAssertNotNil(X, "X should not be nil")
        
        // Fails if X is not true
        // 如果 X 不为 true，测试失败
        XCTAssertTrue(1 == 1, "1 really should be equal to 1")
        
        // Fails if X is not false
        // 如果 X 不为 false，测试失败
        XCTAssertFalse(2 == 3, "In this universe, 2 equals 3 apparently")
        
        // Fails if X and Y are not equal (tested by calling X.equals(Y)])
        // 如果 X 不等于 Y，测试失败（实际上是调用X.equals(Y)）
        XCTAssertEqual((2), (1+1), "Objects should be equal")
        
        // Fails if X and Y ARE equal (tested by calling X.equals(Y))
        // 如果 X 等于 Y，测试失败（实际上是调用X.equals(Y)）
        XCTAssertNotEqual("One", "1", "Objects should not be equal")
        
        // Fails, regardless of circumstances
        // 不论什么情况都失败
        XCTFail("Everything is broken")
    }

}
