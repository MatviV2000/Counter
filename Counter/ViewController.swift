//
//  ViewController.swift
//  Counter
//
//  Created by Василий Матвиенко on 26.04.2025.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        incrementButton.tintColor = .systemRed
        //        resetButton.tintColor = .systemGray
        incrementButton.setTitleColor(.systemRed, for: .normal)
        resetButton.setTitleColor(.systemGray, for: .normal)
    }
    
    var counter: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(counter)"
        }
    }
    
    var formatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter
    }()
    
    func scrollDown() {
        historyTextView.scrollRangeToVisible(
            NSRange(
                location: historyTextView.text.count - 1,
                length: 1
            )
        )
    }
    
    func scrollUp() {
        historyTextView.scrollRangeToVisible(
            NSRange(
                location: 0,
                length: 1
            )
        )
    }

    @IBAction func incrementButtonTouch(_ sender: Any) {
        print("Нажатие +1")
        
        counter += 1
        historyTextView.text += "\(formatter.string(from: Date.now)): значение изменено на +1\n"
        scrollDown()
    }
    
    @IBAction func decrementButtonTouch(_ sender: Any) {
        print("Нажатие -1")

        if counter > 0 {
            counter -= 1
            historyTextView.text += "\(formatter.string(from: Date.now)): значение изменено на -1\n"
        } else {
            historyTextView.text += "\(formatter.string(from: Date.now)): попытка уменьшить значение счётчика ниже 0\n"
        }
        scrollDown()
    }
    
    @IBAction func resetButtonTouch(_ sender: Any) {
        print("Нажатие reset")

        counter = 0
        historyTextView.text += "\(formatter.string(from: Date.now)) значение сброшено\n"
        scrollDown()
    }
}
