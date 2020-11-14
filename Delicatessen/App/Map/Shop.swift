//
//  Shop.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit
import MapKit

final class Shop: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(
        title: String?,
        coordinate: CLLocationCoordinate2D,
        subtitle: String?
    ) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
