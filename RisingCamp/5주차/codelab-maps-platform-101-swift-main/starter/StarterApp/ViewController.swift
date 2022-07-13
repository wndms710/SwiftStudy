// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    private var mapView: GMSMapView!
    private var circle: GMSCircle? = nil

  override func loadView() {
      
      let camera: GMSCameraPosition = GMSCameraPosition(latitude: -33.86, longitude: 151.20, zoom: 12)
      
      mapView = GMSMapView(frame: .zero, camera: camera)
      self.view = mapView
      mapView.delegate = self
  }

  override func viewDidLoad() {
    super.viewDidLoad()
      
      let mapCenter = CLLocationCoordinate2D(latitude: mapView.camera.target.latitude, longitude: mapView.camera.target.longitude)
      let marker = GMSMarker(position: mapCenter)
      
      marker.icon = UIImage(named: "custom_pin.png")
      marker.map = mapView
      
      circle = GMSCircle(position: marker.position, radius: 1000)
      circle?.fillColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 0.5)
      circle?.map = mapView
  }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapView.animate(toLocation: marker.position)
        return false
    }

}

