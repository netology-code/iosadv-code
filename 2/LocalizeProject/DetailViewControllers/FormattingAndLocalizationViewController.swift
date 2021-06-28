//
//  FormattingAndLocalizationViewController.swift
//  LocalizeProject
//
//  Created by Назаренко Денис Игоревич on 25.06.2021.
//

import UIKit

class FormattingAndLocalizationViewController: UIViewController {
    
    private lazy var localizedDateLabel = UILabel()
    private lazy var localizedDistanceLabel = UILabel()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        print(dateFormatter.locale.description)
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        return dateFormatter
    }()
    
    private lazy var distanceFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        print(formatter.locale.description)
        return formatter
    }()
    
    private lazy var rootStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        rootStack.spacing = 16
        view.addSubview(rootStack)
        rootStack.translatesAutoresizingMaskIntoConstraints = false
        rootStack.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 16
        ).isActive = true
        rootStack.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 16
        ).isActive = true
        rootStack.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
        rootStack.axis = .vertical
        rootStack.distribution = .fill
        
        let dateStack = UIStackView()
        dateStack.axis = .horizontal
        dateStack.translatesAutoresizingMaskIntoConstraints = false
        let dateLabel = UILabel()
        dateLabel.text = NSLocalizedString("Date", comment: "")
        dateLabel.textAlignment = .left
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let date = Date()
        let formattedDate = dateFormatter.string(from: date)
        localizedDateLabel.textAlignment = .right
        localizedDateLabel.text = formattedDate
        dateStack.addArrangedSubview(dateLabel)
        dateStack.addArrangedSubview(localizedDateLabel)
        rootStack.addArrangedSubview(dateStack)

        let distanceStack = UIStackView()
        distanceStack.translatesAutoresizingMaskIntoConstraints = false
        let distanceLabel = UILabel()
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.textAlignment = .left
        distanceLabel.text = NSLocalizedString("Distance", comment: "")
        let distance = Measurement(value: 100, unit: UnitLength.kilometers)
        let formattedDistance = distanceFormatter.string(from: distance)
        localizedDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        localizedDistanceLabel.textAlignment = .right
        localizedDistanceLabel.text = formattedDistance
        
        distanceStack.addArrangedSubview(distanceLabel)
        distanceStack.addArrangedSubview(localizedDistanceLabel)
        rootStack.addArrangedSubview(distanceStack)
    }
}
