//
//  RemindersView.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 11/11/23.
//

import SwiftUI

struct RemindersView: View {
    @State var reminders: [Reminder] = []
    @State var showSheet = false
    @State var textItemTemp = ""
    @State var timeItemTemp = Date()

    var body: some View {
        NavigationView {
            Group {
                if reminders.isEmpty {
                    Text("No hay recordatorios")
                } else {
                    List {
                        ForEach(reminders, id: \.id) { reminder in
                            HStack {
                                Text(reminder.text)
                                Spacer()
                                Text(formatTime(reminder.time))
                            }
                            .contextMenu {
                                Button(action: {
                                    if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
                                        reminders.remove(at: index)
                                    }
                                }, label: {
                                    Label("Delete", systemImage: "delete.left")
                                })
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recordatorios")
            .toolbar {
                Button(action: {
                    showSheet.toggle()
                    textItemTemp = ""
                    timeItemTemp = Date()
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .onChange(of: reminders) { i in
                save()
            }
            .onAppear() {
                load()
            }
            .refreshable {
                load()
            }
        }
        .sheet(isPresented: $showSheet) {
            NavigationView {
                List {
                    TextField("Item", text: $textItemTemp)
                    DatePicker("Hora", selection: $timeItemTemp, displayedComponents: .hourAndMinute) // Campo de entrada de hora
                }
                .navigationTitle("Agregar un recordatorio")
                .toolbar {
                    Button("Añadir") {
                        let newReminder = Reminder(text: textItemTemp, time: timeItemTemp)
                        reminders.append(newReminder)
                        showSheet.toggle()
                    }
                }
            }
        }
    }

    func save() {
        let data = try? JSONEncoder().encode(reminders)
        UserDefaults.standard.set(data, forKey: "reminders")
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: "reminders"),
           let loadedReminders = try? JSONDecoder().decode([Reminder].self, from: data) {
            reminders = loadedReminders
        }
    }

    // Función para formatear la hora como texto
    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct Reminder: Identifiable, Codable, Equatable {
    var id = UUID()
    var text: String
    var time: Date
}

struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}
