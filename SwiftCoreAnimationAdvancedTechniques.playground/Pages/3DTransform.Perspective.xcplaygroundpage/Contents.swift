
/*:
 # Perspective
 ### 3D Transform
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```transform``` property (which is of type ```CATransform3D```) allowing us to both move and rotate a layer in three dimensions.
 
 ```CATransform3D``` is a 4-by-4 matrix that is capable of arbitrarily transforming a point in 3D
 
 Core Animation provides a number of functions that can be used to create and combine ```CATransform3D``` matrices in exactly the same way as with ```CGAffineTransform``` matrices. The functions are similar to the Core Graphics equivalents, but the 3D translation and scaling functions provide an additional z argument, and the rotation function accepts an x, y, and z argument in addition to the angle.
 
 - Note: You should set perspective (m34) for matrix before you make any transformations
 */
//: ## Example
//: ### Applying Perspective to the Transform
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create image layer
        let image = UIImage(named: "catsBackground")!
        let imageLayer = CALayer()
        imageLayer.contents = image.cgImage
        imageLayer.contentsGravity = .resizeAspect
        imageLayer.frame = CGRect(x: 25, y: 25, width: 150, height: 150)

        // Create a new transform
        var matrix = CATransform3DIdentity
        
        // ‼️ Apply perspective ✍️ ‼️
        matrix.m34 = -1.0 / 500
        
        // ‼️ Create affine transform matrixes with concatenating ‼️
        matrix = CATransform3DRotate(matrix, .pi / 3.0, 0, 1, 0)
        
        // Set transform matrix
        imageLayer.transform = matrix
        
        // Add sublayer
        self.view?.layer.addSublayer(imageLayer)
    }
}

present(ViewController())
/*:
 - Experiment: Try to comment ```matrix.m34 = -1.0 / 500```
 */
