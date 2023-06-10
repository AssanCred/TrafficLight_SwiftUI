//
//  ContentView.swift
//  TrafficLight_SwiftUI
//
//  Created by Артём Латушкин on 09.06.2023.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    //MARK: - Private properties
    @State private var currentLight = CurrentLight.red
    @State private var buttonTitle = "START"
    @State private var color = Color.red
    
    @State private var redAlfa = 0.1
    @State private var yellowAlfa = 0.1
    @State private var greenAlfa = 0.1
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.black)
                    .frame(width: 190, height: 480)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .shadow(radius: 10)
                VStack(spacing: 20) {
                    SwiftTypeOfLightView(
                        color: .red,
                        alfa: redAlfa,
                        shadowColor: .red
                    )
                    SwiftTypeOfLightView(
                        color: .yellow,
                        alfa: yellowAlfa,
                        shadowColor: .yellow
                    )
                    SwiftTypeOfLightView(
                        color: .green,
                        alfa: greenAlfa,
                        shadowColor: .green
                    )
                }
            }
            Spacer()
            Button(action: changeColors) {
                Text(buttonTitle)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(width: 160, height: 30)
            .padding(.horizontal)
            .padding(.vertical)
            .background(.blue)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .padding()
    }
}

//MARK: - Extension private function
extension ContentView {
    private func changeColors() {
        let lightIsOne = 1.0
        let lightIsOff = 0.1
        buttonTitle = "NEXT"
        
        switch currentLight {
        case .red:
            color = .yellow
            greenAlfa = lightIsOff
            redAlfa = lightIsOne
            currentLight = .yellow
        case .yellow:
            color = .green
            redAlfa = lightIsOff
            yellowAlfa = lightIsOne
            currentLight = .green
        case .green:
            color = .red
            yellowAlfa = lightIsOff
            greenAlfa = lightIsOne
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
