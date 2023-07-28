//
//  QuestViewController.swift
//  MapApp
//
//  Created by 白川創大 on 2023/05/21.
//

import UIKit

class QuestViewController: UIViewController {
    
    @IBOutlet var questLabel1: UILabel!
    @IBOutlet var questLabel2: UILabel!
    @IBOutlet var questLabel3: UILabel!

    @IBOutlet var checkBox1: UIButton!
    @IBOutlet var checkBox2: UIButton!
    @IBOutlet var checkBox3: UIButton!
    @IBOutlet var shuffleButton: UIButton!

    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questLabel1.roundCorners(cornerRadius: 10)
        questLabel2.roundCorners(cornerRadius: 10)
        questLabel3.roundCorners(cornerRadius: 10)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTimeChange), name: UIApplication.significantTimeChangeNotification, object: nil)
                
        displayRandomQuest()
        
        setupQuestLabels()
        
        
        //let checkBoxes = [checkBox1, checkBox2, checkBox3, checkBox4]
    }
    
    func setupQuestLabels() {
        
        let QuestLabels = [questLabel1, questLabel2, questLabel3]
        
        for label in QuestLabels {
            
            label?.layer.cornerRadius = 8.0
            label?.clipsToBounds = true
        }
        
        displayRandomQuest()
        
    }
    
    func displayRandomQuest() {
        var shuffledList = questList
        shuffledList.shuffle()
        
        let QuestLabels = [questLabel1, questLabel2, questLabel3]
        
        UIView.animate(withDuration: 0.1, animations: {
            for (_, label) in QuestLabels.enumerated() {
                label?.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            }
        }) { _ in
            for (index, label) in QuestLabels.enumerated() {
                label?.text = shuffledList[index]
                UIView.animate(withDuration: 0.1, animations: {
                    label?.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    @objc func handleTimeChange() {
        // 日付が変わった時の処理
        displayRandomQuest()
    }
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        if checkBox1.currentImage == UIImage(named: "Blank.png") {
            // ボタンの画像が初期画像の場合、画像を変更します
            let newImage = UIImage(named: "Check.png")
            checkBox1.setImage(newImage, for: .normal)
        } else {
            // ボタンの画像が変化した画像の場合、画像を初期画像に戻します
            let initialImage = UIImage(named: "Blank.png")
            checkBox1.setImage(initialImage, for: .normal)
        }
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        if checkBox2.currentImage == UIImage(named: "Blank.png") {
            // ボタンの画像が初期画像の場合、画像を変更します
            let newImage = UIImage(named: "Check.png")
            checkBox2.setImage(newImage, for: .normal)
        } else {
            // ボタンの画像が変化した画像の場合、画像を初期画像に戻します
            let initialImage = UIImage(named: "Blank.png")
            checkBox2.setImage(initialImage, for: .normal)
        }
    }
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        if checkBox3.currentImage == UIImage(named: "Blank.png") {
            // ボタンの画像が初期画像の場合、画像を変更します
            let newImage = UIImage(named: "Check.png")
            checkBox3.setImage(newImage, for: .normal)
        } else {
            // ボタンの画像が変化した画像の場合、画像を初期画像に戻します
            let initialImage = UIImage(named: "Blank.png")
            checkBox3.setImage(initialImage, for: .normal)
        }
    }
    
    @IBAction func shuffleButtonTapped(){
        
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

//}
//}
