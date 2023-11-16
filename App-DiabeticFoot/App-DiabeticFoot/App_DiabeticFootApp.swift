//
//  App_DiabeticFootApp.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 01/11/23.
//

import SwiftUI

@main
struct App_DiabeticFootApp: App {
    @StateObject private var predictionStatus = PredictionStatus()
    var body: some Scene {
        WindowGroup {
            FirstView()
                .environmentObject(predictionStatus)
        }
    }
}
