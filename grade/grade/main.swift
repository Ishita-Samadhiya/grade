//
//  main.swift
//  grade
//
//  Created by StudentAM on 1/29/24.
//

import Foundation
import CSV
var grades: [[Double]] = []
var names: [String] = []
var namesLower: [String] = []
var avg: [Double] = []
var opt: Int = 0
do{
    let stream = InputStream(fileAtPath: "/Users/studentam/Desktop/Apps/grade/grade/grade/grades.csv")
    let csv = try CSVReader(stream: stream!)
    while var row = csv.next(){
        names.append(row[0])
        namesLower.append(row[0].lowercased())
        var grade: [Double] = []
        var sum = 0.0
        for i in 1..<row.count{
            grade.append(Double(row[i])!)
            sum += grade[i-1]
        }
        grades.append(grade)
        avg.append(sum/Double(grade.count))
    }
}catch{
    print("There was an error trying to read the file!")
}
while opt != -1{
    print("\nWelcome to the Grade Manager!\nWhat would you like to do? (Enter the number):")
    print("1. Display grade of a single student\n2. Display all grades for a student\n3. Display all grades of ALL students\n4. Find the average grade of the class\n5. Find the average grade of an assignment\n6. Find the lowest grade in the class\n7. Find the highest grade of the class\n8. Filter students by grade range\n9. Change a student's grade\n10. Quit")
    opt = Int(readLine()!)!
    switch opt{
        case 1:
            displaySingle()
        case 2:
            displayStudent()
        case 3:
            displayAll()
        case 4:
            classAverage()
        case 5:
            assignAverage()
        case 6:
            lowest()
        case 7:
            highest()
        case 8:
            filterByGrade()
        case 9:
            change()
        case 10:
            print("Have a great rest of your day!")
            opt = -1
            break
        default:
            print("Please choose an appropriate option!")
    }
}

func displaySingle(){
    print("Which student would you like to choose?")
    let name = readLine()!
    let ind = namesLower.firstIndex(of: name.lowercased())
    if(ind != nil){
        print("\(names[ind!])'s grade in the class is \(avg[ind!])")
    }else{
        print("Please enter a valid name!");
    }
}
func displayStudent(){
    print("Which student would you like to choose?")
    let name = readLine()!
    let ind = namesLower.firstIndex(of: name.lowercased())
    if(ind != nil){
        print("\(names[ind!])'s grades for this class are:")
        for i in 0..<grades[ind!].count-1{
            print("\(grades[ind!][i]), ", terminator: "")
        }
        print(grades[ind!][(grades[ind!].count)-1])
    }else{
        print("Please enter a valid name!");
    }
}
func displayAll(){
    for ind in 0..<names.count{
        print("\(names[ind])'s grades are: ", terminator: "")
        for i in 0..<grades[ind].count-1{
            print("\(grades[ind][i]), ", terminator: "")
        }
        print(grades[ind][(grades[ind].count)-1])
    }
}
func classAverage(){
    var sum = 0.0
    for num in avg{
        sum+=num
    }
    let average = sum/Double(avg.count)
    print("The class average is: \(round(average*100)/100)")
}
func assignAverage(){}
func lowest(){}
func highest(){}
func filterByGrade(){}
func change(){
    
}
