//
//  DataHistoryView.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 10/11/23.
//

import SwiftUI

struct DataHistoryView: View {
    @State private var expandedDates: Set<Date> = []
    
    // Ejemplo de datos
    let dataByDate: [Date: [String]] = [
        DateComponents(calendar: .current, year: 2023, month: 11, day: 5).date!: [
            "Dato general al que no le importa la hora",
            "Otro dato general al que no le importa la hora",
            "El dato que se haya registrado"
        ],
        DateComponents(calendar: .current, year: 2023, month: 11, day: 6).date!: [
            "Algún evento importante",
            "Evento social",
            "Cita con el doctor"
        ],
        DateComponents(calendar: .current, year: 2023, month: 11, day: 7).date!: [
            "Algún evento importante",
            "Evento social",
            "Cita con el doctor"
        ],
        DateComponents(calendar: .current, year: 2023, month: 11, day: 8).date!: [
            "Algún evento importante",
            "Evento social",
            "Cita con el doctor"
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
                                    .foregroundColor(Color(red: 246/255, green: 234/255, blue: 225/255))
                                    //                            .listRowSeparator(.hidden)
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
                                        }
                                    }
                                }
                            )
                            .accentColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        }
                    }
                    .listRowBackground(Color(red: 184/255, green: 106/255, blue: 106/255))
                }
                .scrollContentBackground(.hidden)
            }
            .padding(.top, 50)
        }
    }
}

struct DataHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        DataHistoryView()
    }
}
