/*:
 # Mask
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```mask``` property is itself a CALayer and has all the same drawing and layout properties of any other layer. It is used in a similar way to a sublayer in that it is positioned relative to its parent (the layer that owns it), but it does not appear as a normal sublayer. Instead of being drawn inside the parent, the ```mask``` layer defines the part of the parent layer that is visible.
 
 The color of the ```mask``` layer is irrelevant; all that matters is its silhouette. The ```mask``` acts like a cookie cutter; the solid part of the mask layer will be “cut out” of its parent layer and kept; anything else is discarded.
 */
/*:
 - Note: If the mask layer is smaller than the parent layer, only the parts of the parent (or its sublayers) that intersect the mask will be visible. If you are using a mask layer, anything outside of that layer is implicitly hidden.
 */
//: ## Example
//: ### Applying a Layer Mask
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create mask layer
        let mask = CALayer()
        let maskImage = UIImage(named: "snowman")!
        mask.contents = maskImage.cgImage
        mask.frame = CGRect(x: 25, y: 25, width: 150, height: 150)
        mask.contentsGravity = .resizeAspect
        
        // Get contents image
        let backgroundImage = UIImage(named: "catsBackground")!
        
        // Set contents
        self.view?.layer.contents = backgroundImage.cgImage
        
        // Add mask
        self.view?.layer.mask = mask
    }
}

present(ViewController())
