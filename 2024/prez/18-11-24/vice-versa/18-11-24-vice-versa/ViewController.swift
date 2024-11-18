//
//  ViewController.swift
//  18-11-24-vice-versa
//
//  Created by student on 18.11.2024.
//

import UIKit
import SwiftUI

struct MyView: View {
    var body: some View {
        Text("SwiftUI! 🔥")
    }
}

class ViewController: UIViewController {
    
    var label: UILabel = {
        let l = UILabel()
        l.text = "Hello"
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.frame = CGRect(x: 20,
                             y: 120,
                             width: 200,
                             height: 30)
        
        let ctrl = UIHostingController(rootView: MyView())
        view.addSubview(ctrl.view)
        
        ctrl.view.frame = CGRect(x: 20,
                             y: 240,
                             width: 200,
                             height: 30)
        
        // Do any additional setup after loading the view.
    }


}

