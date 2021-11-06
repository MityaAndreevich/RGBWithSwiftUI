//
//  ContentView.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack(spacing: 25) {
                ColorView(red: redValue, green: greenValue, blue: blueValue)
                VStack(spacing: 30) {
                    AllColorSetterStack(sliderValue: $redValue, tintColor: .red)
                    AllColorSetterStack(sliderValue: $greenValue, tintColor: .green)
                    AllColorSetterStack(sliderValue: $blueValue, tintColor: .blue)
                }
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            isInputActive = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




