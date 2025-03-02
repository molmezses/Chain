import SwiftUI

struct HabitTrackerView: View {
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let columns = Array(repeating: GridItem(.fixed(30), spacing: 25), count: 7)
    let activeDays: [Bool] = (0..<57).map { _ in Bool.random() }
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(daysOfWeek, id: \..self) { day in
                    Text(day)
                        .font(.footnote)
                        .bold()
                        .frame(width: 30, height: 20)
                }
                
                ForEach(0..<80, id: \..self) { index in
                    ZStack {
                        Rectangle()
                            .fill(activeDays[index] ? Color.blue : Color.gray.opacity(0.4))
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                        
                        if index > 0 && activeDays[index] && activeDays[index - 1] {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 50, height: 5)
                                .offset(x: -17)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct HabitTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        HabitTrackerView()
    }
}
