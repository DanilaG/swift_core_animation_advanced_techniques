/*:
 # ContentsCenter
 ### Backing Image
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```contentsCenter``` is actually a CGRect that defines a stretchable region inside the layer and a fixed border around the edge. Changing the contentsCenter makes no difference to how the backing image is displayed, until the layer is resized, and then its purpose becomes clear.
 - Note: CGLayer ```contentsCenter``` equivalent to UIView ```resizableImageWithCapInsets```
 */
//: ## Example
//: ### Listing 2.4 Setting Up Stretchable Views Using contentsCenter
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load an image
        let image = UIImage(named: "contentsCenter")!
        
        // Add it to our view's layer
        self.view?.layer.contents = image.cgImage
        
        // Set contentsCenter
        self.view?.layer.contentsCenter = CGRect(
            x: 1.0 / 3,
            y: 1.0 / 3,
            width: 1.0 / 3,
            height: 1.0 / 3
        )
    }
}

present(
    ViewController(),
    width: 300, // Change me
    height: 200 // Change me
)
/*:
 - Experiment: Change width or height to see how ```contentsCenter``` works
 */
