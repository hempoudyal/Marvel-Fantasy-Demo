//
//  MarvelFantasyDemoTests.swift
//  MarvelFantasyDemoTests
//
//  Created by Hem Poudyal on 3/10/21.
//

import XCTest
@testable import MarvelFantasyDemo

class MarvelFantasyDemoTests: XCTestCase {

    func testDictionaryUpdate(){
        //a sample implementation of testing updating dictionary method used in project
        var testValue : [String: Int] = ["One": 1, "Two": 2]
        testValue.update(other: ["Three": 3])
        
        XCTAssertEqual(testValue, ["One": 1,
                                "Two": 2,
                                "Three": 3])
    }

}
