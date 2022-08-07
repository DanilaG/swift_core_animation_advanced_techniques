/*:
 # AnchorPoint
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 The ```anchorPoint``` property of a layer controls how the layer’s frame is positioned relative to its position property. You can think of the anchorPoint as being the handle used to move the layer around.
 - Note: The ```anchorPoint``` is specified in unit coordinates and has default value {0.5, 0.5} (equivalent to the layer center).
 */
//: ## Example
//: ### Clock
import UIKit

final class ViewController: UIViewController {
    
    // Subviews for clock face and second hand
    let clockFace = UIImageView(image: UIImage(named: "Clock/clockFace"))
    let secHand = UIImageView(image: UIImage(named: "Clock/secHand"))
    
    // Timer for hand changes
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set size for parent view
        view?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // Add clock face as subview
        self.view?.addSubview(clockFace)
        
        // Set clock face size
        clockFace.frame = view!.bounds
        
        // Add second hand as subview
        self.view?.addSubview(secHand)
        
        // Set second hand size
        secHand.frame = CGRect(
            x: 0,
            y: 0,
            width: view!.bounds.height * 0.04,
            height: view!.bounds.height * 0.35
        )
        
        // Set seconds hand at the center
        secHand.center = CGPoint(
            x: view!.bounds.width / 2.0,
            y: view!.bounds.height / 2.0
        )
        
        // ‼️ Change anchorPoint ✍️ ‼️
        secHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.72)
        
        // Start timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
        
        // Set initial hand position
        self.tick()
    }
    
    func tick() {
        // Get current seconds
        let calendar = Calendar(identifier: .gregorian)
        let date = Date()
        let seconds = calendar.component(.second, from: date)
        
        // Calculate second hand angle
        let secAngle = (CGFloat(seconds) / 60.0) * .pi * 2.0

        // Rotate second hand
        self.secHand.transform = .init(rotationAngle: secAngle)
    }
}

presentWithOwnSize(ViewController())
/*:
 - Experiment: Change ```anchorPoint``` value to see how it works
 */
