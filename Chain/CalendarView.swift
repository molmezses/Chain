//
//  deneme.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 26.02.2025.
//

import SwiftUI

struct CalendarView: View {
    let today = Date()
    var days: [[String]] = []
        
    init() {
        calcDate()
    }
       
        
    var body: some View {
        HStack(){
            VStack {
                Text("\(days[0][0])")
                Text("\(days[0][1])")
            }
            .padding(8)
            VStack {
                Text("\(days[1][0])")
                Text("\(days[1][1])")
            }
            .padding(8)
            VStack {
                Text("\(days[2][0])")
                Text("\(days[2][1])")
            }
            .padding(8)
            VStack {
                Text("\(days[3][0])")
                Text("\(days[3][1])")
            }
            .padding(8)
            .background(.indigo)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundStyle(.white)
            VStack {
                Text("\(days[4][0])")
                Text("\(days[4][1])")
            }
            .padding(8)
            VStack {
                Text("\(days[5][0])")
                Text("\(days[5][1])")
            }
            .padding(8)
            VStack {
                Text("\(days[6][0])")
                Text("\(days[6][1])")
            }
            .padding(8)
        }
        .font(.headline)
    }
    
    
    mutating func calcDate(){
        
        for i in -3...6{
            var day: Date {
                Calendar.current.date(byAdding: .day, value: i, to: today)!
            }
            let dayName = formattedDateDay(day)
            let monthName = formattedDateMonth(day)
            self.days.append([dayName,String(monthName.prefix(3))])
            
            
        }
        
    }
    
}//View



func formattedDateDay(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    return dateFormatter.string(from: date)
}
func formattedDateMonth(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat  = "MMM"
    return dateFormatter.string(from: date)
}

#Preview {
    CalendarView()
}
