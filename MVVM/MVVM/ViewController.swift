//
//  ViewController.swift
//  MVVM
//
//  Created by vchan on 2021/2/19.
//

import UIKit

class ViewController: UIViewController {
    let firstMVVMView = FirstMVVMView()
    let firstMVVMViewModel = FirstMVVMViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = UIScreen.main.bounds.size.width - 20
        
        firstMVVMView.frame = CGRect(x: 10, y: 30, width: width, height: 100)
        view.addSubview(firstMVVMView)
        
        self.firstMVVMViewModel.fetchData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.firstMVVMView.bindViewModel(self.firstMVVMViewModel)
        }
    }
    
}
