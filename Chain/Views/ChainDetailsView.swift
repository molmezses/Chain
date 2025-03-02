//
//  CircularProgressView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 27.02.2025.
//

import SwiftUI

struct ChainDetailsView: View {
    @State var progress: Double
    var complete: Double
    let selectedColor: Color
    @State var showSheet: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let progressRatio = progress / complete
        
        ScrollView {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .bold()
                            .foregroundStyle(Color("primaryColor"))
                    }
                    Spacer()
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "chart.bar.fill")
                            .imageScale(.large)
                            .foregroundStyle(selectedColor)
                    }

                }
                .padding()

                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(progressRatio, 1.0)))
                        .stroke(selectedColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 0.5), value: progress)

                    VStack {
                        HStack {
                            Text("\(Int(progress))")
                                .font(.largeTitle)
                                .bold()
                                .fontDesign(.rounded)
                            Text("/\(Int(complete))")
                                .font(.headline)
                                .bold()
                                .fontDesign(.rounded)
                                .foregroundStyle(.gray)
                        }
                        Text("Page")
                            .foregroundStyle(.gray)
                        HStack(spacing: 24){
                            Button {
                                progress = 0
                            } label: {
                                Image(systemName:"arrow.trianglehead.clockwise")
                                    .imageScale(.large)
                                    .foregroundStyle(Color("primaryColor"))
                            }
                            .padding(.top)
                            Button {
                                progress = complete
                            } label: {
                                Image(systemName:"checkmark")
                                    .imageScale(.large)
                                    .foregroundStyle(Color("primaryColor"))
                            }
                            .padding(.top)
                        }

                            
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
                
                HStack(spacing: 24){
                    Button {
                        if !(progress < 0){
                            progress -= (complete / 10)
                        }
                    } label: {
                        Image(systemName: "minus")
                            .padding(12)
                            .background(.gray.opacity(0.4))
                            .clipShape(Circle())
                            .foregroundStyle(Color("primaryColor"))
                    }

                    Button {
                        showSheet.toggle()
                    } label: {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(selectedColor)
                            .overlay {
                                Image(systemName: "pencil.line")
                                    .foregroundStyle(.white)
                                    .imageScale(.large)
                                    .bold()
                            }
                    }
                    Button {
                        progress += (complete / 10)
                    } label: {
                        Image(systemName: "plus")
                            .padding(8)
                            .background(.gray.opacity(0.4))
                            .clipShape(Circle())
                            .foregroundStyle(Color("primaryColor"))
                    }
                }
                .padding()
 
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .sheet(isPresented: $showSheet) {
                MonthlyCalenderView(selectedColor: selectedColor)
                    .presentationDetents([.medium])
                    .ignoresSafeArea()
            }
        }
        
    }
    
}



#Preview {
    ChainDetailsView(progress: 50, complete: 100, selectedColor: .customColor7)
}




