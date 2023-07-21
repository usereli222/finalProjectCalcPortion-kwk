//
//  calculatedResultView.swift
//  finalProjectCalcPortion
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI
import Foundation

struct calculatedResultView: View {
    @State var timeBetween = 0
    @State var subject : String
    @State var array = [Int]()
    @State var prevNum = 0
    @State var nextNum = 0
    @State var startDate = Date()
    @State var timeInterval = 0.0
    @State var startDateInSecs = 0
    @State var currentDateHolder = 0
    let dateFormatter = DateFormatter()
    @State var studyDaysArray = [String]()
    @State var clicked = false
    @State var buttonName = "Calculate"
//    let calendar = Calendar.current
   
    var body: some View {
        NavigationStack{
            VStack(spacing: 50.0){
                Button(buttonName){
                    buttonName = ""
                    clicked = true
                    prevNum=timeBetween/(3600*24)
                    array.append(prevNum)
                    repeat {
                        
                        nextNum=prevNum/2
                        array.append(nextNum)
                        prevNum = nextNum
                    }while(prevNum>1)
                    
                    dateFormatter.dateFormat = "YY, MMM d"
                    timeInterval = startDate.timeIntervalSince1970
                    startDateInSecs = Int(timeInterval)
                    currentDateHolder = 0
                    for day in array{
                        currentDateHolder = startDateInSecs + (day*3600*24)
                        studyDaysArray.append(dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(currentDateHolder))))
                        
                    }
                }
                
                Text("You should review \(subject) on... ")
                if clicked{
                    ForEach(studyDaysArray, id: \.self){studyDay in
                        Text(studyDay)
                    }
                    Text("You have \(timeBetween/(60*60*24)) days before your test!")
                    NavigationLink(destination: toDoList()) {
                        Text("Add to ToDo list")
                    }
                }
                
               
    //            ForEach(array, id: \.self){day in
    //                Text("\(day)")
    //            }
                
                
            }
        }//end of navigation stack
        
    }
//    func calculate(startTime : Int) -> [Int]{//input timeBetween in parameter
//        prevNum=startTime/(3600*24)
//        array.append(prevNum)
//        repeat {
//
//            nextNum=prevNum/2
//            array.append(nextNum)
//            prevNum = nextNum
//        }while(prevNum>1)
//        return array
//    }
//    func printContent(days : [Int]){
//        timeInterval = startDate.timeIntervalSince1970
//        startDateInSecs = Int(timeInterval)
//        currentDateHolder = 0
//        for day in days{
//            currentDateHolder = startDateInSecs + (day*3600*24)
//            studyDaysArray.append("Study this day: " + dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(currentDateHolder))))
////            print(calendar.dateComponents([.day], from: startDate)+day)
//
//        }
//    }
    
}

struct calculatedResultView_Previews: PreviewProvider {
    static var previews: some View {
        calculatedResultView(timeBetween: 0,subject: "",startDate: Date())
    }
}
