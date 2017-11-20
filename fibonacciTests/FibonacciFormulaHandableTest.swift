import XCTest
@testable import fibonacci

class FibonacciFormulaHandableTest: XCTestCase, FibonacciFormulaHandable {

    func testFormulaSequenceValue1() {
      let numberOfSequence = fibonacciFormula(1)
      XCTAssertEqual(numberOfSequence, 2)
    }
  
  func testFormulaSequenceValue3() {
    let numberOfSequence = fibonacciFormula(3)
    XCTAssertEqual(numberOfSequence, 5)
  }

  func testFormulaSequenceValue10() {
    let numberOfSequence = fibonacciFormula(10)
    XCTAssertEqual(numberOfSequence, 144)
  }
}
