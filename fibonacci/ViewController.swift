import UIKit

class ViewController: UIViewController, UITextFieldDelegate, FibonacciFormulaHandable {

  @IBOutlet weak var numberOfSequencesTextField: UITextField!
  @IBOutlet weak var timeElapsedLabel: UILabel!
  @IBOutlet weak var fibonacciNumberLabel: UILabel!
  @IBOutlet weak var startButtonOutlet: UIButton!

  @IBAction func startButton(_ sender: UIButton) {
    if let numberOfSequences = Double(numberOfSequencesTextField.text!) {
      view.endEditing(true)
      startButtonOutlet.isEnabled = false
      startButtonOutlet.startLoading()
      begginProcessingFibonacci(numberOfSequences: numberOfSequences)
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

  private func begginProcessingFibonacci(numberOfSequences: Double) {
    DispatchQueue.global(qos: .background).async {
      let timeStart = Date()
      let fibonacciNumber = self.fibonacciFormula(numberOfSequences)
      let timeElapsed = Date()
      let executionTime = timeElapsed.timeIntervalSince(timeStart)
      self.updateView(executionTime: executionTime, fibonacciNumber: fibonacciNumber)
    }
  }

  private func updateView(executionTime: TimeInterval, fibonacciNumber: Double) {
    DispatchQueue.main.async {
      self.timeElapsedLabel.text = String(executionTime) + " seconds"
      self.fibonacciNumberLabel.text = String(fibonacciNumber)
      self.startButtonOutlet.isEnabled = true
      self.startButtonOutlet.stopLoading()
    }
  }
}
