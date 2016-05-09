//
//  Park.swift
//  Park View
//
//  Created by Vu Truong on 5/8/16.
//  Copyright © 2016 Chris Wagner. All rights reserved.
//

import Foundation
import MapKit

class Park {
    
    var boundary: [CLLocationCoordinate2D]
    var boundaryPointsCount: NSInteger
    
    var midCoordinate: CLLocationCoordinate2D
    var overlayTopLeftCoordinate: CLLocationCoordinate2D
    var overlayTopRightCoordinate: CLLocationCoordinate2D
    var overlayBottomLeftCoordinate: CLLocationCoordinate2D

    //generates the bottom right coordinate using the bottom left and top right coordinates
    var overlayBottomRightCoordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake(overlayBottomLeftCoordinate.latitude,
                                              overlayTopRightCoordinate.longitude)
        }
    }
    
    //generates an MKMapRect object, which is a bounding rectangle for the park’s boundaries
    var overlayBoundingMapRect: MKMapRect {
        get {
            let topLeft = MKMapPointForCoordinate(overlayTopLeftCoordinate)
            let topRight = MKMapPointForCoordinate(overlayTopRightCoordinate)
            let bottomLeft = MKMapPointForCoordinate(overlayBottomLeftCoordinate)
            
            return MKMapRectMake(topLeft.x,
                                 topLeft.y,
                                 fabs(topLeft.x-topRight.x),
                                 fabs(topLeft.y - bottomLeft.y))
        }
    }
    
    var name: String?
    
    //The initializer, init(filename:), will read all of the information from the plist file into the defined properties
    init(filename: String) {
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        //uses CLLocationCoordinate2DMake() to make a CLLocationCoordinate2D structure using latitude and longitude coordinates. MapKit API’s use CLLocationCoordinate2D structures to represent geographical locations
        let midPoint = CGPointFromString(properties!["midCoord"] as! String)
        midCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(midPoint.x), CLLocationDegrees(midPoint.y))
        
        let overlayTopLeftPoint = CGPointFromString(properties!["overlayTopLeftCoord"] as! String)
        overlayTopLeftCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(overlayTopLeftPoint.x),
                                                              CLLocationDegrees(overlayTopLeftPoint.y))
        
        let overlayTopRightPoint = CGPointFromString(properties!["overlayTopRightCoord"] as! String)
        overlayTopRightCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(overlayTopRightPoint.x),
                                                               CLLocationDegrees(overlayTopRightPoint.y))
        
        let overlayBottomLeftPoint = CGPointFromString(properties!["overlayBottomLeftCoord"] as! String)
        overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(overlayBottomLeftPoint.x),
                                                                 CLLocationDegrees(overlayBottomLeftPoint.y))
        
        let boundaryPoints = properties!["boundary"] as! NSArray
        
        boundaryPointsCount = boundaryPoints.count
        
        boundary = []
        
        for i in 0...boundaryPointsCount-1 {
            let p = CGPointFromString(boundaryPoints[i] as! String)
            boundary += [CLLocationCoordinate2DMake(CLLocationDegrees(p.x), CLLocationDegrees(p.y))]
        }
    }
}