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
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var download: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()

        LoadST.LoadLines()
        NSTimer.scheduledTimerWithTimeInterval(0.0875, target: self, selector: "updateProgressView", userInfo: nil, repeats: true)
        progressView.setProgress(0, animated: false)
        button.hidden = true
        button.alpha = 0
    }
    func updateProgressView() {
        if progressView.progress != 1 {
            self.progressView.progress += 1/80
        } else {
            self.button.hidden = false
            UIView.animateWithDuration(0.4, animations: { () -> Void in self.button.alpha = 1})
            download.hidden = true
        }

    }
}
