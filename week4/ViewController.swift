//
//  ViewController.swift
//  week4
//
//  Created by Khushi Mineshkumar Gor on 2024-09-27.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITableViewDelegate, UITableViewDataSource {
    
    
   
   var semesters = ["Fall", "Winter", "Summer"]
    var selectedSemesterIndex = 0
    @IBOutlet weak var stdNameText: UITextField!
    
    @IBOutlet weak var programText: UITextField!
    
    @IBOutlet weak var stdTable: UITableView!
    
    var stdarray = (UIApplication.shared.delegate as! AppDelegate).allStudents
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveClicked(_ sender: Any) {
        if let goodtext = stdNameText.text , let goodprogram = programText.text {
            if !goodtext.isEmpty, !goodprogram.isEmpty {
                
                var newStd = StudentModel(fullname: goodtext, program: goodprogram, semester: semesters[selectedSemesterIndex])
                print(newStd.toString())
                (UIApplication.shared.delegate as! AppDelegate).allStudents.append(newStd)
                stdarray = (UIApplication.shared.delegate as! AppDelegate).allStudents
                
                stdTable.reloadData()
                stdNameText.text = ""
                programText.text = ""
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return semesters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return semesters[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSemesterIndex = row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stdarray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        var stdIndex = indexPath.row
        cell?.textLabel?.text = "\(stdarray[stdIndex].fullname) - \(stdarray[stdIndex].program)"
        cell?.detailTextLabel?.text = "\(stdarray[stdIndex].semester)"
        return cell!
    }
    
}

