//
//  SecondMVCModel.swift
//  MVC
//
//  Created by vchan on 2021/2/21.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation

class SecondMVCModel: NSObject {
    @objc dynamic var content: String?
    
    convenience init(_ aString: String) {
        self.init()
        content = aString
    }
}
