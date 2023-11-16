//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        // TODO: The View that shows classification results - edit the styling below!
        
        ZStack(alignment: .top) {
            
            PredictiveLabelView(labelData: labelData)
            
        }
        //[OPTIONAL] Change the size of the frame.
        .frame(width: 350)
        
    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification())
    }
}

