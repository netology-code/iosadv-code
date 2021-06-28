//
//  InfoPlistViewController.swift
//  LocalizeProject
//
//  Created by Назаренко Денис Игоревич on 24.06.2021.
//

import UIKit
import CoreLocation

class InfoPlistViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var appNameDescLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    
    
    private lazy var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        appNameLabel.text = appName
    }
    
    
    @IBAction func requestAccess(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
    }
}
