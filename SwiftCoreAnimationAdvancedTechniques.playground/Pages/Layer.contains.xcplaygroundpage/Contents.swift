/*:
 # Contains
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 ```CALayer``` does not have any knowledge of the responder chain, so it cannot deal with touch events or gestures directly. It does have a couple of methods to help you to implement touch handling yourself, however: ```contains``` and ```hitTest```.
 */
/*:
 The ```contains``` method accepts a ```CGPoint``` in the **layer’s own coordinate system**, and returns true if the point lies inside the layer’s frame.
 */
//: ## Example
//: ### Determining the Touched Layer Using contains
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
        
        // Convert point to blueLayer’s coordinates
        let pointInBlueLayer = blueLayer.convert(point, from: self.view!.layer)
        
        // Get layer using contains
        if blueLayer.contains(pointInBlueLayer) {
            print("In blue 🥶")
        } else {
            print("In white 😶‍🌫️")
        }
    }
}

present(ViewController())
