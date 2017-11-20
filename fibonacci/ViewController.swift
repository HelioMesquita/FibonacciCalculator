import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var numberOfSequencesTextField: UITextField!
  @IBOutlet weak var timeElapsedLabel: UILabel!
  @IBOutlet weak var fibonacciNumberLabel: UILabel!

  @IBAction func startButton(_ sender: UIButton) {
    if let numberOfSequences = Double(numberOfSequencesTextField.text!) {
      view.endEditing(true)
      DispatchQueue.global(qos: .background).async {
        let timeStart = Date()
        let fibonacciNumber = self.fibonacciFormula(numberOfSequences)
        let timeElapsed = Date()
        let executionTime = timeElapsed.timeIntervalSince(timeStart)
        DispatchQueue.main.async {
          self.setViewElements(executionTime: executionTime, fibonacciNumber: fibonacciNumber)
        }
      }
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
