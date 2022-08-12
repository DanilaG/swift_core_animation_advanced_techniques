/*:
 # CornerRadius
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```cornerRadius``` property that controls the curvature of the layer’s corners. It is a floating point value that defaults to zero (sharp corners), but can be set to any value you like (specified in points). By default, this curvature affects only the background color of the layer and not the backing image or sublayers. However, when the ```masksToBounds``` property is set to YES, everything inside the layer is clipped to this curve.
 */
//: ## Example
//: ### Applying cornerRadius and masksToBounds
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create sublayer for blueLayer
        let yellowLayer = makeLayer(
            frame: CGRect(x: -40, y: -40, width: 80, height: 80),
            backgroundColor: UIColor.yellow
        )
        
        // Create sublayer
        let blueLayer = makeLayer(
            frame: CGRect(x: 50, y: 50, width: 100, height: 100),
            backgroundColor: UIColor.blue
        )

        // ‼️ Set the corner radius ✍️ ‼️
        blueLayer.cornerRadius = 20.0
        
        // Change masksToBounds ✍️
        blueLayer.masksToBounds = true
        
        // Add subviews to hierarchy
        blueLayer.addSublayer(yellowLayer)
        self.view?.layer.addSublayer(blueLayer)
    }
    
    // Make a layer
    private func makeLayer(frame: CGRect, backgroundColor: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = backgroundColor.cgColor
        return layer
    }
}

present(ViewController())
/*:
 - Experiment: Try to change ```masksToBounds``` and ```cornerRadius``` values
 */
