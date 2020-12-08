//
//  BaseView.swift
//  MVX
//
//  Created by chenhui on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class BaseView: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    let commitButtom = UIButton()
    
    convenience init(title: String?) {
        self.init()
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        titleLabel.text = title;
        
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(commitButtom)
        
        titleLabel.frame = CGRect(x: 10, y: 5, width: 100, height: 20)
        textField.frame = CGRect(x: 10, y: 30, width: 200, height: 30)
        commitButtom.frame = CGRect(x: 250, y: 30, width: 44, height: 30)
        
        commitButtom.setTitle("提交", for: .normal)
        commitButtom.backgroundColor = .gray
        commitButtom.addTarget(self, action: #selector(commitButtomClick), for: .touchUpInside)
        
        textField.backgroundColor = .white
        
        setup()
    }
    
    
    func setup() {
        
    }
    
    @objc func commitButtomClick() {
        
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 20, height: 70)
    }

}
