// Copyright © 2016 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import UIKit

/// StoredAnimation is a concrete subclass of Animation.
///
/// A StoredAnimation object is able to apply a set of stored animation properties to an object.
///
/// This class is useful for serializing and deserializing animations.
public class StoredAnimation: Animation {
    /// A dictionary of keys whose values will be applied to animatable properties of the receiver. The keys should map directly to the names of animatable properies.
    public var values = [String: AnyObject]()

    /// Initiates the changes specified in the receivers `animations` block.
    /// - parameter object: An object to which the animations apply
    public func animate(object: NSObject) {
        let disable = ShapeLayer.disableActions
        ShapeLayer.disableActions = false
        var timing: CAMediaTimingFunction
        var options: UIViewAnimationOptions = [UIViewAnimationOptions.BeginFromCurrentState]

        switch curve {
        case .Linear:
            options = [options, UIViewAnimationOptions.CurveLinear]
            timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        case .EaseOut:
            options = [options, UIViewAnimationOptions.CurveEaseOut]
            timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        case .EaseIn:
            options = [options, UIViewAnimationOptions.CurveEaseIn]
            timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        case .EaseInOut:
            options = [options, UIViewAnimationOptions.CurveEaseInOut]
            timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        }

        autoreverses == true ? options.unionInPlace(.Autoreverse) : options.subtractInPlace(.Autoreverse)
        repeatCount > 0 ? options.unionInPlace(.Repeat) : options.subtractInPlace(.Repeat)

        UIView.animateWithDuration(duration, delay: 0, options: options, animations: {
            ViewAnimation.stack.append(self)
            UIView.setAnimationRepeatCount(Float(self.repeatCount))
            CATransaction.begin()
            CATransaction.setAnimationDuration(self.duration)
            CATransaction.setAnimationTimingFunction(timing)
            CATransaction.setCompletionBlock() {
                self.postCompletedEvent()
            }
            for (key, value) in self.values {
                object.setValue(value, forKeyPath: key)
            }
            CATransaction.commit()
            ViewAnimation.stack.removeLast()
        }, completion:nil)
        ShapeLayer.disableActions = disable
    }
}
