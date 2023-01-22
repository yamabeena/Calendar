//
//  ViewController.swift
//  Calendar
//
//  Created by 山邉瑛愛 on 2022/11/20.
//

import UIKit
import FSCalendar
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    let date = Date()
    let dateFormatter = DateFormatter()
    
    @IBOutlet var plusmoneyTextField: UITextField!
    @IBOutlet var minusmoneyTextField: UITextField!
    @IBOutlet var pluscategoryTextField: UITextField!
    @IBOutlet var minuscategoryTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        createEvent()
            }
    
    func createEvent (){
        do {
            let realm = try! Realm()
            let eventModel = EventModel()
            eventModel.date = dateFormatter.string(from: date)
            eventModel.plusmoney = plusmoneyTextField.text ?? ""
            eventModel.minusmoney = minusmoneyTextField.text ?? ""
            eventModel.pluscategory = pluscategoryTextField.text ?? ""
            eventModel.minuscategory = minuscategoryTextField.text ?? ""
            
            try realm.write {
                realm.add(eventModel)
    
            }
            } catch {
                print("create todo error.")
            }
        }
        
    }



