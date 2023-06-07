//
//  HalfModalViewController.swift
//  MapApp
//
//  Created by 白川創大 on 2023/06/04.
//

import UIKit
import RealmSwift

class HalfModalViewController: UIViewController {
    @IBOutlet var modalImage: UIImageView!
    @IBOutlet var modalTitle: UILabel!
    @IBOutlet var modalText: UILabel!
    
    var annotation: CustomMKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        if let annotation = annotation, let postData = annotation.postData {
            modalImage.image = UIImage(data: postData.imageData!)
            modalTitle.text = postData.title
            modalText.text = postData.text
        }
    }
}

















/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

