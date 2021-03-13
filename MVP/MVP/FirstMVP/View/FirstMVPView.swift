//
//  FirstMVPView.swift
//  MVP
//
//  Created by vchan on 2021/3/14.
//

import Foundation

import UIKit
import KVOController

protocol FirstMVPViewProtocol : NSObject {
    func setContent(_ content: String?)
    func setTitle(_ title: String?)
}

//MARK: -
class FirstMVPView: UIView {
    private let titleLabel = UILabel()
    private let textField = UITextField()
    private let commitButtom = UIButton()
    private let valueLabel = UILabel()
    
    private var presenter: FirstMVPPresenterProtocol?
    
    init(presenter: FirstMVPPresenterProtocol) {
        super.init(frame: CGRect())
        
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
        
        self.presenter = presenter
        self.presenter?.setView(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func commitButtomClick() {
        presenter?.textFieldCommit(textField.text)
    }
}

//MARK: -
extension FirstMVPView: FirstMVPViewProtocol {
    func setTitle(_ title: String?) {
        titleLabel.text = title
    }
    
    func setContent(_ content: String?) {
        valueLabel.text = content
    }
}
