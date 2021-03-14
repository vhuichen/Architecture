//
//  SecondMVPView.swift
//  MVP
//
//  Created by vchan on 2021/3/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import UIKit

protocol SecondMVPViewDelegate : NSObject {
    func textFieldCommit(_ value: String?)
}

protocol SecondMVPViewProtocol : NSObject {
    func setTitle(_ title: String?)
    func setContent(_ content: String?)
}

//MARK: -
class SecondMVPView: UIView {
    let titleLabel = UILabel()
    private let textField = UITextField()
    private let commitButtom = UIButton()
    let valueLabel = UILabel()
    
    var delegate: SecondMVPViewDelegate?
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    
    func setupUI() {
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
