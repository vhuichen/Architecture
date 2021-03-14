//
//  SecondMVPPresenter.swift
//  MVP
//
//  Created by vchan on 2021/3/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation
import KVOController

protocol SecondMVPPresenterProtocol {
    func textFieldCommit(_ value: String?)
    func setView(_ view: SecondMVPViewProtocol)
}

class SecondMVPPresenter : NSObject {
    var model: SecondMVPModel?
    
    weak var view: SecondMVPViewProtocol?
    
    override init() {
        super.init()
        
        fetchData()
    }
    
    func fetchData() {
        //模拟网络获取Model
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            //初始化 Model
            let model = SecondMVPModel()
            model.title = "SecondMVP"
            model.content = "init value"
            DispatchQueue.main.async {
                self.viewSetModel(model)
            }
        }
    }
}

//MARK: -
extension SecondMVPPresenter {
    func viewSetModel(_ model: SecondMVPModel) {
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

extension SecondMVPPresenter : SecondMVPPresenterProtocol {
    func setView(_ view: SecondMVPViewProtocol) {
        self.view = view
    }
    
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
    }
}
