//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: Classification
    @State private var label = ""

    var body: some View {
        // Determine the color based on label
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

        return VStack(alignment: .center) {
            NavigationLink(
                destination: MainInfoView(),
                label: {
                    Text(label)
                        .frame(width: 250)
                        .padding(.vertical, 10)
                        .padding(8)
                        .foregroundColor(colors)
                        .cornerRadius(20)
                        .font(.custom("borsok", size: 45))
                        .multilineTextAlignment(.center)
                }
            )

        }
    }
}

struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: Classification())
    }
}
