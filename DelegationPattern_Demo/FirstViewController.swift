//
//  ViewController.swift
//  DelegationPattern_Demo
//
//  Created by Chinh Ng on 9/6/22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }

    func configUI() {
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .yellow
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            // 4: Conform protocol
            destinationVC.delegate = self
        }
    }
    
}

// 5: Save data from secondVC
extension FirstViewController: NameTxtFieldDelegate {
    func nameFromTxtField(name: String) {
        nameLabel.text = "Your name is \(name)."
    }
}
