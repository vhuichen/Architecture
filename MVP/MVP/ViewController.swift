//
//  ViewController.swift
//  MVP
//
//  Created by vchan on 2021/2/19.
//

import UIKit

class ViewController: UIViewController {
    let firstMVPView = FirstMVPView(presenter: FirstMVPPresenter())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = UIScreen.main.bounds.size.width - 20
        
        firstMVPView.frame = CGRect(x: 10, y: 30, width: width, height: 100)
        view.addSubview(firstMVPView)
    }


}

