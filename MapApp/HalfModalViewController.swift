//
//  HalfModalViewController.swift
//  MapApp
//
//  Created by 白川創大 on 2023/06/04.
//

import UIKit
import MapKit

class HalfModalViewController: UIViewController{
    
    var str = ""
    
    @IBOutlet var modalImage: UIImageView!
    @IBOutlet var modalTitle:  UILabel!
    @IBOutlet var modalText:  UILabel!
    
    
    
    
   
    
    
}
class CustomAnnotationView: MKAnnotationView {
    let postData: PostData
    
    init(postData: PostData, annotation: MKAnnotation, reuseIdentifier: String?) {
        self.postData = postData
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

