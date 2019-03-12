//
//  ViewController.swift
//  Maps
//
//  Created by 徐一鸣 on 3/4/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MKMapView {
    
    var zoomLevel: Int {
        
        get {
            return Int(log2(360 * (Double(self.frame.size.width/256)
                / self.region.span.longitudeDelta)) + 1)
        }
      
        set (newZoomLevel){
            setCenterCoordinate(coordinate: self.centerCoordinate, zoomLevel: newZoomLevel,
                                animated: false)
        }
    }
    
    private func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: Int,
                                     animated: Bool){
        let span = MKCoordinateSpan(latitudeDelta: 0,
                                    longitudeDelta: 360 / pow(2, Double(zoomLevel)) * Double(self.frame.size.width) / 256)
        setRegion(MKCoordinateRegion(center: centerCoordinate, span: span), animated: animated)
    }
}

class ViewController: UIViewController, MKMapViewDelegate {

   
    
    var coordinate2D = CLLocationCoordinate2DMake(40.7449609, -74.0242124)
    
    var camera = MKMapCamera()
    var pitch = 0

    

    
    @IBOutlet weak var changeMapType: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var changePitch: UIButton!
    
    
    @IBOutlet weak var zoomSlider: UISlider!
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    @IBAction func changeMapType(_ sender: UIButton) {
        switch mapView.mapType{
        
        case .standard: mapView.mapType = .satellite
        case .satellite: mapView.mapType = .hybrid
        case .hybrid: mapView.mapType = .satelliteFlyover
        case .satelliteFlyover: mapView.mapType = .hybridFlyover
        case .hybridFlyover: mapView.mapType = .standard
       
        case .mutedStandard:
            return
        }
        
    }
    
    @IBAction func changePitch(_ sender: UIButton) {
        pitch = (pitch + 15) % 90
        sender.setTitle("\(pitch)º", for: .normal)
           mapView.camera.pitch = CGFloat(pitch)
    }
    
    @IBAction func locationPicker(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
//        mapView.removeAnnotations(mapView.annotations)
        
        switch index {
        case 0:   //stevens campus
            coordinate2D = CLLocationCoordinate2DMake(40.7449609, -74.0242124)

            //single addition
//            let stevensPin = TenAnnotation(coordinate: coordinate2D, title: "Stevens Campus", subtitle: "Hoboken eduaction")
//            mapView.addAnnotation(stevensPin)
            
        case 1:   //Juliana Apartment
            coordinate2D = CLLocationCoordinate2DMake(40.7459124, -74.0402085)
            updateMapCamera(heading: 245.0, altitute: 1000)

//            let julianaPin = TenAnnotation(coordinate: coordinate2D, title: "Juliana Apartment", subtitle: "Hoboken Apartment")
//            mapView.addAnnotation(julianaPin)
            return
        case 2:    // Vine Apartment
            coordinate2D = CLLocationCoordinate2DMake(40.7486395, -74.038804)
            updateMapCamera(heading: 180.0, altitute: 1000)
            
//            let vinePin = MKPointAnnotation()
//            vinePin.coordinate = coordinate2D
//            vinePin.title = "Vine Apartment"
//            vinePin.subtitle = "Light rail way"
//            mapView.addAnnotation(vinePin)
            
            return
        case 3:    //Kith
            coordinate2D = CLLocationCoordinate2DMake(40.725942,-73.9965976)
            
            updateMapCamera(heading: 12.0, altitute: 50)
            
//            let kithPin = MKPointAnnotation()
//            kithPin.coordinate = coordinate2D
//            kithPin.title = "Kith"
//            kithPin.subtitle = "Fashion clothes"
//            mapView.addAnnotation(kithPin)
           
            return
        case 4:    //columbus circle
            coordinate2D = CLLocationCoordinate2DMake(40.7678638,-73.9820188)
            
        default:
            coordinate2D = CLLocationCoordinate2DMake(40.7449609, -74.0242124)
        }
        updateMapRegion(rangeSpan: 100)
    }
    
    func updateMapRegion(rangeSpan:CLLocationDistance){
        
        let region = MKCoordinateRegion(center: coordinate2D, latitudinalMeters: rangeSpan, longitudinalMeters: rangeSpan)
        mapView.region = region
    }
    
    func updateMapCamera(heading: CLLocationDirection, altitute: CLLocationDistance) {
        
        camera.centerCoordinate = coordinate2D
        camera.heading = heading
        camera.altitude = altitute
        camera.pitch = 0.0
        changePitch.setTitle("0º", for: .normal)
        
        mapView.camera = camera
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKAnnotationView()
        guard let annotation = annotation as? TenAnnotation
            else {
                return nil
        }
        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotation.identifier) {
            annotationView = dequedView
        } else{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation.identifier)
        }
        //annotationView.pinTintColor = UIColor.blue
        
        annotationView.image = UIImage(named: "pin_1")
        
        annotationView.canShowCallout = true
        
        let paragragh = UILabel()
        paragragh.numberOfLines = 0
        paragragh.font = UIFont.preferredFont(forTextStyle: .caption1)
        paragragh.text = annotation.subtitle
        paragragh.numberOfLines = 1
        paragragh.adjustsFontSizeToFitWidth = true
        
        annotationView.detailCalloutAccessoryView = paragragh
        
        if annotation.interPinPhoto == nil{
            annotation.interPinPhoto = UIImage(named: "pin_1")
        }
        
        annotationView.leftCalloutAccessoryView = UIImageView(image: annotation.interPinPhoto)
        annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let vc = AnnotationDetailViewController(nibName: "AnnotationDetailViewController", bundle: nil )
        vc.annotation = view.annotation as? TenAnnotation
        present(vc, animated: true, completion: nil)
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        zoomSlider.value = Float(mapView.zoomLevel)
    }
    
    
    @IBAction func sliderChange(_ sender: Any) {
        mapView.zoomLevel = Int(zoomSlider.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateMapRegion(rangeSpan: 100)
        mapView.addAnnotations(PizzaHistoryAnnotations().annotations)
        mapView.delegate = self
        self.mapView.mapType = MKMapType.standard
        
        let center: CLLocationCoordinate2D = self.mapView.region.center
        let latDelta = 0.1
        let longDelta = 0.1
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: currentLocationSpan)
        
        self.mapView.setRegion(currentRegion, animated: true)
    }


}

