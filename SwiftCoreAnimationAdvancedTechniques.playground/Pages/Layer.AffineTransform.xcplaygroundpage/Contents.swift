/*:
 # Affine transform
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 ```CGAffineTransform```, and is used to represent a two-dimensional rotation, scale, or translation. ```CGAffineTransform``` is a 2-column-by-3-row matrix that can be multiplied by a 2D row-vector (in this case a CGPoint) to transform its value.
 */
//: ## Example
//: ### Creating a CGAffineTransform
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create image layer
        let image = UIImage(named: "snowman")!
        let imageLayer = CALayer()
        imageLayer.contents = image.cgImage
        imageLayer.contentsGravity = .resizeAspect
        imageLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)

        // ‼️ Create affine transform matrix ✍️ ‼️
        let matrix = CGAffineTransform(rotationAngle: .pi / 4.0)
        //let matrix = CGAffineTransform(scaleX: 0.5, y: 0.5)
        //let matrix = CGAffineTransform(translationX: 50, y: 50)
        
        // ‼️ Set transform matrix ‼️
        imageLayer.setAffineTransform(matrix)
        
        // Add sublayer
        self.view?.layer.addSublayer(imageLayer)
    }
}

present(ViewController())
/*:
 - Experiment: Try different transformations
 */
/*:
 - Note: ```CGAffineTransform(rotationAngle:)``` works with radians
 */
