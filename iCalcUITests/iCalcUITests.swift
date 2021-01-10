//
//  iCalcUITests.swift
//  iCalcUITests
//
//  Created by Filip Sasinowski on 09/01/2021.
//

import XCTest

class iCalcUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
     
        
        /* get all of the buttons and label */
        let button0 = app.buttons["0"]
        let button1 = app.buttons["1"]
        let button2 = app.buttons["2"]
        let button3 = app.buttons["3"]
        let button4 = app.buttons["4"]
        let button5 = app.buttons["5"]
        let button6 = app.buttons["6"]
        let button7 = app.buttons["7"]
        let button8 = app.buttons["8"]
        let button9 = app.buttons["9"]
        
        let buttonAC = app.buttons["AC"]
        let buttonPlusMinus = app.buttons["+/-"]
        let buttonPercent = app.buttons["%"]
        let buttonComma = app.buttons["."]
        
        let buttonDivide = app.buttons["÷"]
        let buttonMultiply = app.buttons["X"]
        let buttonMinus = app.buttons["-"]
        let buttonPlus = app.buttons["+"]
        let buttonEqual = app.buttons["="]
        
      
        // launch the app
        app.launch()
      
        // check starting label value
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0")
        
        // check operations with PLUS
        // 1 + 2 = 3
        button1.tap()
        buttonPlus.tap()
        button2.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "3")
        
        // 1.1 + 2.3 = 3.4
        button1.tap()
        buttonComma.tap()
        button1.tap()
        buttonPlus.tap()
        button2.tap()
        buttonComma.tap()
        button3.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "3.4")
        // check operations with MINUS
        // 4 - 5 = -1
        button4.tap()
        buttonMinus.tap()
        button5.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "-1")
        // 5.1 - 4.6 = 0.5
        button5.tap()
        buttonComma.tap()
        button1.tap()
        buttonMinus.tap()
        button4.tap()
        buttonComma.tap()
        button6.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0.5")
        // check operations with MULTIPLY
        // 6 * 7 = 42
        button6.tap()
        buttonMultiply.tap()
        button7.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "42")
        // 6.3 * 7.8 = 49.14
        button6.tap()
        buttonComma.tap()
        button3.tap()
        buttonMultiply.tap()
        button7.tap()
        buttonComma.tap()
        button8.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "49.14")
        // check operations with DIVIDE
        // 10 / 2 = 5
        button1.tap()
        button0.tap()
        buttonDivide.tap()
        button2.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "5")
        // 17.4 / 6 = 2.9
        button1.tap()
        button7.tap()
        buttonComma.tap()
        button4.tap()
        buttonDivide.tap()
        button6.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "2.9")
        
        //check double equals press
        button1.tap()
        buttonPlus.tap()
        button2.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "3")
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "5")
        //check AC button
        buttonAC.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0")
        //check % button
        button9.tap()
        button0.tap()
        buttonPercent.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0.9")
        //check +/- button
        buttonPlusMinus.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "-0.9")
        //trying to input 0 while number is already at 0
        buttonAC.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0")
        button0.tap()
        button0.tap()
        button0.doubleTap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0")
        // 0 + 0.1 = 0.1
        buttonPlus.tap()
        button0.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0")
        buttonComma.tap()
        button1.tap()
        buttonEqual.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0.1")

        // test % button press after choosing operation
        button8.tap()
        buttonDivide.tap()
        buttonPercent.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0.08")
        // test another % situation
        button8.tap()
        buttonDivide.tap()
        button5.tap()
        buttonPercent.tap()
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "outcomeLabel").label, "0.05")

        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
