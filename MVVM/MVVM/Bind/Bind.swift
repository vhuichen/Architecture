//
//  Bind.swift
//  MVVM
//
//  Created by vchan on 2021/3/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

import Foundation
import KVOController

extension NSObject {
    func bind(_ observerKeypath: String,
              _ observe: NSObject,
              _ observeKeypath: String) {
        self.kvoControllerNonRetaining.observe(observe, keyPath: observeKeypath, options: NSKeyValueObservingOptions.new) { (observer, observe, dict) in
            if let new = dict[NSKeyValueChangeKey.newKey.rawValue],
               let observer = observer as? NSObject {
                observer.setValue(new, forKey: observerKeypath)
            }
        }
    }
    
    func unbind(_ observe: NSObject,
                _ observeKeypath: String) {
        self.kvoControllerNonRetaining.unobserve(observe, keyPath: observeKeypath)
    }
}
