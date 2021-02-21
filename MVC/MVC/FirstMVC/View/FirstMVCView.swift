//
//  FirstMVCView.swift
//  MVC
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class FirstMVCView: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    let commitButtom = UIButton()
    let valueLabel = UILabel()
    
    var callback: ((String)->())?
        
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
        callback?(textField.text ?? "")
    }
    
    func setModel(_ model: FirstMVCModel) {
        valueLabel.text = model.content
        
        model.addObserver(self, forKeyPath: "content", options: [.new, .initial], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if let _ = object as? FirstMVCModel, keyPath == "content" {
            if let new = change?[NSKeyValueChangeKey.newKey] {
                valueLabel.text = new as? String
            }
        }
        
    }
}
