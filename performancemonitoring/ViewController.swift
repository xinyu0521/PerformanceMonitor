//
//  ViewController.swift
//  performancemonitoring
//
//  Created by zhanx630 on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(test), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func test() {
        
        
        
//        ViewController.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hhhhh), object: nil)
    
        self.perform(#selector(hhhhh), with: nil, afterDelay: 0.5)
    }
    
    @objc func hhhhh() {
        print("hhhhhh");
    }
}


