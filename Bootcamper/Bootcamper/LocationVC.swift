//
//  SecondViewController.swift
//  Bootcamper
//
//  Created by Dulio Denis on 1/10/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000 // meters
    
    let locationManager = CLLocationManager()
    
    
    // MARK: View Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthorizationStatus()
    }
    
    
    // MARK: TableView Delegate Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    // MARK: Location Functions
    
    func locationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    // MARK: MapView Delegate Functions
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let location = userLocation.location {
            centerMapOnLocation(location)
        }
    }
}

