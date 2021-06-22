//
//  ViewController.swift
//  LatitudeAndLongitudeChange
//
//  Created by 羅承志 on 2021/6/17.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view1LatitudeTextField: UITextField!
    @IBOutlet weak var view1LongitudeTextField: UITextField!
    
    @IBOutlet weak var view2LatitudeTextField: UITextField!
    @IBOutlet weak var view2LatitudeMinTextField: UITextField!
    @IBOutlet weak var view2LongitudeTextField: UITextField!
    @IBOutlet weak var view2LongitudeMinTextField: UITextField!
    
    @IBOutlet weak var view3LatitudeTextField: UITextField!
    @IBOutlet weak var view3LatitudeMinTextField: UITextField!
    @IBOutlet weak var view3LatitudeSecTextField: UITextField!
    @IBOutlet weak var view3LongitudeTextField: UITextField!
    @IBOutlet weak var view3LongitudeMinTextField: UITextField!
    @IBOutlet weak var view3LongitudeSecTextField: UITextField!
    
    @IBOutlet weak var mapMapView: MKMapView!
    @IBOutlet weak var enterMarkTextField: UITextField!
    @IBOutlet weak var againButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func conversionView1(_ sender: UIButton) {
        view.endEditing(true)
        //取值TextField的內容String轉為Float
        let view1LatitudeText = view1LatitudeTextField.text!
        let view1LongitudeText = view1LongitudeTextField.text!
        let view1Latitude = Float(view1LatitudeText)
        let view1Longitude = Float(view1LongitudeText)
        
        if view1Latitude != nil, view1Longitude != nil {
            //經緯度轉Int
            let latitude1 = Int(view1Latitude!)
            let longitude1 = Int(view1Longitude!)
            //經分 & 經秒 的度（整數）
            view2LatitudeTextField.text = "\(latitude1)"
            view3LatitudeTextField.text = "\(latitude1)"
            view2LongitudeTextField.text = "\(longitude1)"
            view3LongitudeTextField.text = "\(longitude1)"
            //度轉Int，之後用來轉成Float，以獲得Float型別的整數
            let tempLatitude = Int(view1Latitude!)
            let tempLongitude = Int(view1Longitude!)
            //度轉分
            var latitudeMin = (view1Latitude! - Float(tempLatitude)) * 60
            var longitudeMin = (view1Longitude! - Float(tempLongitude)) * 60
            //經分 & 經秒 的分
            view2LatitudeMinTextField.text = String(format: "%.4f", latitudeMin)
            view3LatitudeMinTextField.text = String(format: "%.0f", latitudeMin)
            view2LongitudeMinTextField.text = String(format: "%.4f", longitudeMin)
            view3LongitudeMinTextField.text = String(format: "%.0f", longitudeMin)
            //分轉Int，之後用來轉成Float，以獲得Float型別的整數
            let tempLatitude2 = Int(latitudeMin)
            let tempLongitude2 = Int(longitudeMin)
            //分轉秒
            var latitudeSec = (latitudeMin - Float(tempLatitude2)) * 60
            var longitudeSec = (longitudeMin - Float(tempLongitude2)) * 60
            //經秒的秒
            view3LatitudeSecTextField.text = String(format: "%.2f", latitudeSec)
            view3LongitudeSecTextField.text = String(format: "%.2f", longitudeSec)
        } else {
            view1LatitudeTextField.text = "請輸入"
            view1LongitudeTextField.text = "請輸入"
        }
        //地圖座標
        let mapLatitude = Double(view1Latitude!)
        let mapLongitude = Double(view1Longitude!)
        
        mapMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
    
    @IBAction func conversionView2(_ sender: UIButton) {
        view.endEditing(true)
        
        let view2LatitudeText = view2LatitudeTextField.text!
        let view2LatitudeMinText = view2LatitudeMinTextField.text!
        let view2LongitudeText = view2LongitudeTextField.text!
        let view2LongitudeMinText = view2LongitudeMinTextField.text!
        let view2Latitude1 = Int(view2LatitudeText)
        let view2Latitude2 = Float(view2LatitudeMinText)
        let view2Longitude1 = Int(view2LongitudeText)
        let view2Longitude2 = Float(view2LongitudeMinText)
        
        if view2Latitude1 != nil, view2Latitude2 != nil, view2Longitude1 != nil, view2Longitude2 != nil {
            //經秒
            view3LatitudeTextField.text = "\(view2Latitude1!)"
            view3LongitudeTextField.text = "\(view2Longitude1!)"
            //View1 經緯度
            let view1Latitude = Float(view2Latitude1!) + view2Latitude2! / 60
            let view1Longitude = Float(view2Longitude1!) + view2Longitude2! / 60
            
            view1LatitudeTextField.text = "\(view1Latitude)"
            view1LongitudeTextField.text = "\(view1Longitude)"
            
            //DMS【分秒】
            //分
            let view3LatitudeMin = Int(view2Latitude2!)
            let view3LongitudeMin = Int(view2Longitude2!)
            
            view3LatitudeMinTextField.text = "\(view3LatitudeMin)"
            view3LongitudeMinTextField.text = "\(view3LongitudeMin)"
            
            //秒
            let view3LatitudeSec = (view2Latitude2! - Float(view3LatitudeMin)) * 60
            let view3LongitudeSec = (view2Longitude2! - Float(view3LongitudeMin)) * 60
            
            view3LatitudeSecTextField.text = String(format: "%.2f", view3LatitudeSec)
            view3LongitudeSecTextField.text = String(format: "%.2f", view3LongitudeSec)
            
            //地圖座標
            let mapLatitude = Double(view1Latitude)
            let mapLongitude = Double(view1Longitude)
            
            mapMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
        } else {
            view2LatitudeTextField.text = "請輸入"
            view2LatitudeMinTextField.text = "請輸入"
            view2LongitudeTextField.text = "請輸入"
            view2LongitudeMinTextField.text = "請輸入"
        }
    }
    
    @IBAction func conversionView3(_ sender: UIButton) {
        view.endEditing(true)
        
        let view3LatitudeText = view3LatitudeTextField.text!
        let view3LatitudeMinText = view3LatitudeMinTextField.text!
        let view3LatitudeSecText = view3LatitudeSecTextField.text!
        let view3LongitudeText = view3LongitudeTextField.text!
        let view3LongitudeMinText = view3LongitudeMinTextField.text!
        let view3LongitudeSecText = view3LongitudeSecTextField.text!
        
        let view3Latitude = Int(view3LatitudeText)
        let view3LatitudeMin = Int(view3LatitudeMinText)
        let view3LatitudeSec = Float(view3LatitudeSecText)
        let view3Longitude = Int(view3LongitudeText)
        let view3LongitudeMin = Int(view3LongitudeMinText)
        let view3LongitudeSec = Float(view3LongitudeSecText)
        
        if view3Latitude != nil, view3LatitudeMin != nil, view3LatitudeSec != nil, view3Longitude != nil, view3LongitudeMin != nil, view3LongitudeSec != nil {
            //View2
            //經緯度
            view2LatitudeTextField.text = "\(view3Latitude)"
            view2LongitudeTextField.text = "\(view3Longitude)"
            //分
            let view2LatitudeMin = Float(view3LatitudeMin!) + (view3LatitudeSec! / 60)
            let view2LongitudeMin = Float(view3LongitudeMin!) + (view3LongitudeSec! / 60)
            
            view2LatitudeMinTextField.text = String(format: "%.4f", view2LatitudeMin)
            view2LongitudeMinTextField.text = String(format: "%.4f", view2LongitudeMin)
            
            //View1 經緯度
            let view1Latitude = Float(view3Latitude!) + (view3LatitudeSec! / 60)
            let view1Longitude = Float(view3Longitude!) + (view3LongitudeSec! / 60)
            
            view1LatitudeTextField.text = String(format: "%.5f", view1Latitude)
            view1LongitudeTextField.text = String(format: "%.5f", view1Longitude)
            
            //地圖座標
            let mapLatitude = Double(view1Latitude)
            let mapLongitude = Double(view1Longitude)
            
            mapMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
        } else {
            view3LatitudeTextField.text = "請輸入"
            view3LatitudeMinTextField.text = "請輸入"
            view3LatitudeSecTextField.text = "請輸入"
            view3LongitudeTextField.text = "請輸入"
            view3LongitudeMinTextField.text = "請輸入"
            view3LongitudeSecTextField.text = "請輸入"
        }
    }
    
    @IBAction func markButton(_ sender: UIButton) {
        view.endEditing(true)
        
        let latitudeText = view1LatitudeTextField.text!
        let longitudeText = view1LongitudeTextField.text!
        let latitude =  Double(latitudeText)
        let longitude = Double(longitudeText)
        
        if latitude != nil, longitude != nil {
            //地圖經緯度、範圍
            mapMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!), latitudinalMeters: 1000, longitudinalMeters: 1000)
            
            //用MKPointAnnotation加入地圖標記
            let enterMark = MKPointAnnotation()
            let enterMarkText = enterMarkTextField.text!
            
            enterMark.title = "\(enterMarkText)"
            enterMark.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            
            //加入mapMapView
            mapMapView.addAnnotation(enterMark)
        }
    }
    
    @IBAction func again(_ sender: UIButton) {
        view1LatitudeTextField.text = ""
        view1LongitudeTextField.text = ""
        view2LatitudeTextField.text = ""
        view2LatitudeMinTextField.text = ""
        view2LongitudeTextField.text = ""
        view2LongitudeMinTextField.text = ""
        view3LatitudeTextField.text = ""
        view3LatitudeMinTextField.text = ""
        view3LatitudeSecTextField.text = ""
        view3LongitudeTextField.text = ""
        view3LongitudeMinTextField.text = ""
        view3LongitudeSecTextField.text = ""
        enterMarkTextField.text = ""
        //地圖回到台灣全景
        mapMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.046184, longitude: 21.517481), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}

