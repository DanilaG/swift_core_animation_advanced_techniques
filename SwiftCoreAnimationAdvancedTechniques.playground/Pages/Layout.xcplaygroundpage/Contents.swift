/*:
 # Layouts
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 ```CALayer``` has three primary layout properties:
 - ```frame``` (equivalent to UIView ```frame```) is represent the outer coordinates of the layer (that is, the space it occupies within its superlayer).
 - ```bounds``` (equivalent to UIView ```bounds```) is represent the inner coordinates (with {0, 0} typically equating to the top-left corner of the layer, although this is not always the case)
 - ```position``` (equivalent to UIView ```position```) is represent the location of the [```anchorPoint```](AnchorPoint) **relative to the superlayer**.
 */
/*:
 - Note: At the following example:
    - Blue is area inside bounds blueRectangle
    - Orange is frame for blueRectangle
    - Red is position for blueRectangle
 */
//: ## Example
//: ### Visualization of frame, bounds and position
import UIKit

final class ViewController: UIViewController {
    
    // Major view
    let blueRectangle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set size for parent view
        view!.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // Set blue background
        blueRectangle.backgroundColor = .blue
        
        // Set size ✍️
        blueRectangle.layer.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        
        // ‼️ Rotate blue rectangle ✍️ ‼️
        blueRectangle.transform = CGAffineTransform(rotationAngle: 1)
                
        print("Frame 🫥: ")
        ViewController.printRectangle(blueRectangle.layer.frame)
        print("==========")
        print("Bounds 😐:")
        ViewController.printRectangle(blueRectangle.layer.bounds)
        print("==========")
        ViewController.printPoint(blueRectangle.layer.position)
        
        subviewSetup()
    }
    
    // View for visualization of blueRectangle.frame
    let frameView = UIView()
    
    // View for visualization of position
    let positionView = UIView()
    
    private func subviewSetup() {
        
        // Add frameView to parent
        self.view?.addSubview(frameView)
        // Set borders
        frameView.layer.borderColor = UIColor.orange.cgColor
        frameView.layer.borderWidth = 2
        // Set frameView at the center
        frameView.center = CGPoint(
            x: self.view!.bounds.width / 2.0,
            y: self.view!.bounds.height / 2.0
        )
        // Set blue rectangle frame to frameView bounds
        frameView.bounds = blueRectangle.frame
        
        // Add blueRectangle to frameView
        frameView.addSubview(blueRectangle)
        
        // Add positionView to parent
        frameView.addSubview(positionView)
        // Set size for positionView
        positionView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        // Make circle for positionView
        positionView.layer.cornerRadius = positionView.layer.bounds.width / 2.0
        positionView.clipsToBounds = true
        // Set background color for positionView
        positionView.backgroundColor = .red
        // Set blue rectangle position to positionView
        positionView.layer.position = blueRectangle.layer.position
    }
    
    static private func printRectangle(_ rectangle: CGRect) {
        printPoint(rectangle.origin)
        print("width: \(rectangle.width)")
        print("height: \(rectangle.height)")
    }
    
    static private func printPoint(_ point: CGPoint) {
        print("x: \(point.x)")
        print("y: \(point.y)")
    }
}

presentWithOwnSize(ViewController())
/*:
 - Experiment: Change ```transform``` value to see how the frame and the bound connected
 */
/*:
 - Experiment: Change ```blueRectangle.layer.frame``` to see how position changes
 */
