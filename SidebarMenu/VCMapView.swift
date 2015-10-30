//
//  VCMapView.swift
//  TManager
//
//  Created by WEI on 15/10/29.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation
import MapKit

extension Match_detailController: MKMapViewDelegate {
 
	// 1
	func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
		if let annotation = annotation as? Artwork {
			let identifier = "pin"
			var view: MKPinAnnotationView
			if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
				as? MKPinAnnotationView { // 2
					dequeuedView.annotation = annotation
					view = dequeuedView
			} else {
				// 3
				view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
				view.canShowCallout = true
				view.calloutOffset = CGPoint(x: -5, y: 5)
				let btn = UIButton(type: UIButtonType.DetailDisclosure)
				
				
				view.rightCalloutAccessoryView = btn as UIView
			}
			return view
		}
		return nil
	}
	
	func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
		calloutAccessoryControlTapped control: UIControl) {
			let location = view.annotation as! Artwork
			let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
			location.mapItem().openInMapsWithLaunchOptions(launchOptions)
	}
}