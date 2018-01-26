//
//  MapViewController.swift
//  QatarSales
//
//  Created by Usman  on 29/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    var lastCameraPosition: GMSCameraPosition?
    var movingMarker: GMSMarker?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 31.5546, longitude: 74.3572, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.delegate = self
        
        movingMarker = GMSMarker()
        movingMarker?.position = CLLocationCoordinate2D(latitude: 31.5546, longitude: 74.3572)
        movingMarker?.map = mapView
        
        navigationController?.navigationBar.barTintColor = UIColor.navigationBackgroundColor
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func loadMapView()
    {
        
    }
    
    func mapView(_ pMapView: GMSMapView, didChange position: GMSCameraPosition)
    {
        if (movingMarker != nil)
        {
            if lastCameraPosition == nil
            {
                lastCameraPosition = position
            }
            let lat: Double = position.target.latitude - lastCameraPosition!.target.latitude
            let lng: Double = position.target.longitude - lastCameraPosition!.target.longitude
            lastCameraPosition = position
            
            let newCoords: CLLocationCoordinate2D = CLLocationCoordinate2DMake(movingMarker!.position.latitude + lat, movingMarker!.position.longitude + lng)
            movingMarker?.position = newCoords
            
            return
        }
    }
    
}
