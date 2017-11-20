import XCTest

class FibonacciUITests: XCTestCase {

  var app: XCUIApplication!

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }

  func testNumberOfSequence1() {
    let textField = app.textFields["Number of Sequence"]
    textField.tap()
    textField.typeText("1")
    app.buttons["Start"].tap()
    let result = app.staticTexts["2.0"]
    XCTAssertTrue(result.exists)
  }

  func testNumberOfSequence3() {
    let textField = app.textFields["Number of Sequence"]
    textField.tap()
    textField.typeText("3")
    app.buttons["Start"].tap()
    let result = app.staticTexts["5.0"]
    XCTAssertTrue(result.exists)
  }
  
  func testNumberOfSequence10() {
    let textField = app.textFields["Number of Sequence"]
    textField.tap()
    textField.typeText("10")
    app.buttons["Start"].tap()
    let result = app.staticTexts["144.0"]
    XCTAssertTrue(result.exists)
  }
}
