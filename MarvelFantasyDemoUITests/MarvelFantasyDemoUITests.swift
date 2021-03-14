//
//  MarvelFantasyDemoUITests.swift
//  MarvelFantasyDemoUITests
//
//  Created by Hem Poudyal on 3/10/21.
//

import XCTest

class MarvelFantasyDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testBasicNavigationFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        //Test with iPhone12 Pro Max
        // In Simulator 'Hardware -> Keyboard -> Connect hardware keyboard' should be off for testing
        let searchTextField = app.textFields["SearchTextField"]
        searchTextField.tap()
        searchTextField.typeText("Thor")
        
        let searchButton = app.buttons["SearchButton"]
        searchButton.tap()
        
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Thor").element.tap()
        
        //detects if there are changes in the API as well
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Thor & Loki: Double Trouble (2021) #1"]/*[[".cells.staticTexts[\"Thor & Loki: Double Trouble (2021) #1\"]",".staticTexts[\"Thor & Loki: Double Trouble (2021) #1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Thor (2020) #9"]/*[[".cells.staticTexts[\"Thor (2020) #9\"]",".staticTexts[\"Thor (2020) #9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Valkyrie: Jane Foster (2019) #9"]/*[[".cells.staticTexts[\"Valkyrie: Jane Foster (2019) #9\"]",".staticTexts[\"Valkyrie: Jane Foster (2019) #9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tabBars["Tab Bar"].buttons["home"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}


