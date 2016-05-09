//
//  ParkMapOverLay.swift
//  Park View
//
//  Created by Vu Truong on 5/8/16.
//  Copyright © 2016 Chris Wagner. All rights reserved.
//

import UIKit
import MapKit

//import the MapKit header to get those classes in scope
// Conforming to the MKOverlay means you also have to inherit from NSObject

class ParkMapOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(park: Park) {
        boundingMapRect = park.overlayBoundingMapRect
        coordinate = park.midCoordinate
    }
}
