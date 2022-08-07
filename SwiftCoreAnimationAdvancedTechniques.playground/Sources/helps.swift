import UIKit
import Foundation
import PlaygroundSupport

public func present(_ viewController: UIViewController, width: CGFloat = 200.0, height: CGFloat = 200.0) {
    viewController.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
    presentWithOwnSize(viewController)
}

public func presentWithOwnSize(_ viewController: UIViewController) {
    PlaygroundPage.current.liveView = viewController
}

// Then

public protocol Then {}

extension Then where Self: AnyObject {
    public func then(_ handler: (Self) -> Void) -> Self {
        handler(self)
        return self
    }
}

extension NSObject: Then {}
