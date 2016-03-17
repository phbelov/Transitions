//
//  ViewController.swift
//  Transitions
//
//  Created by Филипп Белов on 3/17/16.
//  Copyright © 2016 Philip Belov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.transitioningDelegate = transitionManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toViewController = segue.destinationViewController as UIViewController
        
        toViewController.transitioningDelegate = self.transitionManager
    }

    @IBAction func unwindViewController (sender : UIStoryboardSegue) {
        
    }

    @IBAction func showVC(sender: UIButton) {
        
        let secondViewController = storyboard!.instantiateViewControllerWithIdentifier("SecondViewController") as! UIViewController
        presentViewController(secondViewController, animated: true, completion: nil)
    }
}

