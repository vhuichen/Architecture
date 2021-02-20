//
//  ViewController.swift
//  MVX
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mvcController = MVCController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = UIScreen.main.bounds.size.width - 20
        
        mvcController.mvcView.frame = CGRect(x: 10, y: 30, width: width, height: 75)
        view.addSubview(mvcController.mvcView)
        
    }
}

