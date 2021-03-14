//
//  SecondMVPController.swift
//  MVP
//
//  Created by vchan on 2021/3/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import UIKit

class SecondMVPController: UIViewController {
    let presenter = SecondMVPPresenter()
    lazy var secondMVPView = SecondMVPView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        presenter.setView(self)
        secondMVPView.delegate = self
        
        let width = UIScreen.main.bounds.size.width - 20
        
        secondMVPView.frame = CGRect(x: 10, y: 30, width: width, height: 100)
        view.addSubview(secondMVPView)
    }
}

//MARK: -
extension SecondMVPController: SecondMVPViewDelegate {
    func textFieldCommit(_ value: String?) {
        presenter.textFieldCommit(value)
    }
}

//MARK: -
extension SecondMVPController: SecondMVPViewProtocol {
    func setTitle(_ title: String?) {
        secondMVPView.titleLabel.text = title
    }
    
    func setContent(_ content: String?) {
        secondMVPView.valueLabel.text = content
    }
}
