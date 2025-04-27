//
//  ViewController.swift
//  Counter
//
//  Created by Василий Матвиенко on 26.04.2025.
//

import Foundation
import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    
    
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var decrementButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementButton.setTitleColor(.systemRed, for: .normal)
        resetButton.setTitleColor(.systemGray, for: .normal)
    }
    
    private var counter: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(counter)"
        }
    }
    
    private var formatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter
    }()
    
    private func scrollDown() {
        historyTextView.scrollRangeToVisible(
            NSRange(
                location: historyTextView.text.count - 1,
                length: 1
            )
        )
    }

    @IBAction private func incrementButtonTouch(_ sender: Any) {
        print("Нажатие +1")
        
        counter += 1
        historyTextView.text += "\(formatter.string(from: Date.now)): значение изменено на +1\n"
        scrollDown()
    }
    
    @IBAction private func decrementButtonTouch(_ sender: Any) {
        print("Нажатие -1")

        if counter > 0 {
            counter -= 1
            historyTextView.text += "\(formatter.string(from: Date.now)): значение изменено на -1\n"
        } else {
            historyTextView.text += "\(formatter.string(from: Date.now)): попытка уменьшить значение счётчика ниже 0\n"
        }
        scrollDown()
    }
    
    @IBAction private func resetButtonTouch(_ sender: Any) {
        print("Нажатие reset")

        counter = 0
        historyTextView.text += "\(formatter.string(from: Date.now)) значение сброшено\n"
        scrollDown()
    }
}
