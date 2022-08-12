/*:
 # Shadow
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```shadowOpacity``` is a floating-point value and should be set between 0.0 (invisible) and 1.0 (fully opaque). Setting a value of 1.0 will show a black shadow with a slight blur and a position slightly above the layer.
 
 The ```shadowColor``` property, as its name implies, controls the shadow color and is a CGColorRef, just like the borderColor and backgroundColor properties. The default shadow color is black.
 
 The ```shadowOffset``` property controls the direction and distance to which the shadow extends. The ```shadowOffset``` is a ```CGSize``` value, with the width controlling the shadow’s horizontal offset and the height controlling its vertical offset. The default ```shadowOffset``` is {0, -3}, which results in a shadow positioned 3 points above the layer along the Y axis.
 
 The ```shadowRadius``` property controls the blurriness of the shadow. A value of zero creates a hard-edged shadow that exactly matches the shape of the view. A larger value creates a soft-edged shadow that looks more natural.
 */
//: ## Example
//: ### Applying a Border
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create sublayer
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor

        // Set shadow opacity ✍️
        blueLayer.shadowOpacity = 1.0
        
        // Set shadow color ✍️
        blueLayer.shadowColor = UIColor.brown.cgColor
        
        // Set shadow offset ✍️
        blueLayer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        
        // Set shadow radius ✍️
        blueLayer.shadowRadius = 5.0
        
        // Add subviews to hierarchy
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
 - Note: Although Core Animation was adapted from Layer Kit (the private animation framework created for iOS), its first appearance as a public framework was on Mac OS, which uses an inverted coordinate system with respect to iOS (the Y axis points upward). On a Mac, the same default shadowOffset value results in a downward-pointing shadow, so the default direction makes more sense in that context.
 */
