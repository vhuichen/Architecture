//
//  MVCController.swift
//  MVX
//
//  Created by chenhui on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

/*
 这里 MVC 里面的 C 以 Controller 结尾命名，会有一种误导，感觉像是系统提供的 UIViewController 的子类，所以在实际项目中我会把这个 C 命名为 XXXMVCHelper
 */
class MVCController: NSObject {
    let mvcView = MVCView(title: "MVC");
    var model:CommonModel?
    
    override init() {
        super.init()
        
        mvcView.callback = { [self] aString in
            self.model?.content = aString
        }
        
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.model = CommonModel("init value")
//            addObserver(self.model ?? <#default value#>, forKeyPath: "content", options: .new, context: nil)
        }
    }
    
    
}
