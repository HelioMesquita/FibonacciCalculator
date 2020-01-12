protocol FibonacciFormulaHandable {
  func fibonacciFormula(_ numberOfSequences: Double) -> Double
}

extension FibonacciFormulaHandable {

  func fibonacciFormula(_ numberOfSequences: Double) -> Double {
    if numberOfSequences < 1 {
      return 1
    }
    print(fibonacciFormula(numberOfSequences - 1))
    return fibonacciFormula(numberOfSequences - 1) + fibonacciFormula(numberOfSequences - 2)
  }
}
