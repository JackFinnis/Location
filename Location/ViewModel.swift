//
//  ViewModel.swift
//  Change
//
//  Created by Jack Finnis on 16/07/2022.
//

import Foundation
import CoreLocation
import UIKit

class ViewModel: NSObject, ObservableObject {
    @Published var location = CLLocation()
    @Published var previousLocation = CLLocation()
    @Published var status: CLAuthorizationStatus
    @Published var showError = false
    @Published var showWelcomeView = false
    @Published var metric = UserDefaults.standard.bool(forKey: "unit") { didSet {
        UserDefaults.standard.set(metric, forKey: "unit")
    }}
    
    let manager = CLLocationManager()
    
    override init() {
        status = manager.authorizationStatus
        super.init()
        manager.delegate = self
        if status == .authorizedWhenInUse {
            startUpdatingLocation()
        } else {
            showWelcomeView = true
        }
    }
    
    var speedUnit: String { metric ? "kmh" : "mph" }
    func speed(from mps: Double) -> String {
        if mps == -1 { return "-" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        let number = metric ? mps * 3.6 : mps * 2.23694
        return formatter.string(from: NSNumber(value: number))!
    }
    
    var altitudeUnit: String { metric ? "m" : "ft" }
    func altitude(from metres: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        let number = metric ? metres : metres * 3.28084
        return formatter.string(from: NSNumber(value: number))!
    }
    
    func buttonTapped() {
        if status == .denied {
            showError = true
        } else {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

extension ViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        previousLocation = location
        location = locations.first!
        showWelcomeView = false
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
        if status == .authorizedWhenInUse {
            startUpdatingLocation()
        } else if status == .denied {
            showError = true
        }
    }
}
