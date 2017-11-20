import UIKit

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
