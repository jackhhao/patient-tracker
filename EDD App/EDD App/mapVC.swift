//
//  mapVC.swift
//  EDD App
//
//  Created by Arya Tschand on 12/21/20.
//

import UIKit
import MapKit

class mapVC: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.291390, longitude: -74.246360)// .. populate your center
        let latitudinalMeters: CLLocationDistance = 1000
        let longitudinalMeters: CLLocationDistance = 1000
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
        self.map.setRegion(region, animated: false) // Set to yes to animate, you said initial load so I image this won't be visible anyways.

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.291390, longitude: -74.246360)
        map.addAnnotation(annotation)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
