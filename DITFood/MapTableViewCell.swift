//
//  MapTableViewCell.swift
//  DITFood
//
//  Created by D7703_11 on 2018. 6. 27..
//  Copyright © 2018년 dit.ac.kr. All rights reserved.
//

import UIKit
import MapKit
class MapTableViewCell: UITableViewCell {
    @IBOutlet weak var detaMapView: MKMapView!
    
    func configure(location: String) {
        
        let Clgeocoder = CLGeocoder()
        geoCoder.geocodeAddressString(location, completionHandler: {
            
            (Placemarks: [CLPlacemark]?, error: Error?) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            if placemarks != nil {
                let placemark = placemarks![0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                //annotation.title = self.name
                //annotation.subtitle = self.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.detailMapView.addAnnotation(annotation)
                    
                    // Set zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.detailMapView.setRegion(region, animated: true)
                }
            }
            
        })
      
        func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
}
