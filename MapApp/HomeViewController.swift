import UIKit
import MapKit
import CoreLocation
import RealmSwift

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var isMapDelegateSet = false // mapViewのdelegate設定のフラグ
    var isFirstLoad = true // 画面が初回ロードされたかのフラグ
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            guard let postData = sender as? PostData else { return }
            let next = segue.destination
            if let sheet = next.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.preferredCornerRadius = 40.0
                sheet.prefersGrabberVisible = true
            }
                // ここでカスタムクラスに変換
                guard view is CustomAnnotationView else { return }
                
            }
        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ロケーションマネージャーの初期化と設定
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        // ユーザーからの位置情報の利用許可を要求
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true // 現在位置を表示する設定
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // mapViewのdelegateを設定
        mapView.delegate = self
        isMapDelegateSet = true
        
        locationManager.startUpdatingLocation()
        
        // ピンを表示する前に既存のピンを削除する
        mapView.removeAnnotations(mapView.annotations)
        
        // Realmからデータを取得してピンを表示する
        let realm = try! Realm()
        let items = realm.objects(PostData.self)
        
        for item in items {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
            mapView.addAnnotation(annotation)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // mapViewのdelegateを解除
        mapView.delegate = nil
        isMapDelegateSet = false
    }
    
    
    
    
    
    
    
    // 位置情報の利用許可が変更された時に呼ばれるメソッド
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()  // 位置情報の更新を開始
        default:
            break
        }
    }
    
    // 位置情報が更新された時に呼ばれるメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            
            // mapViewのdelegateが設定されている場合のみ地図の表示領域を更新
            if isMapDelegateSet {
                mapView.region = region
                locationManager.stopUpdatingLocation() // 初回ロード時に位置情報の更新を停止
            }
        }
    }
    
    
    
    func presentPickerViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pickerViewController = storyboard.instantiateViewController(withIdentifier: "presentPickerViewController") as! presentPickerViewController
        
        
        navigationController?.pushViewController(pickerViewController, animated: true)
    }
    
    func addPinToMap(with location: CLLocation?) {
        guard let location = location else {
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    
    
}

extension HomeViewController: MKMapViewDelegate {

    
    
    // ピンのビューを作成
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            // 現在位置のピンはデフォルトのビューを使用する
            return nil
        }
        
        let identifier = "CustomAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? CustomAnnotationView
        
        if annotationView == nil {
            guard let postData = (annotation as? CustomAnnotationView)?.postData else {
                return nil
            }
            annotationView = CustomAnnotationView(postData: postData, annotation: annotation, reuseIdentifier: identifier)
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    
    // ピンがタップされた時
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let customAnnotationView = view as? CustomAnnotationView else {
            return
        }
        performSegue(withIdentifier: "toDetail", sender: customAnnotationView.postData)
    }
}





