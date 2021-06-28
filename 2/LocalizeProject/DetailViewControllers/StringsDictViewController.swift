//
//  StringsDictViewController.swift
//  LocalizeProject
//
//  Created by Назаренко Денис Игоревич on 27.06.2021.
//

import UIKit

class StringDictViewController: UIViewController {
    
    private lazy var lectureLabel = UILabel()
    
    private lazy var stepper = UIStepper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(lectureLabel)
        lectureLabel.translatesAutoresizingMaskIntoConstraints = false
        lectureLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lectureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stepper.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.isContinuous = false
        stepper.tintColor = .green
        view.addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.bottomAnchor.constraint(
            equalTo: lectureLabel.topAnchor,
            constant: -16
        ).isActive = true
        stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stepper.sendActions(for: .valueChanged)
    }
    
    @objc dynamic
    private func valueChanged(_ stepper: UIStepper) {
        let value = stepper.value
        let rounded = Int(value)
        let format =  NSLocalizedString("Any", comment: "")
        lectureLabel.text = String.localizedStringWithFormat(format, rounded)
    }
}
