//
//  ViewController.swift
//  MVC
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstMVCController = FirstMVCController()
    let secondMVCController = SecondMVCController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = UIScreen.main.bounds.size.width - 20
        
        firstMVCController.mvcView.frame = CGRect(x: 10, y: 30, width: width, height: 100)
        view.addSubview(firstMVCController.mvcView)
        
        secondMVCController.mvcView.frame = CGRect(x: 10, y: 150, width: width, height: 100)
        view.addSubview(secondMVCController.mvcView)
        
    }
}

