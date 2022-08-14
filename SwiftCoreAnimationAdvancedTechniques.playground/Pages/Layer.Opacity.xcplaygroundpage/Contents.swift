/*:
 # Opacity
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```opacity``` property is equivalent for ```UIView``` ```alpha``` property. 
 */
//: ## Example
//: ### Usage of opacity
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

        // ‼️ Set opacity ✍️ ‼️
        blueLayer.opacity = 0.5
        
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
 - Note: If you set the opacity of a layer it will automatically affect all of its sublayers, as well
 */
