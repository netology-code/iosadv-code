//
//  SecondViewController.swift
//  LocalizeProgect
//
//  Created by Константин Савялов on 24.05.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    let dateLocal = Localized()
    let measurement = CustomMeasurement()
    
    // Для простоты свойства прописаны здесь, правильно писать в расширении String
    let date = NSLocalizedString("CurrentDate", comment: "Локализация текущей даты")
    let time = NSLocalizedString("CurrentHour", comment: "Локализация текущего часа")
    let minutes = NSLocalizedString("CurrentMinutes", comment: "Локализация текущей минуты")
    let second = NSLocalizedString("CurrentSecond", comment: "Локализация текущей секунды")
    let measure = NSLocalizedString("CurrentMeasurement", comment: "Локализация своей единицы")
    
    @IBOutlet weak var currentDateLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var timeValue: UILabel!

    @IBOutlet weak var castomMeasurementLable: UILabel!
    @IBOutlet weak var castomMeasurementValueLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentDateLable.text = self.dateLocal.returnDate()
        self.dateLable.text = date
        self.timeLable.text = time
        self.timeValue.text = timeUniversal()
        self.castomMeasurementLable.text = measure
        self.castomMeasurementValueLable.text = measurement.measurement()
        
    }
    
    private func timeUniversal() -> String{
        let anyTime = NSLocalizedString("Any", comment: "Локализация текущего часа")
        let t = self.dateLocal.returnTime()
        let count: UInt = UInt((t as NSString).integerValue)
        let resultString = String.localizedStringWithFormat(anyTime, count)
        return resultString
    }
    
}
