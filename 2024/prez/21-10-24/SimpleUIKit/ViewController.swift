//
//  ViewController.swift
//  SimpleUIKit
//
//  Created by student on 21.10.2024.
//

import UIKit


// Inherit from UIView to make custom element
// or from UILabel
// myLabel: UILabel ....
class ViewController: UIViewController {
    
    var count = 0
    var globalLabel: UILabel!
/* For storyboard
 alt click + drag from storyboard
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func clicked(_ sender: Any) {
        count += 1
        myLabel.text = "Hello \(count)"
    }
    */
    
    func addLabel() -> UILabel {
        let l: UILabel  = {
            let l = UILabel()
            l.text = "Hello"
            l.font = UIFont.boldSystemFont(ofSize: 23)
            return l
        }()
        
        globalLabel = l
        
        return l
    }
    
   
    
    @objc
    func increaseCounter(){
        count += 1
        globalLabel.text = "Counter \(count)"
        
    }
    
    func addButton() -> UIButton {
        let btn: UIButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("Counter", for: [])
            btn.addTarget(self, 
                          action: #selector(self.increaseCounter), for: .touchUpInside
            )
            return btn
        }()
        
        return btn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lbl = self.addLabel()
        let btn = self.addButton()
        lbl.frame = CGRect(x: 20, y: 20, width: 200, height: 100)
        view.addSubview(lbl)
        
        btn.frame = CGRect(x: 20, y: 80, width: 200, height: 100)
 
        view.addSubview(btn)
        // Do any additional setup after loading the view.
    }


}

