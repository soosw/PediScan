//
//  RecordatoriosView.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 04/11/23.
//

import SwiftUI

struct RecordatorioItemView: View {
    var recordatorio: Recordatorios
    @State private var isActiveAlarmOne = true
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mma"
        return formatter
    }()
    
    var body: some View {
        HStack {
            Toggle("", isOn: $isActiveAlarmOne)
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 164/255, green: 91/255, blue: 91/255)))
                .labelsHidden()
                .padding()
            
            VStack {
                Text(recordatorio.text)
                    .font(.custom("Kollektif-Bold", size: 18))
                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                
                Text(dateFormatter.string(from: recordatorio.time))
                    .font(.custom("Kollektif", size: 18))
                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
            }
            .frame(width: 200)
            .padding()
            .background(Color(red: 248/255, green: 243/255, blue: 243/255))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 164/255, green: 91/255, blue: 91/255), lineWidth: 5)
            )
        }
        .padding()
    }
}


struct RecordatoriosView: View {
    @State var recordatorios: [Recordatorios] = []
    @State var textItemTemp = ""
    @State var timeItemTemp = Date()
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Image("BG_Rosita")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    
                    HStack{
                        
                        VStack {
                            Text("Notificaciones")
                                .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                                .font(.custom("borsok", size: 35))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                            Text("Seleccionar los recordatorios a preferencia")
                                .lineSpacing(1)
                                .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                                .font(.custom("Arimo", size: 18))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                        }
                        
                        Button(action: {
                            showSheet.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(.custom("borsok", size: 20))
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .clipShape(Circle())
                        .offset(y: -30)
                        .shadow(radius: 5)
                    }
                }
                .padding(.top, 50)

                ScrollView {
                    VStack {
                        
                        ForEach(recordatorios) { reminder in
                            RecordatorioItemView(recordatorio: reminder)
                        }
                    }
                }

            }
            .sheet(isPresented: $showSheet) {
                NavigationView {
                    List {
                        TextField("Item", text: $textItemTemp)
                        DatePicker("Hora", selection: $timeItemTemp, displayedComponents: .hourAndMinute)
                    }
                    .navigationTitle("Agregar un recordatorio")
                    .toolbar {
                        Button("Añadir") {
                            let newReminder = Recordatorios(text: textItemTemp, time: timeItemTemp)
                            recordatorios.append(newReminder)
                            showSheet.toggle()
                        }
                    }
                    
                }
                /* HStack {
                 Toggle("", isOn: $isActiveAlarmOne)
                 .toggleStyle(SwitchToggleStyle(tint: Color(red: 164/255, green: 91/255, blue: 91/255)))
                 .labelsHidden()
                 .padding()
                 
                 VStack{
                 Text("Medicamento 1")
                 .font(.custom("Kollektif-Bold", size: 18))
                 .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                 Text("8:00am")
                 .font(.custom("Kollektif", size: 18))
                 .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                 }
                 .frame(width: 200)
                 .padding()
                 .background(Color(red: 248/255, green: 243/255, blue: 243/255))
                 .cornerRadius(15)
                 .overlay(
                 RoundedRectangle(cornerRadius: 15)
                 .stroke(Color(red: 164/255, green: 91/255, blue: 91/255), lineWidth: 5)
                 )
                 }
                 .padding()*/
                
                
            }
        }
        .onChange(of: recordatorios) { i in
            save()
        }
        .onAppear() {
            load()
        }
        .refreshable {
            load()
        }
    }
    
    func save() {
        let data = try? JSONEncoder().encode(recordatorios)
        UserDefaults.standard.set(data, forKey: "reminders")
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: "reminders"),
           let loadedReminders = try? JSONDecoder().decode([Recordatorios].self, from: data) {
            recordatorios = loadedReminders
        }
    }

    // Función para formatear la hora como texto
    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


struct Recordatorios: Identifiable, Codable, Equatable {
    var id = UUID()
    var text: String
    var time: Date
}




#Preview {
    RecordatoriosView()
}
