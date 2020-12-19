//
//  ViewController.swift
//  AnimationPractice
//
//  Created by 송주 on 2020/12/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let curveView = CurveView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        curveView.center = self.view.center
        self.view.addSubview(curveView)
    }
}

