/*:
 # Shadow Clipping
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```borderWidth``` is a floating-point number that defines the stroke thickness in points. This defaults to zero (no border). The ```borderColor``` defines the color of the stroke and defaults to black.
 */
//: ## Example
//: ### Applying a Border
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

        // Set shadow
        blueLayer.shadowOpacity = 0.75
        
        // Uncomment me and all break 😁
        // blueLayer.masksToBounds = true
        
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
 - Note: Unlike the layer border, the layer’s shadow derives from the exact shape of its contents, not just the ```bounds``` and ```cornerRadius```.
 */
/*:
 - Experiment: Uncomment ```blueLayer.masksToBounds = true``` and a shadow disappear because the shadow is outside of layer.
 */
