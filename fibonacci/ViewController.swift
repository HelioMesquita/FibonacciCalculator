import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var numberOfSequencesTextField: UITextField!
  @IBOutlet weak var timeElapsedLabel: UILabel!
  @IBOutlet weak var fibonacciNumberLabel: UILabel!
  @IBOutlet weak var startButtonOutlet: UIButton!

  @IBAction func startButton(_ sender: UIButton) {
    if let numberOfSequences = Double(numberOfSequencesTextField.text!) {
      view.endEditing(true)
      startButtonOutlet.isEnabled = false
      startButtonOutlet.startLoading()
      DispatchQueue.global(qos: .background).async {
        let timeStart = Date()
        let fibonacciNumber = self.fibonacciFormula(numberOfSequences)
        let timeElapsed = Date()
        let executionTime = timeElapsed.timeIntervalSince(timeStart)
        DispatchQueue.main.async {
          self.setViewElements(executionTime: executionTime, fibonacciNumber: fibonacciNumber)
          self.startButtonOutlet.isEnabled = true
          self.startButtonOutlet.stopLoading()
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
    return fibonacciFormula(numberOfSequences - 1) + fibonacciFormula(numberOfSequences - 2)
  }
}

extension UIButton {

  func startLoading() {
    let spinner = UIActivityIndicatorView(frame: self.frame)
    spinner.startAnimating()
    spinner.activityIndicatorViewStyle = .gray
    self.addSubview(spinner)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    constraints.append(spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor))
    constraints.append(spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor))
    constraints.append(spinner.heightAnchor.constraint(equalToConstant: self.frame.height))
    NSLayoutConstraint.activate(constraints)
  }

  private func getSpinner() -> UIView? {
    return self.subviews.first { (view) -> Bool in
      return view is UIActivityIndicatorView
    }
  }

  func stopLoading() {
    if let spinner = getSpinner() as? UIActivityIndicatorView {
      spinner.removeFromSuperview()
    }
  }
}
