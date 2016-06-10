//
//  GerStartedViewController.swift
//  Metro
//
//  Created by Иван on 30.05.16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class GetStartedViewController: UIViewController {
    

    let LoadST: LoadData = LoadData()
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var Image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.image = UIImage(named: "buildsucceded")
        LoadST.LoadLines()
        progressView.hidden = true
        NSTimer.scheduledTimerWithTimeInterval(0.0875, target: self, selector: "updateProgressView", userInfo: nil, repeats: true)
        progressView.setProgress(0, animated: false)
    }
    func updateProgressView() {
        if progressView.progress != 1 {
            self.progressView.progress += 1/80
        } else {
//            UIView.animateWithDuration(0.4, animations: { () -> Void in self.button.alpha = 1})
            performSegueWithIdentifier("Starter", sender: nil)
        }

    }
}
