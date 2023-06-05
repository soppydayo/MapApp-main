//
//  PostData.swift
//  MapApp
//
//  Created by 白川創大 on 2023/05/23.
//

import Foundation
import RealmSwift
import UIKit

class PostData: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var text: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var imageData: Data?
    @objc dynamic var id: String = ""
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    
}

