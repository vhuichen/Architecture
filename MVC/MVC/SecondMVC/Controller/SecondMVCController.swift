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
        //模拟网络获取Model
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            //初始化 Model
            let model = SecondMVCModel()
            model.title = "SecondMVC"
            model.content = "init value"
            
            DispatchQueue.main.async {
                self.viewSetModel(model)
            }
        }
    }
    
}

//MARK: -
extension SecondMVCController {
    func viewSetModel(_ model: SecondMVCModel) {
        self.kvoController.unobserve(self.model)
        
        self.model = model
        self.mvcView.titleLabel.text = model.title
        self.mvcView.valueLabel.text = model.content
        
        self.kvoController.observe(model, keyPath: "content", options: NSKeyValueObservingOptions.new) { [weak self] (observer, model, dict) in
            if let new = dict[NSKeyValueChangeKey.newKey.rawValue] {
                self?.mvcView.valueLabel.text = new as? String
            }
        }
    }
}

//MARK: - 
extension SecondMVCController: SecondMVCViewDelegate {
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
    }
}
