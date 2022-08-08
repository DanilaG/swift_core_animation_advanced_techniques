/*:
 # ZPriority
 ### Layer
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 Unlike ```UIView```, which is strictly two-dimensional, ```CALayer``` exists in three-dimensional space. In addition to the position and anchorPoint properties that we have already discussed, ```CALayer``` has two additional properties, ```zPosition``` and ```anchorPointZ```, both of which are floating-point values describing the layer’s position on the Z axis.
 
 Note that there is no depth property to complement the bounds width and height. Layers are fundamentally flat objects. You can think of them as being a bit like stiff sheets of paper that are individually two-dimensional but that can be glued together to form hollow, origami-like 3D structures.
 
 - Note: Normally, layers are drawn according to the order in which they appear in the sublayers array of their superlayer. This is known as the **painter’s algorithm**.
 */
//: ## Example
//: ### Adjusting zPosition to Change the Display Order
import UIKit

final class ViewController: UIViewController {
    
    let greenLayer = CALayer()
    let redLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set parent size
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // Set colors
        greenLayer.backgroundColor = UIColor.green.cgColor
        redLayer.backgroundColor = UIColor.red.cgColor
        
        // Set sublayers size with position
        greenLayer.frame =  CGRect(x: 25, y: 25, width: 100, height: 100)
        redLayer.frame =  CGRect(x: 75, y: 75, width: 100, height: 100)
                
        // Add sublayers to our view's layer
        self.view?.layer.addSublayer(greenLayer)
        self.view?.layer.addSublayer(redLayer)
        
        // ‼️ Change zPosition of greenLayer ✍️ ‼️
        greenLayer.zPosition = 1.0
    }
}

presentWithOwnSize(ViewController())
/*:
 - Experiment: Try to comment ```greenLayer.zPosition = 1.0``` or set ```greenLayer.zPosition``` value equal to 0
 */
