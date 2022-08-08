/*:
 # LayoutSublayers
 ### LayerDelegate
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 This ```layoutSublayers``` is called automatically whenever the layer bounds changes or the ```setNeedsLayout``` method is called on the layer. It gives you the opportunity to reposition and resize your sublayers programmatically, but offers no automatic default behaviors for keeping layers aligned after a screen rotation like the UIView autoresizingMask and constraints properties.
 */
import UIKit

final class ViewController: UIViewController, CALayerDelegate {
    
    // Sublayer
    let blueLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial size for parent
        self.view?.layer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // Set delegate
        self.view?.layer.delegate = self
        
        // Set background color for parent
        self.view?.layer.backgroundColor = UIColor.yellow.cgColor
        
        // Add subview to hierarchy
        self.view?.layer.addSublayer(blueLayer)
        
        // Set background color for sublayer
        blueLayer.backgroundColor = UIColor.blue.cgColor
    }
    
    // Try to comment this method ✍️
    func layoutSublayers(of layer: CALayer) {
        
        // Calculate origin position of sublayer
        let origin = CGPoint(
            x: layer.bounds.width / 4,
            y: layer.bounds.height / 4
        )
        
        // Calculate size of sublayer
        let size = CGSize(
            width: layer.bounds.width / 2,
            height: layer.bounds.height / 2
        )
        
        // Update sublayer
        blueLayer.frame = CGRect(
            origin: origin,
            size: size
        )
    }
}

// Create ViewController
let viewController = ViewController()

// Present the viewController
presentWithOwnSize(viewController)

// Set timer
let timer = Timer.scheduledTimer(
    withTimeInterval: 1.0,
    repeats: true
) { [weak viewController] _ in
    
    var newHeight = ((viewController?.view?.bounds.height ?? 0) - 10.0)
    if newHeight <= 50.0 {
        newHeight = 200
    }
    
    // Update view size
    viewController?.view.frame = CGRect(
        x: 0,
        y: 0,
        width: 200,
        height: newHeight
    )
}
/*:
 - Experiment: Try define ```blueLayer.frame``` at ```viewDidLoad``` and comment ```layoutSublayers```
 */
