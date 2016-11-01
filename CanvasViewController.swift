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
        } else if sender.state == UIGestureRecognizerState.ended {
            print("Gesture ended at: \(point)")
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
