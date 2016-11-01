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
    var trayCenterWhenOpen = CGPoint(x: 187.5, y: 527.5)
    var trayCenterWhenClose = CGPoint(x: 187.5, y: 767.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self.view)
        if sender.state == UIGestureRecognizerState.began {
            print("Gesture began at: \(point)")
            trayOriginalCenter = sender.view?.center
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            let yOffset = sender.translation(in: self.view).y
            sender.view?.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + yOffset)
            
            if sender.velocity(in: self.view!).y > 0 {
                // moving down
                print("Moving down with velocity: \(sender.velocity(in: self.view!).y)")
                UIView.animate(withDuration: 0.7, animations: {
                    sender.view?.center = self.trayCenterWhenClose
                })
            } else {
                // moving up
                print("Moving up with velocity: \(sender.velocity(in: self.view!).y)")
            }
            
            
        } else if sender.state == UIGestureRecognizerState.ended {
            print("Gesture ended at: \(point)")
            print("Tray center: \(sender.view?.center)")
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
