//
//  SwiftTypeOfLightView.swift
//  TrafficLight_SwiftUI
//
//  Created by Артём Латушкин on 10.06.2023.
//

import SwiftUI

struct SwiftTypeOfLightView: View {
    let color: Color
    let alfa: Double
    let shadowColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 120, height: 120)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .opacity(alfa)
                .shadow(color: shadowColor, radius: 20)
        }
    }
}

struct SwiftTypeOfLightView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftTypeOfLightView(color: .blue, alfa: 1, shadowColor: .red)
    }
}
