/*:
 # ContentsRect
 ### Backing Image
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```сontentsRect``` allows us to specify a subrectangle of the backing image to be displayed inside the layer frame. It uses unit coordinates.
 - Note: The following coordinate types are used in iOS:
    - **Points** — The most commonly used coordinate type on iOS and Mac OS. Points are virtual pixels, also known as logical pixels.
    - **Pixels** — Physical pixel coordinates are not used for screen layout, but they are often still relevant when working with images.
    - **Unit** — Unit coordinates are a convenient way to specify measurements that are relative to the size of an image or a layer’s bounds, and so do not need to be adjusted if that size changes.
 */
/*:
 - Important: It is actually possible to specify a ```contentsRect``` with a negative origin or with dimensions larger than {1, 1}. In this case, the outermost pixels of the image will be stretched to fill the remaining area.
*/
//: ## Example
//: ### Listing 2.3 Make a snowman portrait
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load an image
        let image = UIImage(named: "snowman")!
        
        // Add it to our view's layer
        self.view?.layer.contents = image.cgImage
        
        // Scale contents to fit
        self.view?.layer.contentsGravity = .resizeAspect
        
        // Set contentsRect
        self.view?.layer.contentsRect = CGRect(x: 0.17, y: 0, width: 0.66, height: 0.5)
    }
}

present(ViewController())
