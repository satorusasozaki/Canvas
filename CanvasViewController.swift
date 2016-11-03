//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Satoru Sasozaki on 11/1/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    var trayOriginalCenter: CGPoint!
    var trayDefaultCenter = CGPoint(x: 187, y: 525)
    var trayCenterWhenOpen = CGPoint(x: 187.5, y: 527.5)
    //var trayCenterWhenClose = CGPoint(x: 187.5, y: 767.5)
    var trayCenterWhenClose = CGPoint(x: 187.5, y: 765.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // How to do animation like control center? 
    // Move view when pan is ended but it is not smooth meaning it stops once when pan ended and start animating
    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        let tappedPoint = sender.location(in: self.view)
        if sender.state == UIGestureRecognizerState.began {
            trayOriginalCenter = sender.view?.center

        } else if sender.state == UIGestureRecognizerState.changed {
            let yOffset = sender.translation(in: self.view).y
           sender.view?.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + yOffset)
        } else if sender.state == UIGestureRecognizerState.ended {
            //print("Tray center: \(sender.view?.center)")
            if sender.velocity(in: self.view!).y > 0 {
                let velocity = sender.velocity(in: self.view!).y
                // moving down
                //print("Moving down with velocity: \(sender.velocity(in: self.view!).y)")
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity-100, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    sender.view?.center = self.trayCenterWhenClose
                    
                }, completion: { (animationIsFinished: Bool) in
                    
                })
            } else {
                // moving up
                //print("Moving up with velocity: \(sender.velocity(in: self.view!).y)")
                UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
                    sender.view?.center = self.trayCenterWhenOpen
                }, completion: { ( animationIsFinished :Bool) in
                    
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
