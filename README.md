# Transitions
A class which allows you to implement custom animations when transitioning between different view controllers

## Description
There's a project which contains a TransitionManager class which allows you to easily create and use custom animations when transitioning between different views. 

## Adding your own custom animation
In order to implement your own animation you need to modify the animateTransition method of TransitionManager class (see the ‘TransitionManager.swift’ file for that). There's a simple a example implementation of the animateTransition method provided in the class.

## Don't Forget!
To use the TransitionManager class properly you need to set the tansitioning delegates of the source and the destination view controllers. See the example ViewController.swift file included in the project for that.
## Note 
You can't use the TransitionManager class with custom segues created in storyboard. However, you can use it when you initialize a destination view controller by using command: 
    let secondViewController = storyboard!.instantiateViewControllerWithIdentifier("SecondViewController") as! UIViewController
And then calling:
    presentViewController(secondViewController, animated: true, completion: nil)
Please, notice that you need to set the identifier of the destination view controller in the storyboard to call the 'instantiateViewControllerWithIdentifier' method.
