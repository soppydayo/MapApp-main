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
        
        questLabel1.roundCorners(cornerRadius: 10)
        questLabel2.roundCorners(cornerRadius: 10)
        questLabel3.roundCorners(cornerRadius: 10)
        questLabel4.roundCorners(cornerRadius: 10)
        
        setupQuestLabels()
    }
    
    func setupQuestLabels() {
        
        let QuestLabels = [questLabel1, questLabel2, questLabel3, questLabel4]
        
        for label in QuestLabels {
            
            label?.layer.cornerRadius = 8.0
            label?.clipsToBounds = true
        }
        
        displayRandomQuest()
        
    }
    
    func displayRandomQuest() {
        var shuffledList = questList
        shuffledList.shuffle()
        
        let QuestLabels = [questLabel1, questLabel2, questLabel3, questLabel4]
        
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
