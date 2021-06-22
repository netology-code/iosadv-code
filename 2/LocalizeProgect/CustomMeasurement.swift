//
//  CustomMesuriment.swift
//  LocalizeProgect
//
//  Created by Константин Савялов on 24.05.2021.
//

import Foundation

struct CustomMeasurement {
    
    let local = Locale.current
    let formatter = MeasurementFormatter()
    
    func measurement() -> String {
        formatter.locale = local
        let versta = UnitLength(symbol: "Верст", converter: UnitConverterLinear(coefficient: 1088.6))
        let inVersts = Measurement(value: 66, unit: versta)
        return formatter.string(from: inVersts)
    }
    
}
