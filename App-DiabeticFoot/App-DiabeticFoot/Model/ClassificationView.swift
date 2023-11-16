//
//  ClassificationView.swift
//  coreML-starter
//
//
//

import SwiftUI

struct ClassificationView: View {
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    @State private var label = ""
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        ZStack {
            
            var colors: Color {
                switch label {
                case "Grado 1":
                    return Color.yellow
                case "Grado 2":
                    return Color.orange
                case "Grado 3":
                    return Color.red
                default:
                    return Color.green
                }
            }
            
            Color.black
                .ignoresSafeArea()
            
            // DO NOT EDIT this section. This displays the classification camera
            GeometryReader { geo in
                VStack() {
                    
                    // PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                    
                    LiveCameraRepresentable() {
                        predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                    }
                    
                    
                    NavigationLink(
                        destination: PostEscaneadoView(),
                        label: {
                            HStack{
                                Text(label)
                                    .padding(.vertical, 10)
                                    .padding(8)
                                    .foregroundColor(colors)
                                    .cornerRadius(20)
                                    .font(.custom("borsok", size: 45))
                                    .multilineTextAlignment(.center)
                                
                                
                                if(label != ""){
                                    Image(systemName: "arrow.right.circle")
                                        .padding(.vertical, 10)
                                        .padding(8)
                                        .foregroundColor(colors)
                                        .cornerRadius(20)
                                        .font(.custom("borsok", size: 45))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    )
                    
                    Button(action: {
                        label = predictionStatus.topLabel
                    }) {
                        Image(systemName: "button.programmable")
                            .font(.custom("Arimo", size: 75))
                            .foregroundColor(.white)
                    }
                    
                }// VStack
                .onAppear(perform: classifierViewModel.loadJSON)
                .frame(width: geo.size.width)
            }
            

        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
    }
}
