//
//  SecondMVCController.swift
//  MVC
//
//  Created by vchan on 2021/2/21.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation

class SecondMVCController: NSObject, SecondMVCViewDelegate {
    let mvcView = SecondMVCView(title: "SecondMVC");
    var model: SecondMVCModel?
    
    override init() {
        super.init()
        
        mvcView.delegate = self
        
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //初始化 Model
            self.model = SecondMVCModel("init value")
            self.model?.addObserver(self, forKeyPath: "content", options: [.new, .initial], context: nil)
            self.mvcView.valueLabel.text = self.model?.content
        }
    }
    
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
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
