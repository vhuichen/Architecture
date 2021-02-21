//
//  FirstMVCController.swift
//  MVC
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

/*
 将监听逻辑放到 View 中有几个问题
 1、View 不应该持有 Model 的，所以 View 销毁时怎么移除监听呢？
 2、如果重复调用了 setModel 方法，那么将会造成多次监听，如果设置之前先移除监听，当没有监听时移除监听也会造成崩溃
 */
class FirstMVCController: NSObject {
    let mvcView = FirstMVCView(title: "FirstMVC");
    var model: FirstMVCModel?
    
    override init() {
        super.init()
        
        mvcView.callback = { [self] aString in
            self.model?.content = aString
        }
        
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            //初始化 Model
            self.model = FirstMVCModel("init value")
            DispatchQueue.main.async {
                self.mvcView.setModel(self.model!)
            }
        }
    }
}
