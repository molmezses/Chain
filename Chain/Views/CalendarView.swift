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
    @Environment(\.colorScheme) var colorScheme

        
    init() {
        calcDate()
    }
       
        
    var body: some View {
            ScrollView(.horizontal , showsIndicators: false){
                LazyHStack {
                    ForEach(0..<150) { index in
                        if index == 3{
                            VStack {
                                Text("\(days[index][1])")
                                Text("\(days[index][0])")
                                    .padding(4)
                                    .background(.indigo)
                                    .clipShape(Circle())
                                    .foregroundStyle(colorScheme == .light ? .white : .black)
                            }
                            .padding(8)
                            .font(.footnote)
                            
                            
                        }else{
                            VStack {
                                Text("\(days[index][1])")
                                Text("\(days[index][0])")
                                    .padding(4)
                                    .clipShape(Circle())
                                
                            }
                            .padding(8)
                            .font(.footnote)
                        }
                    }
                }
                .padding(.vertical , 2)
                .padding(.horizontal , 4)
        }
            .frame(maxHeight: 50)
    }
    
    
    mutating func calcDate(){
        
        for i in -3...150{
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
    dateFormatter.dateFormat  = "EEE"
    return dateFormatter.string(from: date)
}

#Preview {
    CalendarView()
}


/*
 VStack {
     Text("\(days[0][0])")
     Text("\(days[0][1])")
 }
 .padding(8)
 .opacity(0.2)
 VStack {
     Text("\(days[1][0])")
     Text("\(days[1][1])")
 }
 .padding(8)
 .opacity(0.4)
 VStack {
     Text("\(days[2][0])")
     Text("\(days[2][1])")
 }
 .padding(8)
 .opacity(0.8)
 VStack {
     Text("\(days[3][0])")
     Text("\(days[3][1])")
 }
 .padding(8)
 .background(.indigo.opacity(0.6))
 .clipShape(RoundedRectangle(cornerRadius: 12))
 .foregroundStyle(.white)
 .background(RoundedRectangle(cornerRadius: 12).stroke(colorScheme == .dark ? .white : .black , lineWidth: 2))
 VStack {
     Text("\(days[4][0])")
     Text("\(days[4][1])")
 }
 .padding(8)
 .opacity(0.8)

 VStack {
     Text("\(days[5][0])")
     Text("\(days[5][1])")
 }
 .padding(8)
 .opacity(0.4)
 VStack {
     Text("\(days[6][0])")
     Text("\(days[6][1])")
 }
 .padding(8)
 .opacity(0.2)
 
 
 */
