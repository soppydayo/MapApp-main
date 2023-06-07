//
//  QuestViewController.swift
//  MapApp
//
//  Created by 白川創大 on 2023/05/21.
//

import UIKit

class QuestViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    @IBOutlet var questLabel1: UILabel!
    @IBOutlet var questLabel2: UILabel!
    @IBOutlet var questLabel3: UILabel!
    @IBOutlet var questLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //    func setupExampleLabels() {
    
    //        let questLabels = [questLabel1, questLabel2, questLabel3, questLabel4]
    
    //        for label in questLabels {
    
    //    label?.layer.cornerRadius = 5.0
    //       label?.clipsToBounds = true
}

//       func displayRandomExample() {
//別ファイルで定義した配列を取得
//          var shuffledQuest =  QuestFolder()
//         shuffledQuest.shuffle()


//         for (index, label) in questLabels.enumerated() {
//            label?.text = shuffledQuest[index]
//        UIView.animate(withDuration: 0.1, animations: {
//           label?.transform = CGAffineTransform.identity
//               })
//           }
//       }




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

//}
//}
