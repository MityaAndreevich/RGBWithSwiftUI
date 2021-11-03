//
//  ContentView.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var redTextField = ""
    
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var greenTextField = ""
    
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var blueTextField = ""
    
    @State private var alertPresenter = false
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack(spacing: 25) {
                ColorView(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                HStack {
                    ColorValueTextView(value: redSliderValue)
                    SliderView(sliderValue: $redSliderValue, tint: .red)
                    ColorTFView(value: $redSliderValue, textValue: $redTextField)
                }
                HStack {
                    ColorValueTextView(value: greenSliderValue)
                    SliderView(sliderValue: $greenSliderValue, tint: .green)
                    ColorTFView(value: $greenSliderValue, textValue: $greenTextField)
                }
                HStack {
                    ColorValueTextView(value: blueSliderValue)
                    SliderView(sliderValue: $blueSliderValue, tint: .blue)
                    ColorTFView(value: $blueSliderValue, textValue: $blueTextField)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


