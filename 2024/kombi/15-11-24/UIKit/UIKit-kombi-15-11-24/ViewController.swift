//
//  ViewController.swift
//  UIKit-kombi-15-11-24
//
//  Created by Filip Vabroušek on 11/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func changeText(_ sender: Any) {
        counter += 1
        
        myLabel.text = "Counter \(counter)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

