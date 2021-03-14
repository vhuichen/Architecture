//
//  FirstMVVMViewModel.swift
//  MVVM
//
//  Created by vchan on 2021/3/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation

class FirstMVVMViewModel: NSObject {
    var model: FirstMVVMModel?
    
    var titleString: String?
    @objc dynamic var contentString: String?
    
    func fetchData() {
        //模拟网络获取Model
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            //初始化 Model
            let model = FirstMVVMModel()
            model.title = "FirstMVVM"
            model.content = "init value"
            DispatchQueue.main.async {
                self.setModel(model)
            }
        }
    }
    
    func setModel(_ model: FirstMVVMModel) {
        if let model = self.model {
            self.unbind(model, "content")
        }
        
        self.model = model
        self.titleString = model.title
        self.contentString = model.content
        
        self.kvoControllerNonRetaining.observe(model, keyPath: "content", options: NSKeyValueObservingOptions.new) { (observer, observe, dict) in
            if let new = dict[NSKeyValueChangeKey.newKey.rawValue] as? String {
                self.contentString = new.appending("^w^")
            }
        }
    }
    
}

extension FirstMVVMViewModel {
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
    }
}

