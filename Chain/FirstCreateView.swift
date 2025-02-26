//
//  FirstCreateView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 24.02.2025.
//

import SwiftUI

enum Unit : String{
    case Birim
    case Sayfa
    case Litre
    case dakika
    case kelieme
    case km
    case kalori
    case Soru
    case Tekrar
    case Adet
    case Bölüm
    case Video
}


struct FirstCreateView: View {
    
    @State var chainName: String = ""
    @State var chainUnit: String = ""
    @State var selectedUnit : Unit = .Birim
    @FocusState var inFocus: Bool
    @State var page: Int = 1
    @State var transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    @State var transitionReverse: AnyTransition = .asymmetric(
        insertion: .move(edge: .leading),
        removal: .move(edge: .trailing)
    )
    @State var days: [String:Bool] = [
        "Su" : false,
        "Mo" : false,
        "Tu" : false,
        "We" : false,
        "Th" : false,
        "Fr" : false,
        "Sa" : false,
    ]
    @State var selectedTime = Date()
    @State var selectedColor : Color = .customColor1
    @State var backPage : Bool = false

   
    
    
    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    if !(page == 1) {
                        backPage = true
                        page -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .bold()
                        .foregroundStyle(.indigo)
                }

                Spacer()
            }
            .padding(.horizontal)
            VStack{
                switch page{
                case 1:
                    chainNameAndColor
                        .transition(!backPage ? transition : transitionReverse)
                case 2:
                    chainUnitView
                        .transition(!backPage ? transition : transitionReverse)
                case 3:
                    selectNotificationsView
                        .transition(!backPage ? transition : transitionReverse)
                default:
                    EmptyView()
                }
                
            }
            .animation(.easeInOut, value: page)
            VStack{
                bottomView
                    .opacity(inFocus ? 0 : 1)
            }
            .padding()
        }
    }
    
    var selectNotificationsView: some View{
        VStack {
            Spacer()
            VStack(spacing:18){
                Text("Create a notification for your goal.")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.indigo)
                Text("Set your notifications to stay informed and never miss your goals.")
                    .font(.headline)
                    .padding(.bottom)
            }
            VStack {
                HStack {
                    Text("Choose your days for notification")
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .font(.footnote)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.gray)
                }
                .padding()
                HStack{
                    Text("Su")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["Su"]?.toggle()
                            }
                        }
                        .background(days["Su"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("Mo")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["Mo"]?.toggle()
                            }
                        }
                        .background(days["Mo"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("Tu")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["Tu"]?.toggle()
                            }
                        }
                        .background(days["Tu"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("We")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["We"]?.toggle()
                            }
                        }
                        .background(days["We"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("Th")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["Th"]?.toggle()
                            }
                        }
                        .background(days["Th"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("Fr")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["Fr"]?.toggle()
                            }
                        }
                        .background(days["Fr"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("Sa")
                        .padding(12)
                        .onTapGesture {
                            withAnimation(.spring){
                                days["Sa"]?.toggle()
                            }
                        }
                        .background(days["Sa"] == true ? .indigo : .indigo.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .font(.headline)
                HStack {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.gray)
                    Text("Set the time for your notification")
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .font(.footnote)
                        .padding(.leading , 20)
                }
                .padding()
                
                VStack {
                    DatePicker("Saat Seçin",
                        selection: $selectedTime,
                        displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .frame(width: 150, height: 150)
                            
                    }
                    .padding()
            }
            Spacer()
        }
        .onSubmit({
            backPage = false
        })
        .padding()
        
        
    }
    
    var chainUnitView: some View{
        VStack(spacing: 16){
            Spacer()
            VStack(spacing:24){
                Text("Hedefiniz için biriminizi belirleyin")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.indigo)
                Text("Örneğin günde 500ml litre su içeceğim veya günde 30 sayfa kitap okuyacağım vb. ")
                    .font(.headline)
                    .padding(.bottom)
                
                HStack {
                    TextField("Miktar giriniz...", text: $chainUnit)
                        .padding()
                        .font(.headline)
                        .padding(.leading ,8)
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray , lineWidth: 4)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .focused($inFocus)
                        .keyboardType(.numberPad)
                    Spacer()
                    TextField("", text: $chainUnit)
                        .foregroundStyle(.white)
                        .padding()
                        .font(.headline)
                        .padding(.leading ,8)
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(.indigo)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray , lineWidth: 4)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .focused($inFocus)
                        .keyboardType(.numberPad)
                        .disabled(true)
                        .overlay {
                            Text("\(selectedUnit)")
                                .foregroundStyle(.white)
                        }
                }
                .padding(.horizontal , 32)
            }
            .padding(.vertical)

            VStack(spacing: 16){
                HStack(spacing: 12){
                    Image(systemName: "plus")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Birim ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Birim
                            }
                        }
                    Text("Sayfa")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Sayfa ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Sayfa
                            }
                        }
                    Text("Litre")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Litre ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Litre
                            }
                        }
                    Text("Dakika")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .dakika ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .dakika
                            }
                        }
                        
                }
                HStack(spacing: 12){
                    Text("Kelime")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .kelieme ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .kelieme
                            }
                        }
                    Text("Km")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .km ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .km
                            }
                        }
                    Text("Kalori")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .kalori ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .kalori
                            }
                        }
                    Text("Soru")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Soru ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Soru
                            }
                        }
                        
                }
                HStack(spacing: 12){
                    Text("Tekrar")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Tekrar ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Tekrar
                            }
                        }
                    Text("Adet")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Adet ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Adet
                            }
                        }
                    Text("Bölüm")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Bölüm ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Bölüm
                            }
                        }
                    Text("Video")
                        .padding()
                        .font(.headline)
                        .background(.indigo.opacity(selectedUnit == .Video ? 1 : 0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedUnit = .Video
                            }
                        }
                        
                }
            }
            Spacer()
        }
        .onSubmit({
            backPage = false
        })
        .padding()
    }
    
    var chainNameAndColor : some View{
        VStack(spacing: 36){
            Spacer()
            VStack(spacing:18){
                Text("İlk hedefinizi birlikte oluşturalım")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.indigo)
                Text("Ulaşmak istediğin ilk hedefinizi girin ve bir renk seçin")
                    .font(.headline)
                    .padding(.bottom)
            }
            TextField("Kitap okumak, dil çalışmak, koşu , vb.", text: $chainName)
                .padding()
                .font(.headline)
                .padding(.leading ,8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray , lineWidth: 4)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .focused($inFocus)

            
            HStack {
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray)
                Text("Renk Seçin")
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical)
            
            
            VStack(spacing: 24){
                HStack(spacing: 24){
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor1)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor1
                            }
                        }
                        .overlay {
                            selectedColor == .customColor1 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor2)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor2
                            }
                        }
                        .overlay {
                            selectedColor == .customColor2 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor3)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor3
                            }
                        }
                        .overlay {
                            selectedColor == .customColor3 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor4)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor4
                            }
                        }
                        .overlay {
                            selectedColor == .customColor4 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor5)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor5
                            }
                        }
                        .overlay {
                            selectedColor == .customColor5 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                }
                HStack(spacing: 24){
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor6)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor6
                            }
                        }
                        .overlay {
                            selectedColor == .customColor6 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor7)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor7
                            }
                        }
                        .overlay {
                            selectedColor == .customColor7 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor8)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor8
                            }
                        }
                        .overlay {
                            selectedColor == .customColor8 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor9)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor9
                            }
                        }
                        .overlay {
                            selectedColor == .customColor9 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 50 , height: 50)
                        .foregroundStyle(.customColor10)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedColor = .customColor10
                            }
                        }
                        .overlay {
                            selectedColor == .customColor10 ?
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large).bold().foregroundStyle(.white): nil
                        }
                }
            }
            
            Spacer()
        }
        .onSubmit({
            backPage = false
        })
        .padding()
    }
    
    var bottomView : some View{
        HStack {
            HStack {
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(page == 1 ? .indigo : .gray)
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(page == 2 ? .indigo : .gray)
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(page == 3 ? .indigo : .gray)
            }
            .padding(.leading , 22)
            Spacer()
            Button {
                withAnimation(.spring){
                    page += 1
                }
            } label: {
                Text("Devam")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.indigo)
                    )
            }
            .shadow(radius: 12)
            .padding(.leading , 80)
            
        }
    }
    
    private func formattedTime() -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: selectedTime)}

}

#Preview {
    FirstCreateView()
}
