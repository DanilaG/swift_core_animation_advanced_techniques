/*:
 # Concatenating
 ### Affine Transform
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
    Also you can concatenating matrix by the ```concatenating``` method.
 */
//: ## Example
//: ### Usage of concatenating
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

        // ‼️ Create affine transform matrixes with concatenating ‼️
        let matrix = CGAffineTransform(rotationAngle: .pi / 4.0)
            .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
            .concatenating(CGAffineTransform(translationX: 50, y: 50))
        
        // Set transform matrix
        imageLayer.setAffineTransform(matrix)
        
        // Add sublayer
        self.view?.layer.addSublayer(imageLayer)
    }
}

present(ViewController())
