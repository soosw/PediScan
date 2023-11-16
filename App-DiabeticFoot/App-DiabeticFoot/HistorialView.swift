//
//  HistorialView.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 08/11/23.
//

import SwiftUI


struct HistorialView: View {
    @State private var expandedDates: Set<Date> = []
    
    // Ejemplo de datos
    let dataByDate: [Date: [String]] = [
        DateComponents(calendar: .current, year: 2023, month: 11, day: 5).date!: [
            "[7:20am] Glucosa exacta: 126mg/dL",
            "[7:30am] Alimentos: 13g proteína, 315 calorías",
            "[2:30pm] Alimentos: 27g proteína, 470 calorías",
            "[5:00pm] Actividad física: 50min pilates",
            "[8:30pm] Alimentos: 200 calorías"
        ],
        DateComponents(calendar: .current, year: 2023, month: 11, day: 6).date!: [
            "[7:00am] Glucosa exacta: 130mg/dL",
            "[7:30am] Alimentos: 6.4g proteína, 350kcal calorías, 50g grasa",
            "[1:00pm] Sistólica: 123, Diastólica: 79",
            "[2:30pm] Alimentos: 31g proteína, 218 calorías",
            "[4:45pm] Actividad física: 30min natación",
            "[7:30pm] Alimentos: 200 calorías"
        ],
        DateComponents(calendar: .current, year: 2023, month: 11, day: 7).date!: [
            "[7:15am] Glucosa exacta: 122mg/dL",
            "[8:20am] Alimentos: 12.8g proteína",
            "[1:30pm] Sistólica: 123, Diastólica: 79",
            "[2:30pm] Alimentos: 27g proteína, 470 calorías",
            "[5:00pm] Actividad física: 60min caminata"
        ],
        DateComponents(calendar: .current, year: 2023, month: 11, day: 8).date!: [
            "[7:00am] Glucosa exacta: 120mg/dL",
            "[7:30am] Alimentos: 6.4g proteína, 350kcal calorías, 50g grasa",
            "[1:00pm] Sistólica: 115, Diastólica: 75",
            "[2:30pm] Alimentos: 21g proteína, 200 calorías",
            "[4:45pm] Actividad física: 45min natación",
            "[7:30pm] Alimentos: 30g proteína, 300 calorías"
        ]
    ]
    
    var body: some View {
        
        ZStack {
            
            Image("BG_Rosita")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Historial de datos")
                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                    .font(.custom("borsok", size: 35))
                    .lineSpacing(15)
                    .multilineTextAlignment(.center)
                
                List {
                    ForEach(dataByDate.keys.sorted(), id: \.self) { date in
                        Section {
                            DisclosureGroup(
                                isExpanded: Binding(
                                    get: { self.expandedDates.contains(date) },
                                    set: { isExpanded in
                                        if isExpanded {
                                            self.expandedDates.insert(date)
                                        } else {
                                            self.expandedDates.remove(date)
                                        }
                                    }
                                ),
                                content: {
                                    ForEach(dataByDate[date] ?? [], id: \.self) { dataItem in
                                        Text(dataItem)
                                    }
                                    .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                                    .listRowBackground(Color(red: 246/255, green: 225/255, blue: 225/255))
                                   // .listRowSeparator(.hidden)
                                    .padding(8)
                                    .fontWeight(.bold)
                                },
                                label: {
                                    HStack {
                                        Text(date, style: .date)
                                            .foregroundColor(Color(red: 246/255, green: 234/255, blue: 225/255))
                                            .fontWeight(.bold)
                                        Spacer()
                                        Button(action: {
                                            if self.expandedDates.contains(date) {
                                                self.expandedDates.remove(date)
                                            } else {
                                                self.expandedDates.insert(date)
                                            }
                                        }) {
                                            Image(systemName: self.expandedDates.contains(date) ? "minus" : "plus")
                                                .foregroundColor(Color(red: 246/255, green: 234/255, blue: 225/255))
                                                .fontWeight(.bold)
                                        }
                                    }
                                }
                                
                            )
                            .accentColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        }
                    }
                    .listRowBackground(Color(red: 184/255, green: 106/255, blue: 106/255))
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .padding(.vertical, 10)
            }
            .padding(.top, 50)
        }
    }
}
    
#Preview {
    HistorialView()
}




