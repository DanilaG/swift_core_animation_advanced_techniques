/*:
 # MagnificationFilter
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 Use the ```magnificationFilter``` property to set type of algorithm for image minification/magnification.
 
 ```CALayer``` offers a choice of three scaling filters to use when resizing images:
 - **linear** (default, smooth the image)
 - **trilinear** (like linear, but improve performance by using additional memory)
 - **nearest** (this algorithm (known as nearest-neighbor filtering) just samples the nearest single pixel and performs no color blending at all)
 */
//: ## Example
//: ### Usage of MagnificationFilter
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set image
        let image = UIImage(named: "one")!
        self.view?.layer.contents = image.cgImage
        self.view?.layer.contentsGravity = .resizeAspect
        
        // ‼️ Set magnificationFilter ✍️ ‼️
        self.view?.layer.magnificationFilter = .nearest
    }
}

present(ViewController())
/*:
 - Experiment: Change ```magnificationFilter``` value from nearest to linear to see different
 */
