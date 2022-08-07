/*:
 # HitTest
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 ```CALayer``` does not have any knowledge of the responder chain, so it cannot deal with touch events or gestures directly. It does have a couple of methods to help you to implement touch handling yourself, however: ```contains``` and ```hitTest```.

 The ```hitTest``` method also accepts a ```CGPoint```; but instead of a bool, it returns either the layer itself or the deepest sublayer containing the point. This means that you do not need to transform and test the point against each sublayer in turn manually, as you do when using the ```contains``` method. If the point lies outside of the outermost layer’s bounds, it returns ```nil```.

 - Important: The ```hitTest``` method (and this applies to ```UIView``` touch handling as well, incidentally), the order of testing is based strictly on the order of layers within the layer tree. The [```zPosition```](Layer.zPriority) property can affect the apparent order of layers onscreen, but not the order in which touches will be processed.
 */
//: ## Example
//: ### Determining the Touched Layer Using hitTest
import UIKit

final class ViewController: UIViewController {
    
    // Create sublayer
    let blueLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set size
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        // Set background color
        blueLayer.backgroundColor = UIColor.blue.cgColor
        
        // Add subview to hierarchy
        self.view?.layer.addSublayer(blueLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get first touches
        let point = touches.first!.location(in: self.view)
        
        // ‼️ Get touched layer ‼️
        let layer = self.view!.layer.hitTest(point)
        
        // Get layer using hitTest
        if layer == blueLayer {
            print("In blue 🥶")
        } else {
            print("In white 😶‍🌫️")
        }
    }
}

present(ViewController())
