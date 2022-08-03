/*:
 # Contents
 ### Backing Image
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 Contents for CGLayer is an object that provides the contents of the layer. Animatable.
 - Important: If you supply anything other than a CGImage to layer contents, then your layer will be blank (for iOS)
 */
//: ## Example
//: ### Listing 2.1 Setting a CGImage as the Layer contents
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load an image
        let image = UIImage(named: "snowman")!
        
        // Add it to our view's layer
        self.view?.layer.contents = image.cgImage
    }
}

present(ViewController())
/*:
 - Note: Contents works with CGImage
 */
