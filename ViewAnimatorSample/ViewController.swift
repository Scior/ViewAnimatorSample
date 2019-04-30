//
//  ViewController.swift
//  ViewAnimatorSample
//
//  Created by Suita Fujino on 2019/04/30.
//  Copyright © 2019 Suita Fujino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var subview: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subview = UIView(frame: CGRect(x: 20, y: 50, width: 60, height: 60))
        subview.backgroundColor = UIColor.blue
        self.view.addSubview(subview)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ViewAnimator.start()
            .delay(1.0)
            .duration(0.8)
            .animate {
                self.subview.transform = self.subview.transform.translatedBy(x: 0, y: 200.0)
            }
            .duration(0.8)
            .animate {
                self.subview.transform = self.subview.transform.translatedBy(x: 200.0, y: 0)
            }
            .duration(0.8)
            .animate {
                self.subview.transform = self.subview.transform.translatedBy(x: 0, y: -200.0)
            }
            .duration(0.8)
            .animate {
                self.subview.transform = self.subview.transform.translatedBy(x: -200.0, y: 0)
            }
            .resolve()
    }


}

