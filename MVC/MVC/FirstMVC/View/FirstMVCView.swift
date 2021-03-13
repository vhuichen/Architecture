//
//  FirstMVCView.swift
//  MVC
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit
import KVOController

protocol FirstMVCViewDelegate {
    func textFieldCommit(_ value: String?);
}

//MARK: -
class FirstMVCView: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    let commitButtom = UIButton()
    let valueLabel = UILabel()
    
    var delegate: FirstMVCViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func commitButtomClick() {
        delegate?.textFieldCommit(textField.text)
    }
}

//MARK: -
extension FirstMVCView {
    func setModel(_ model: FirstMVCModel) {
        valueLabel.text = model.content
        titleLabel.text = model.title
        
        self.kvoController.unobserveAll()
        self.kvoController.observe(model,
                                   keyPath: "content",
                                   options: NSKeyValueObservingOptions.new){ [weak self] (observer, model, dict) in
            if let new = dict[NSKeyValueChangeKey.newKey.rawValue] {
                self?.valueLabel.text = new as? String
            }
        }
    }
}
