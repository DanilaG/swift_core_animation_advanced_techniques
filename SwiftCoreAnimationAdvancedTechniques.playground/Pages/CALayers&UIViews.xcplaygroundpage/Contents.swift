/*:
 # CALayers and UIViews
 [⏪ Previous](@previous)    [📄 Contents](Contents)    [Next ⏩](@next)
 */
/*:
 - Important: CALayers tree parallel beneath the UIView hierarchy.

 As we mentioned above each UIView has only one backing layer. So, when we add subview to our view it change number of sublayers.
 */
//: ## Example
//: ### Listing 1.2 Adding subview change number sublayers
import UIKit

let view = UIView()
view.layer.sublayers?.count

// Add subview
view.addSubview(UIView())
view.layer.sublayers?.count

// Add subview
view.addSubview(UIView())
view.layer.sublayers?.count
