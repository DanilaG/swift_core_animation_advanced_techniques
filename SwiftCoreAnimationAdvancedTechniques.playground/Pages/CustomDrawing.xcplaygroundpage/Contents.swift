/*:
 # Custom Drawing
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 ```CALayer``` has an optional delegate property that conforms to the ```CALayerDelegate``` protocol. You just add the methods you need and ```CALayer``` will call them if present.
 
 When it needs to be redrawn, ```CALayer``` asks its delegate to supply a backing image for it to display by calling ```display```. If it doesn't exist CALayer attempts to call ```draw``` where you can draw using ```ctx``` parameter.
 */
/*:
 - Note: You will almost never need to implement the ```CALayerDelegate``` protocol. The reason for this is that when ```UIView``` creates its backing layer, it automatically sets itself as the layer’s delegate and provides an implementation for ```display``` that abstracts these issues away.
 */
//: ## Example
//: ### Listing 2.5 Implementing the CALayerDelegate
import UIKit
import CoreGraphics

// Inherit CALayerDelegate
final class ViewController: UIViewController, CALayerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create sublayer
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        
        // Set delegate
        blueLayer.delegate = self
        
        // Add sublayer
        self.view?.layer.addSublayer(blueLayer)
        
        // Force layer to redraw
        blueLayer.display()
    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        // Draw a thick red circle
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}

present(ViewController())
/*:
 - Note:
    - ```CALayer``` **does not redraw** its contents automatically when it appears onscreen; so you should call ```display``` on ```blueLayer``` to force it to be updated.
    - The circle that we have drawn is clipped to the layer bounds even though we have not enabled the ```masksToBounds``` property. That’s because when you draw the backing image using the ```CALayerDelegate```, the ```CALayer``` creates a drawing context with the exact dimensions of the layer. There is no provision made for drawing that spills outside of those bounds.
 */
