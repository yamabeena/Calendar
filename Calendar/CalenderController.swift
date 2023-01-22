//
//  CalenderController.swift
//  Calendar
//
//  Created by 山邉瑛愛 on 2023/01/22.
//

import UIKit
import RealmSwift
import FSCalendar

class CalenderController: UIViewController {
    
    let realm = try! Realm()
    let date = Date()
    let dateFormatter = DateFormatter()
    @IBOutlet var moneylabel: UILabel!
    @IBOutlet var categorylabel: UILabel!
    var selectedDate = Date()
    var eventModels: [[String:String]] = []
    var filterModels: [[String:String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getModel()
        filterModel()
        moneylabel.text = filterModels["plusmoney"]
        
        // Do any additional setup after loading the view.
    }
    
    func getModel() {
        let results = realm.objects(EventModel.self)
        
        for result in results {
            eventModels.append(["plusmoney": result.plusmoney,
                                "minusmoney": result.minusmoney,
                                "date": result.date,
                                "pluscategory": result.pluscategory,
                                "minuscategory": result.minuscategory])
        }
    }
    
    func filterModel(){
        var filterdEvents: [[String:String]] = []
        for eventModel in eventModels {
            if eventModel["date"] == dateFormatter.string(from: selectedDate)
{
                filterdEvents.append(eventModel)
            }
                
        }
        filterModels = filterdEvents
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        selectedDate = date
        filterModel()
        
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



