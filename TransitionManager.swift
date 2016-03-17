//
//  TransitionManager.swift
//  Transitions
//
//  Created by Филипп Белов on 3/18/16.
//  Copyright © 2016 Philip Belov. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
    var presenting = true
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        let container = transitionContext.containerView()!
        container.backgroundColor = UIColor.blackColor()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
        let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
        
        toView.transform = self.presenting ? offScreenLeft : offScreenRight
        print(self.presenting ? offScreenLeft : offScreenRight)
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .CurveEaseIn, animations: {
            fromView.transform = self.presenting ? offScreenRight : offScreenLeft
                toView.transform = CGAffineTransformIdentity
            }, completion: { finished in
                transitionContext.completeTransition(true)
        })
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }

}
