//
//  Match_detailController.swift
//  SidebarMenu
//
//  Created by WEI on 15/10/22.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

import Foundation
import MapKit
import AddressBook


class Match_detailController:UIViewController,CLLocationManagerDelegate{

	@IBOutlet weak var transpancy: UIImageView!
	
	let locationManager = CLLocationManager()
	var annotation: MKPointAnnotation?
	var myLocation = CLLocation()
	@IBOutlet weak var MapView: MKMapView!

	
	@IBAction func back_button(sender: AnyObject) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		print("1")
		if isPresentingInAddMealMode {
			print("2")
			navigationController!.popViewControllerAnimated(true)
		} else {
			print("3")
			dismissViewControllerAnimated(true, completion: nil)
			
		}
	}
	@IBOutlet weak var teamBname: UILabel!
	@IBOutlet weak var teamAname: UILabel!
	@IBOutlet weak var matchdate: UILabel!
	@IBOutlet weak var MatchLocation: UILabel!
	@IBOutlet weak var tournament_name: UILabel!
	var match : Match?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		MapView.delegate = self
		
		let artwork = Artwork(title: "Your match location",
			locationName: (match?.location)!,
			discipline: "Sculpture",
			coordinate: CLLocationCoordinate2D(latitude: Double((match?.lat)!)!, longitude: Double((match?.lon)!)!))

		
		MapView.addAnnotation(artwork)
		
		let blurEffect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bluredEffectView = UIVisualEffectView(effect: blurEffect)
		bluredEffectView.frame = CGRectMake(-13, 140, 380, 380)
		self.transpancy.addSubview(bluredEffectView)
		
		if let matchdetail = match{
			let index=matchdetail.matchDate.startIndex.advancedBy(10)
			teamAname.text = matchdetail.teamAname
			teamBname.text = matchdetail.teamBname
			matchdate.text = matchdetail.matchDate.substringToIndex(index)
			MatchLocation.text = matchdetail.location
			tournament_name.text = matchdetail.TournamentName
			
			annotation = MKPointAnnotation()
			
			myLocation = CLLocation(latitude: Double(matchdetail.lat)!, longitude: Double(matchdetail.lon)!)
			
			annotation!.coordinate = myLocation.coordinate
			
			print(annotation?.coordinate.longitude)
			print(myLocation.coordinate.longitude)
			print(myLocation.coordinate.latitude)
			
			MapView.addAnnotation(annotation!)
			
			
		}

		
		self.locationManager.requestAlwaysAuthorization()
		
		// For use in foreground
		self.locationManager.requestWhenInUseAuthorization()
		
		self.MapView.mapType = MKMapType.Standard
		self.MapView.showsUserLocation = true
		//self.MapView.removeAnnotations(self.MapView.annotations)
		
		
		
		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.startUpdatingLocation()
		}

		
		
		
		
		
		
	}
	
	
	func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		print("Error while updating location " + error.localizedDescription)
	}
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
	{
		//let location = locations.last!
		
		let center = CLLocationCoordinate2D(latitude: myLocation.coordinate.latitude, longitude: myLocation.coordinate.longitude)
		
//		print(location.coordinate.latitude)
//		print(location.coordinate)
		
		
		let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
		
		
		self.MapView.setRegion(region, animated: true)
		
		
		// Add an annotation on Map View
		
		//stop updating location to save battery life
		locationManager.stopUpdatingLocation()
		
	}

	


}