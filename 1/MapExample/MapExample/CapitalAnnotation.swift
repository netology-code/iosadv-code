import Foundation
import MapKit

// MKAnnotationView

final class CapitalAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(
        title: String,
        coordinate: CLLocationCoordinate2D,
        info: String
    ) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        
        super.init()
    }
}


extension CapitalAnnotation {
    
    static func make() -> [CapitalAnnotation] {
        return [
            .init(
                title: "Лондон",
                coordinate: CLLocationCoordinate2D(
                    latitude: 51.507222,
                    longitude: -0.1275
                ),
                info: "столица Великобритании"
            ),
            .init(
                title: "Москва",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.75222,
                    longitude: 37.61556
                ),
                info: "столица России"
            ),
            .init(
                title: "Осло",
                coordinate: CLLocationCoordinate2D(
                    latitude: 59.95,
                    longitude: 10.75
                ),
                info: "Самое популярное в Осло имя — Мухаммед"
            ),
            .init(
                title: "Париж",
                coordinate: CLLocationCoordinate2D(
                    latitude: 48.8567,
                    longitude: 2.3508
                ),
                info: "В Париже расположено самое старое на планете кладбище домашних животных"
            ),
            .init(
                title: "Рим",
                coordinate: CLLocationCoordinate2D(
                    latitude: 41.9,
                    longitude: 12.5
                ),
                info: "В Фонтан Треви туристы ежегодно бросают до 1,5 млн евро"
            ),
            .init(
                title: "Вашингтон",
                coordinate: CLLocationCoordinate2D(
                    latitude: 38.895111,
                    longitude: -77.036667
                ),
                info: "В Вашингтоне запрещен выпуск конфет на палочке"
            ),
            .init(
                title: "Минск",
                coordinate: CLLocationCoordinate2D(
                    latitude: 53.9,
                    longitude: 27.5667
                ),
                info: "У Минска есть собственное море – так часто называют Заславское водохранилище"
            ),
            .init(
                title: "Кишинев",
                coordinate: CLLocationCoordinate2D(
                    latitude: 47.0056,
                    longitude: 28.8575
                ),
                info: "Кишинев расположен на семи холмах, формирующих круг."
            ),
        ]
    }
}
