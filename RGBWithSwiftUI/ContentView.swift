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
    
    //@State private var alertPresenter = false
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack(spacing: 25) {
                Color(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                    .frame(width: 250, height: 150)
                    .overlay(Rectangle().stroke(.white, lineWidth: 3))
                SliderView(value: $redSliderValue, text: $redTextField, tint: .red)
                SliderView(value: $greenSliderValue, text: $greenTextField, tint: .green)
                SliderView(value: $blueSliderValue, text: $blueTextField, tint: .blue)
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

struct SliderView: View {
    @State private var alertPresenter = false
    @Binding var value: Double
    @Binding var text: String
    let tint: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 45)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tint)
            TextField("\(lround(value))", text: $text)
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Done", action: setValuesFromText)
                            .alert("Wrong Input", isPresented: $alertPresenter, actions: {})
                    }
                }
        }
    }
    private func setValuesFromText() {
        if value >= 0 && value <= 255 {
            value = Double(text) ?? 0
            UIApplication.shared.endEditing()
        } else {
            alertPresenter.toggle()
        }
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


