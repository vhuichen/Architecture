//
//  MVCView.swift
//  MVX
//
//  Created by chenhui on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class MVCView: BaseView {
    
    var callback: ((String)->())?
    
    override func setup() {
        super.setup()
    }
    
    override func commitButtomClick() {
        callback?(textField.text ?? "")
    }
}
