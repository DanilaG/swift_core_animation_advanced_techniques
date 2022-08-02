/*:
 # CALayer Tree
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 What CALayer can do:
 - Contain content
 - Manage positions of their children
 - Drop shadows, rounded corners, and colored borders
 - 3D transforms and positioning
 - Nonrectangular bounds
 - Alpha masking of content
 - Multistep, nonlinear animations
 
 - Important: CALayer doesn't handler user interaction
 */
/*:
 CALayers are structured as a tree, parallel beneath the UIView hierarchy.
 
 - Note: A view has only one backing layer (created automatically) but can host an unlimited number of additional layers.
 
 */
//: ## Example
//: ### Listing 1.1 Adding a Blue Sublayer to the View
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create sublayer
        let blueLayer = CALayer()

        // Set size
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        // Set background color
        blueLayer.backgroundColor = UIColor.blue.cgColor
        
        // Add subview to hierarchy
        self.view?.layer.addSublayer(blueLayer)
    }
}
/*:
 - Note: CALayer works with CGColor, when UIView uses UIColor
 */
// Present ViewController
import PlaygroundSupport

let viewController = ViewController()
viewController.view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
PlaygroundPage.current.liveView = viewController
