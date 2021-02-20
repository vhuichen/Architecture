//
//  MVCController.swift
//  MVX
//
//  Created by vchan on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

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
