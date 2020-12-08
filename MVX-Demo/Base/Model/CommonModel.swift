//
//  CommonModel.swift
//  MVX
//
//  Created by chenhui on 2020/12/8.
//  Copyright © 2020 vhuichen. All rights reserved.
//

import UIKit

class CommonModel: NSObject {
    var content: String?
    
    convenience init(_ aString:String) {
        self.init()
        content = aString
        
        customSetup()
    }
    
    func customSetup() {
        
    }
    
}
