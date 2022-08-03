import UIKit
import PlaygroundSupport

public func present(_ viewController: UIViewController, width: CGFloat = 200.0, height: CGFloat = 200.0) {
    viewController.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
    PlaygroundPage.current.liveView = viewController
}
