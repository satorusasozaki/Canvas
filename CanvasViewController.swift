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
    var faceOriginalCenter: CGPoint!
    var trayDefaultCenter = CGPoint(x: 187, y: 525)
    var trayCenterWhenOpen = CGPoint(x: 187.5, y: 527.5)
    var trayCenterWhenClose = CGPoint(x: 187.5, y: 765.0)
    var isTrayOpen = true
    var newlyCreatedFace: UIImageView!
    @IBOutlet weak var trayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("original: \(happyFaceImageView.center)")
        
    }
    // How to do animation like control center? 
    // Move view when pan is ended but it is not smooth meaning it stops once when pan ended and start animating
    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        let tappedPoint = sender.location(in: self.view)

        if sender.state == UIGestureRecognizerState.began {
            trayOriginalCenter = sender.view?.center
            let velocity = sender.velocity(in: self.view!).y
                } else if sender.state == UIGestureRecognizerState.changed {
            let yOffset = sender.translation(in: self.view).y
            sender.view?.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + yOffset)
        } else if sender.state == UIGestureRecognizerState.ended {
            //print("Tray center: \(sender.view?.center)")
            if sender.velocity(in: self.view!).y > 0 {
                let velocity = sender.velocity(in: self.view!).y
                // moving down
                //print("Moving down with velocity: \(sender.velocity(in: self.view!).y)")
//                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity-100, options: UIViewAnimationOptions.curveEaseIn, animations: {
//                    sender.view?.center = self.trayCenterWhenClose
//                    
//                }, completion: { (animationIsFinished: Bool) in
//                    
//                })
                UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                    sender.view?.center = self.trayCenterWhenClose
                }, completion: { ( animationIsFinished :Bool) in
                    
                })

            } else {
                // moving up
                //print("Moving up with velocity: \(sender.velocity(in: self.view!).y)")
                UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                    sender.view?.center = self.trayCenterWhenOpen
                }, completion: { ( animationIsFinished :Bool) in
                    
                })
            }

        }
    }
    @IBAction func onFacePanGesture(_ sender: UIPanGestureRecognizer) {
        print("onFacePanGesture is called")
        if sender.state == UIGestureRecognizerState.began {
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            self.view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            faceOriginalCenter = newlyCreatedFace.center
            print("begin: \(newlyCreatedFace.center)")
            print("faceOriginalCenter: \(faceOriginalCenter)")
            
        } else if sender.state == UIGestureRecognizerState.changed {
            let offset = sender.translation(in: self.view)
            newlyCreatedFace.center = CGPoint(x: faceOriginalCenter.x + offset.x, y: faceOriginalCenter.y + offset.y)
            print("change: \(newlyCreatedFace.center)")
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    @IBOutlet weak var happyFaceImageView: UIImageView!

    // Pan gesture is not calling
    // need to research how to prioritize two gestures
    @IBAction func onTreyTapGesture(_ sender: UITapGestureRecognizer) {
        
//        if isTrayOpen {
//            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 50, options: UIViewAnimationOptions.curveEaseIn, animations: {
//                sender.view?.center = self.trayCenterWhenClose
//                
//            }, completion: { (animationIsFinished: Bool) in
//                self.isTrayOpen = false
//            })
//
//        } else {
//            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 50, options: UIViewAnimationOptions.curveEaseIn, animations: {
//                sender.view?.center = self.trayCenterWhenOpen
//            
//            }, completion: { (animationIsFinished: Bool) in
//                self.isTrayOpen = true
//            })
//        }
        
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
