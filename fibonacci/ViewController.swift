import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var numberOfSequencesTextField: UITextField!
  @IBOutlet weak var timeElapsedLabel: UILabel!
  @IBOutlet weak var fibonacciNumberLabel: UILabel!

  @IBAction func startButton(_ sender: UIButton) {
    if let number = Double(numberOfSequencesTextField.text!) {
      view.endEditing(true)
      let timeStart = Date()
      let fibonacciNumber = fibonacciFormula(number)
      let timeElapsed = Date()
      let executionTime = timeElapsed.timeIntervalSince(timeStart)
      setViewElements(executionTime: executionTime, fibonacciNumber: fibonacciNumber)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    numberOfSequencesTextField.delegate = self
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    numberOfSequencesTextField.resignFirstResponder()
    return true
  }

  private func setViewElements(executionTime: TimeInterval, fibonacciNumber: Double) {
    timeElapsedLabel.text = String(executionTime) + " seconds"
    fibonacciNumberLabel.text = String(fibonacciNumber)
  }

  private func fibonacciFormula(_ numberOfSequences: Double) -> Double {
    if numberOfSequences < 1 {
      return 1
    }
    return fibonacciFormula(numberOfSequences - 1) +                                    fibonacciFormula(numberOfSequences - 2)
  }
}
