/*:
 # ContentsScale
 ### Backing Image
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```contentsScale``` property defines a ratio between the pixel dimensions of the layer’s backing image and the size of the view.
 - Note: CGLayer ```contentsScale``` equivalent to UIView```contentScaleFactor```
 */
/*:
 - Important: The ```contentsScale``` property doesn't have the effect of scaling the backing image onscreen if you use auto scale ```contentsGravity``` (like ```resizeAspect```)
*/
//: ## Example
//: ### Listing 2.2 Using contentsScale to Change the Image Display Scale
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load an image
        let image = UIImage(named: "snowman")!
        
        // Add it to our view's layer
        self.view?.layer.contents = image.cgImage
        
        // Center the image
        self.view?.layer.contentsGravity = .center
        
        // Set the contentsScale
        self.view?.layer.contentsScale = 10
    }
}

present(ViewController())
/*:
 - Note: To see affect of ```contentsScale``` we changed ```contentsGravity``` to center
 */
