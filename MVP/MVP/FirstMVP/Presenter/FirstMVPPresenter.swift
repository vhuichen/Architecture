//
//  FirstMVPPresenter.swift
//  MVP
//
//  Created by vchan on 2021/3/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation

protocol FirstMVPPresenterProtocol {
    func textFieldCommit(_ value: String?)
    func setView(_ view: FirstMVPViewProtocol)
}

class FirstMVPPresenter : NSObject {
    var model: FirstMVPModel?
    
    weak var view: FirstMVPViewProtocol?
    
    override init() {
        super.init()
        
        fetchData()
    }
    
    func fetchData() {
        //模拟网络获取Model
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            //初始化 Model
            let model = FirstMVPModel()
            model.title = "FirstMVP"
            model.content = "init value"
            DispatchQueue.main.async {
                self.viewSetModel(model)
            }
        }
    }
}

//MARK: -
extension FirstMVPPresenter {
    func viewSetModel(_ model: FirstMVPModel) {
        self.kvoController.unobserve(self.model)
        
        self.model = model
        self.view?.setTitle(model.title)
        self.view?.setContent(model.content)
        
        self.kvoController.observe(model, keyPath: "content", options: NSKeyValueObservingOptions.new) { [weak self] (observer, model, dict) in
            if let new = dict[NSKeyValueChangeKey.newKey.rawValue] {
                self?.view?.setContent(new as? String)
            }
        }
    }
}

extension FirstMVPPresenter : FirstMVPPresenterProtocol {
    func setView(_ view: FirstMVPViewProtocol) {
        self.view = view
    }
    
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
    }
}
