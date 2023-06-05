//
//  HalfModalViewController.swift
//  MapApp
//
//  Created by 白川創大 on 2023/06/04.
//

import UIKit
import MapKit

class HalfModalViewController: UIViewController{
    @IBOutlet var modalImage: UIImageView!
    @IBOutlet var modalTitle:  UILabel!
    @IBOutlet var modalText:  UILabel!
   
    
    
}

class CustumMKAnnotationView: MKAnnotationView {
    let postData: PostData
    var title: String
    var text: String
    var date: Date
    var imageData: Data?
    var id: String
    var latitude: Double
    var longitude: Double
    
    init(postData: PostData, title: String, text: String, date: Date, imageData: Data?, id: String, latitude: Double, longitude: Double) {
        self.postData = postData
        self.title = title
        self.text = text
        self.date = date
        self.imageData = imageData
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        
        super.init(annotation: nil, reuseIdentifier: nil)  // スーパークラスのイニシャライザを呼び出す
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
