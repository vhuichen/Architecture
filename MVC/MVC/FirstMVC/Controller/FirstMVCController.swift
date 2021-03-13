//
//  FirstMVCController.swift
//  MVC
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

/*
 MVC 的 C 不一定是 UIViewController 的子类
 简单的页面可以直接将 UIViewController 当成 MVC 的 C
 */
class FirstMVCController: NSObject {
    let mvcView = FirstMVCView();
    var model: FirstMVCModel?
    
    override init() {
        super.init()
        
        mvcView.delegate = self
        
        fetchData()
    }
    
    func fetchData() {
        //模拟网络获取Model
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            //初始化 Model
            self.model = FirstMVCModel()
            self.model?.title = "FirstMVC"
            self.model?.content = "init value"
            DispatchQueue.main.async {
                self.mvcView.setModel(self.model!)
            }
        }
    }
}

extension FirstMVCController: FirstMVCViewDelegate {
    func textFieldCommit(_ value: String?) {
        self.model?.content = value
    }
}
