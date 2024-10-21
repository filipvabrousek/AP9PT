//
//  ViewController.swift
//  Simple-UIKit-test
//
//  Created by student on 21.10.2024.
//

import UIKit

class ViewController: UIViewController {

  /*  @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func clicked(_ sender: Any) {
        myLabel.text = "Hello"
    }*/
    
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
    
    func addButton() -> UIButton {
        let btn: UIButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("Counter", for: [])
            btn.addTarget(self, action: #selector(increaseCounter), for: .touchUpInside)
            return btn
        }()
        
        return btn
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = self.addButton()
        btn.frame = CGRect(x: 20, y: 80, width: 200, height: 100)
        view.addSubview(btn)
        
        l.frame = CGRect(x: 20, y: 20, width: 200, height: 50)
        view.addSubview(l)
        
        // Do any additional setup after loading the view.
    }


}

