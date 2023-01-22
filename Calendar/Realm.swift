//
//  Realm.swift
//  Calendar
//
//  Created by 山邉瑛愛 on 2023/01/22.
//

import Foundation
import RealmSwift

class EventModel: Object {
    @objc dynamic var date = ""
    @objc dynamic var plusmoney = ""
    @objc dynamic var minusmoney = ""
    @objc dynamic var pluscategory = ""
    @objc dynamic var minuscategory = ""
}
