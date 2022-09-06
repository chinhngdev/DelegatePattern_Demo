//
//  SecondViewController.swift
//  DelegationPattern_Demo
//
//  Created by Chinh Ng on 9/6/22.
//

import UIKit

// 1: Define protocol
protocol NameTxtFieldDelegate: AnyObject {
    func nameFromTxtField(name: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    // 2: Define delegate
    weak var delegate: NameTxtFieldDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxtField.delegate = self

        configUI()
    }
    
    func configUI() {
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.backgroundColor = .yellow
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        // 3: Pass data
        self.delegate?.nameFromTxtField(name: nameTxtField.text ?? "")
        self.dismiss(animated: true)
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTxtField.endEditing(true)
        return true
    }
}
