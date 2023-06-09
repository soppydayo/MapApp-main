
//
//  pesentPickerViewController.swift
//  MapApp
//
//  Created by 白川創大 on 2023/05/21.
//
import UIKit
import RealmSwift
import MapKit
import CoreLocation

class presentPickerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var TitleText: UITextField!
    @IBOutlet var HonbunText: UITextField!
    
    let locationManager = CLLocationManager()
    
    let realm = try! Realm()
    var postData: PostData?
    
    let defaultImage = UIImage(named: "78791")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        TitleText.delegate = self
        HonbunText.delegate = self
        
        let postdata: PostData? = read()
        
        TitleText.text = postdata?.title
        HonbunText.text = postdata?.text
        
        // 位置情報の利用許可をリクエスト
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        TitleText.text = ""
        HonbunText.text = ""
        
        
        
    }
    

    
    func read() -> PostData? {
        return realm.objects(PostData.self).first
    }
    
    func createitem(item: PostData) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func generateID() -> String {
        let id = UUID().uuidString // ランダムなUUIDを生成
        return id
    }
    
    @IBAction func postButtonTapped() {
        // 入力チェック
        guard photoImageView.image != nil else {
            displayAlert(message: "写真を撮影してください")
            return
        }

        guard let title = TitleText.text, !title.isEmpty else {
            displayAlert(message: "タイトルを入力してください")
            return
        }

        guard let honbun = HonbunText.text, !honbun.isEmpty else {
            displayAlert(message: "本文を入力してください")
            return
        }

        let currentLocation = locationManager.location
        let item = PostData()
        let currentDate = Date() // 現在の年月日を取得

        item.title = TitleText.text ?? ""
        item.text = HonbunText.text ?? ""
        item.date = currentDate // 現在の年月日を保存
        item.id = generateID() // IDを生成して保存
        item.longitude = currentLocation?.coordinate.longitude ?? 0.0 // 経度を保存
        item.latitude = currentLocation?.coordinate.latitude ?? 0.0 // 緯度を保存

        if let image = photoImageView.image {
            item.imageData = image.jpegData(compressionQuality: 0.8) // UIImageをDataに変換して保存
        }

        postData = item
        saveData()

        let alert: UIAlertController = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)

        TitleText.text = ""
        HonbunText.text = ""

        photoImageView.image = defaultImage

        guard let homeViewController = navigationController?.viewControllers.first(where: { $0 is HomeViewController }) as? HomeViewController else {
            return
        }

        homeViewController.addPinToMap(with: currentLocation)

        navigationController?.popViewController(animated: true)
    }
    
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "入力エラー", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //カメラボタンを起動する
    @IBAction func cameraButtonTapped() {
        presentPickerController(sourceType: .camera)
    }
    
    func presentPickerController(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    
    // 撮影が終わった時に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func saveData() {
        guard let postData = postData else {
            return
        }
        
        try! realm.write {
            realm.add(postData)
        }
    }
    
    // 位置情報の利用許可状態が変更された時に呼ばれる
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            // 位置情報の取得を開始
            locationManager.startUpdatingLocation()
        }
    }
    
    
}
