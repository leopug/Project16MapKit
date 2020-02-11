//
//  Capital.swift
//  Project16MapKit
//
//  Created by Ana Caroline de Souza on 11/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {

    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title:String, coordinate:CLLocationCoordinate2D, info: String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
}
