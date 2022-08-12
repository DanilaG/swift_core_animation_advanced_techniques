/*:
 # ShadowPath
 ### Backing Image
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 We’ve established that layer shadows are not always square, but instead derive from the shape of the contents. This looks great, but it’s also very expensive to calculate in real time, especially if the layer contains multiple sublayers, each with alpha-masked backing images.
 
 If you know in advance what the shape of your shadow needs to be, you can improve performance considerably by specifying a ```shadowPath```.
 */
//: ## Example
//: ### Creating Simple Shadow Paths
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create sublayer with image
        let imageLayer = CALayer()
        let image = UIImage(named: "snowman")!
        imageLayer.contents = image.cgImage
        imageLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        imageLayer.contentsGravity = .resizeAspect
        
        // Add shadow
        imageLayer.shadowOpacity = 0.75
        
        // ‼️ Set shadow path ‼️
        // Try to comment it ✍️
        ViewController.setRoundedShadow(for: imageLayer)
        
        // Add subview
        self.view?.layer.addSublayer(imageLayer)
    }
    
    // Set shadow path
    static private func setRoundedShadow(for layer: CALayer) {
        let path = CGMutablePath()
        path.addEllipse(in: layer.bounds)
        layer.shadowPath = path
    }
}

present(ViewController())
/*:
 - Experiment: Comment ```ViewController.setRoundedShadow(for: imageLayer)```
 */
