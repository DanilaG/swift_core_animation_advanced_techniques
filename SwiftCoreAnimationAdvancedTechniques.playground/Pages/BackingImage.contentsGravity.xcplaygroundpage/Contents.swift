/*:
 # ContentsGravity
 ### Backing Image
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 ContentsGravity is determine how content should be aligned within the layer bounds.
 - Note: ```view?.layer.contentsGravity = .resizeAspect``` analogously ```view.contentMode = .scaleAspectFit```
 */
//: ## Example
//: ### Listing 2.1* Using contentsGravity to change image alignment
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load an image
        let image = UIImage(named: "snowman")!
        
        // Add it to our view's layer
        self.view?.layer.contents = image.cgImage
        
        // Scale image to fit the layer bounds without distorting its aspect ratio
        self.view?.layer.contentsGravity = .resizeAspect
    }
}

present(ViewController())
/*:
 - Note: Our snowman less fat than at the [previous](@previous) example
 */
