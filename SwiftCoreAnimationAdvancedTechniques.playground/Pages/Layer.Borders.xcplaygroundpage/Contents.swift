/*:
 # Borders
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

        // Set the corner radius
        blueLayer.cornerRadius = 20.0
        
        // ‼️ Set a border width ‼️
        blueLayer.borderWidth = 5.0
        
        // ‼️ Set a border color ‼️
        blueLayer.borderColor = UIColor.red.cgColor
        
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
 - Note: The border is drawn inside the layer bounds, and in front of any other layer contents, including sublayers.
 */
