//
//  ViewController.swift
//  SimpleGeocoding02
//
//  Created by D7703_16 on 2019. 10. 14..
//  Copyright © 2019년 201720632. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let addr = "부산광역시 부산진구 양지로 54"
        let lat = 35.16587040
        let lng = 129.07284610
        let loc = CLLocation(latitude: lat, longitude: lng)
        var pins = [MKPointAnnotation]()
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(loc, completionHandler: {
            (placemarks:[CLPlacemark]?, error : Error?) in
            if error != nil{
            print(error!)
            }
            if let myPlacemarks = placemarks {
                let myPlacemark = myPlacemarks.first
                print(myPlacemark?.country)
                print(myPlacemark?.administrativeArea)
                print(myPlacemark?.locality)
                print(myPlacemark?.name)
                //핀 꼽기
                let pin = MKPointAnnotation()
                pin.coordinate = (myPlacemark?.location!.coordinate)!
                pin.title = "동의과학대학교"
                pin.subtitle = "우리들의 꿈이 자라는 곳!"
                pins.append(pin)
                self.mapView.showAnnotations(pins, animated: true)
                } else {
                    print("nil 발생")
                }
        })
        }
        
        
        
        //인자 2개 받음. 2번째거는 함수로 받음.
//        geocoder.geocodeAddressString(addr, completionHandler: {
//            (placemarks:[CLPlacemark]?, error : Error?) in
//            if error != nil{
//                print(error!)
//            }
//            // optional binding check
//            if let myPlacemarks = placemarks {
//                let myPlacemark = myPlacemarks.first
//                print(myPlacemark?.country)
//                print(myPlacemark?.location?.coordinate.latitude)
//
//                //핀 꼽기
//                let pin = MKPointAnnotation()
//                pin.coordinate = (myPlacemark?.location!.coordinate)!
//                pin.title = "동의과학대학교"
//                pin.subtitle = "우리들의 꿈이 자라는 곳!"
//                pins.append(pin)
//               self.mapView.showAnnotations(pins, animated: true)
//
//            } else {
//                print("nil 발생")
//            }
//
//        })
//
//        //후행 클로저(trailing closure
//        //geocoder.geocodeAddressString(addr) {
//        //    (placemarks:[CLPlacemark]?, error : Error?) in
//        //    if error != nil{
//        //        print(error!)
//        //    }
//        geocoder.geocodeAddressString(addr) {
//            placemarks, error in
//            if error != nil{
//                print(error!)
//            }
//            // optional binding check
//           if let myPlacemarks = placemarks {
//                let myPlacemark = myPlacemarks.first
//                print(myPlacemark?.country)
//                print(myPlacemark?.location?.coordinate)
//
//                //핀 꼽기
//                let pin = MKPointAnnotation()
//                pin.coordinate = (myPlacemark?.location!.coordinate)!
//                pin.title = "동의과학대학교"
//                pin.subtitle = "우리들의 꿈이 자라는 곳!"
//                pins.append(pin)
//                self.mapView.showAnnotations(pins, animated: true)
//
//            } else {
//               print("nil 발생")
//            }
//
//        }
    }


