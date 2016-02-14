//
//  MapViewController.swift
//  Yelp
//
//  Created by Cory Thompson on 2/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
  @IBOutlet weak var mapView: MKMapView!
  
  var locationManager: CLLocationManager!
  var businesses : [Business]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    //let centerLocation = CLLocation(latitude: 37.7833, longitude: -122.4167)
    
    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.distanceFilter = 200
    locationManager.requestWhenInUseAuthorization()
    
    
    for business in businesses {
      let latitude  = business.latitude  as! Double
      let longitude = business.longitude as! Double
      let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      addAnnotationAtCoordinate(coordinates, businessName: business.name!)
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status == CLAuthorizationStatus.AuthorizedWhenInUse {
      locationManager.startUpdatingLocation()
    }
  }
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
      let span = MKCoordinateSpanMake(0.1, 0.1)
      let region = MKCoordinateRegionMake(location.coordinate, span)
      mapView.setRegion(region, animated: false)
    }
  }
  
  func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D, businessName: String) {
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = businessName
    mapView.addAnnotation(annotation)
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
