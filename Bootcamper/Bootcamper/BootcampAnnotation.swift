//
//  BootcampAnnotation.swift
//  Bootcamper
//
//  Created by Dulio Denis on 1/14/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import Foundation
import MapKit

class BootcampAnnotation: NSObject, MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
