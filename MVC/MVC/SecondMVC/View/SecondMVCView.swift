//
//  SecondMVCView.swift
//  MVC
//
//  Created by vchan on 2021/2/21.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import UIKit

protocol SecondMVCViewDelegate {
    func textFieldCommit(_ value: String?);
}

class SecondMVCView: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    let commitButtom = UIButton()
    let valueLabel = UILabel()
    
    var delegate: SecondMVCViewDelegate?
        
    convenience init(title: String?) {
        self.init()
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        titleLabel.text = title;
        
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(commitButtom)
        addSubview(valueLabel)
        
        titleLabel.frame = CGRect(x: 10, y: 5, width: 100, height: 20)
        textField.frame = CGRect(x: 10, y: 30, width: 200, height: 30)
        commitButtom.frame = CGRect(x: 230, y: 30, width: 60, height: 30)
        valueLabel.frame = CGRect(x: 10, y: 70, width: 100, height: 20)
        
        commitButtom.setTitle("Submit", for: .normal)
        commitButtom.backgroundColor = .gray
        commitButtom.addTarget(self, action: #selector(commitButtomClick), for: .touchUpInside)
        
        textField.backgroundColor = .white
    }
    
    @objc func commitButtomClick() {
        delegate?.textFieldCommit(textField.text)
    }
}
