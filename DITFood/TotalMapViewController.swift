//
//  TotalMapViewController.swift
//  DITFood
//
//  Created by D7703_11 on 2018. 6. 27..
//  Copyright © 2018년 dit.ac.kr. All rights reserved.
//

import UIKit
import MapKit

class TotalMapViewController: UIViewController {
    @IBOutlet weak var totalMapView: MKMapView!
    var totalFoodStores: [FoodStore] = []
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewMap(items: totalFoodStores)

        // Do any additional setup after loading the view.
    }
    func  viewMap(items: [FoodStore]) {
        for item in items {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(item.address , completionHandler: {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let error = error {
                    print(error)
                    return
                }
                
                if placemarks != nil {
                    let placemark = placemarks![0]
                    print(placemarks![0])
                    
                    // pin point 을 저장
                    let annotation = MKPointAnnotation()
                    
                    if let location = placemark.location {
                        // Add annotation
                        annotation.title = item.name
                        annotation.subtitle = item.type
                        annotation.coordinate = location.coordinate
                        self.annotations.append(annotation)
                        self.totalMapView.addAnnotations(self.annotations)
                        
                    }
                }
                self.totalMapView.showAnnotations(self.annotations, animated: true)
            })
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
