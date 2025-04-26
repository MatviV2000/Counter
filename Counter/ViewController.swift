//
//  ViewController.swift
//  Counter
//
//  Created by Василий Матвиенко on 26.04.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterAddButton: UIButton!
    
    var counter: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(counter)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonAddTouch(_ sender: Any) {
        print("Нажатие")
        counter += 1
    }
}

