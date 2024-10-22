//
//  ViewController.swift
//  Storyboard-22-10-24
//
//  Created by student on 22.10.2024.
//

import UIKit

class ViewController: UIViewController {
    // ctl + drag into code from storyboard
    // just supply name
    
    /* @IBOutlet weak var myLabel: UILabel!
     
     @IBAction func clicked(_ sender: Any) {
     count += 1
     myLabel.text = "Clicked \(count)"
     }
     */
    
    var count = 0
    var globalLabel: UILabel!
    
    lazy var l: UILabel = {
        let la = UILabel()
        la.text = "Hello"
        la.font = UIFont.boldSystemFont(ofSize: 24)
        globalLabel = la
        return la
    }()
    
    @objc
    func increaseCounter(){
        count += 1
        globalLabel.text = "Counter \(count)"
    }
    
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .system) // .infoDark with icon
        btn.setTitle("Counter", for: [])
        btn.addTarget(self, action: #selector(increaseCounter), for: .touchUpInside)
        return btn
    }()
    
    
    
    
    /* SwiftUI
     Button("Counter"){
        count += 1
        globalText = "Counter \(count)"
     }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        btn.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        view.addSubview(btn)
        
        l.frame = CGRect(x: 20, y: 20, width: 200, height: 50)
        view.addSubview(l)
        // Do any additional setup after loading the view.
    }


}

