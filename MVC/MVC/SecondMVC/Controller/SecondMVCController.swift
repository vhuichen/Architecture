//
//  SecondMVCController.swift
//  MVC
//
//  Created by vchan on 2021/2/21.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation

class SecondMVCController: NSObject {
    let mvcView = SecondMVCView()
    var model: SecondMVCModel?
    
    override init() {
        super.init()
        
        mvcView.delegate = self
        
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //初始化 Model
            self.model = SecondMVCModel()
            self.model?.title = "SecondMVC"
            self.model?.content = "init value"
            
            self.setModel(self.model!)
        }
    }
    
    
    func setModel(_ model: SecondMVCModel) {
        model.addObserver(self, forKeyPath: "content", options: [.new, .initial], context: nil)
        self.mvcView.titleLabel.text = model.title
        self.mvcView.valueLabel.text = model.content
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if let _ = object as? SecondMVCModel, keyPath == "content" {
            if let new = change?[NSKeyValueChangeKey.newKey] {
                self.mvcView.valueLabel.text = new as? String
            }
        }
    }
    
    deinit {
        self.model?.removeObserver(self, forKeyPath: "content")
    }
}

extension SecondMVCController: SecondMVCViewDelegate {
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
    }
}
