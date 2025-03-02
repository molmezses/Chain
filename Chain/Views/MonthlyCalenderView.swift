import SwiftUI


struct MonthlyCalenderView: View {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    let selectedColor: Color
    
    var body: some View {
        VStack {
            // Ay ve Yıl başlığı
            HStack {
                Text(getMonthYear())
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            // Haftanın günleri
            HStack {
                ForEach(getWeekdays(), id: \.self) { day in
                    Text(day)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
            
            // Takvim günleri
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(getDaysInMonth(), id: \.self) { day in
                    if day == 0 {
                        Text("")
                            .frame(maxWidth: .infinity)
                    } else {
                        switch day {
                        case 10:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 11:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 12:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 1:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 8:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 24:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 25:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 26:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 20:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 17:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        case 16:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor)
                                .cornerRadius(8)
                        default:
                            Text("\(day)")
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(selectedColor.opacity(0.4))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxHeight: 400)
    }
    
    func getMonthYear() -> String {
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: Date())
    }
    
    // Haftanın günlerini al
    func getWeekdays() -> [String] {
        dateFormatter.dateFormat = "EE"
        return calendar.shortWeekdaySymbols
    }
    
    // Ayın günlerini al
    func getDaysInMonth() -> [Int] {
        let range = calendar.range(of: .day, in: .month, for: Date())!
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: Date()))!
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        
        var days = [Int]()
        
        // Boş günleri ekle
        for _ in 1..<firstWeekday {
            days.append(0)
        }
        
        // Ayın günlerini ekle
        for day in range {
            days.append(day)
        }
        
        return days
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyCalenderView(selectedColor: .customColor1)
    }
}
