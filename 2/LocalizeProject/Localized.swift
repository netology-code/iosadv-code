//
//  LocaliseStruct.swift
//  LocalizeProgect
//
//  Created by Константин Савялов on 24.05.2021.
//

import Foundation

struct Localized {

    let dateFormatter = DateFormatter()
    var datePosix = "yyyy.MM.dd G 'at' HH:mm:ss zzz"
    let date = Date()

    func returnDate() -> String {
        return dateFormatter.string(from: date)
    }
    
    func returnTime() -> String {
        dateFormatter.dateFormat = "hh"
        return dateFormatter.string(from: date)
    }
    
    func returnMinutes() -> String {
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: date)
    }
    
    func returnSecond() -> String {
        dateFormatter.dateFormat = "ss"
        return dateFormatter.string(from: date)
    }
    
    
    init() {
        dateFormatter.setLocalizedDateFormatFromTemplate(datePosix)
    }

}
