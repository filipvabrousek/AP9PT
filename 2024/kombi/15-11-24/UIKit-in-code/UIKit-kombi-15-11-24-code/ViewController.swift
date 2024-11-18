//
//  ViewController.swift
//  UIKit-kombi-15-11-24-code
//
//  Created by Filip Vabroušek on 11/15/24.
//

import UIKit
import SwiftUI


struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

class ViewController: UIViewController {
    
    var count = 0
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Count is zero"
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Increment", for: [])
        button.addTarget(self,
                         action: #selector(increment),
                         for: .touchUpInside)
        button.setTitleColor(UIColor.green, for: [])
        return button
    }()
    
    @objc func increment() {
            count += 1
        label.text = "Count is \(count)"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(button)
        
        
        label.frame = CGRect(x: 50, y: 200, width: 200 , height: 50)
        button.frame = CGRect(x: 50, y: 250, width: 100 , height: 50)
        
        
        let ctrl = UIHostingController(rootView: MyView())
        view.addSubview(ctrl.view)
        ctrl.view.frame = view.bounds
        
        
       /* let constraints: [NSLayoutConstraint] = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]*/
        // Do any additional setup after loading the view.
    }


}

