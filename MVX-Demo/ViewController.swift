//
//  ViewController.swift
//  MVX
//
//  Created by chenhui on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let stackView = UIStackView()
    
    let mvcController = MVCController()
    let mvcController1 = MVCController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.frame = CGRect(x: 10, y: 50, width: UIScreen.main.bounds.size.width - 20, height: 800)
        view.addSubview(stackView)
        
        
        stackView.addArrangedSubview(mvcController.mvcView)
        stackView.addArrangedSubview(mvcController1.mvcView)

    }


}

