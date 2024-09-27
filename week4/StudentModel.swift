//
//  StudentModel.swift
//  week4
//
//  Created by Khushi Mineshkumar Gor on 2024-09-27.
//

import Foundation

class StudentModel{
    var fullname : String = ""
    var program : String = ""
    var semester : String = ""
    var year : String = ""
    
    init(fullname: String, program: String, semester: String, year: String) {
        self.fullname = fullname
        self.program = program
        self.semester = semester
        self.year = year
    }
    func toString() -> String{
        return "\(fullname) - \(program) - \(semester) - \(year)"
    }
}
