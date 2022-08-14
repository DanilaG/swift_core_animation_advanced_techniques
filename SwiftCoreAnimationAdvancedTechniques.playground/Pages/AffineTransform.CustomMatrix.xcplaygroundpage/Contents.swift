/*:
 # Custom Matrix
 ### Affine Transform
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
    Also you can set custom value for transform matrix.
 
    CGAffineTransform appearance:

     a   b  0
 
     c   d  0
 
    t_x t_y 1
 */
//: ## Example
//: ### Implementing a Shear Transform
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

        // ‼️ Set custom value for matrix (make shear transform) ‼️
        var matrix = CGAffineTransform.identity
        matrix.c = -1
        matrix.b = 0
        
        // Set transform matrix
        imageLayer.setAffineTransform(matrix)
        
        // Add sublayer
        self.view?.layer.addSublayer(imageLayer)
    }
}

present(ViewController())
/*:
 - Note: [Good samples](https://habr.com/ru/company/skyeng/blog/595893/)
 */
