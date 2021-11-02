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
                Color(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                    .frame(width: 250, height: 150)
                    .overlay(Rectangle().stroke(.white, lineWidth: 3))
                SliderView(value: $redSliderValue, text: $redTextField, tint: .red)
                    .keyboardType(.decimalPad)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Done", action: setValuesFromTextRed)
                                .alert("Wrong Input", isPresented: $alertPresenter, actions: {})
                        }
                    }
                SliderView(value: $greenSliderValue, text: $greenTextField, tint: .green)
                    .keyboardType(.decimalPad)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Done", action: setValuesFromTextGreen)
                                .alert("Wrong Input", isPresented: $alertPresenter, actions: {})
                        }
                    }
                SliderView(value: $blueSliderValue, text: $blueTextField, tint: .blue)
                    .keyboardType(.decimalPad)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Done", action: setValuesFromTextBlue)
                                .alert("Wrong Input", isPresented: $alertPresenter, actions: {})
                        }
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
                //.keyboardType(.decimalPad)
        }
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension ContentView {
    func setValuesFromTextRed() {
        if redSliderValue >= 0 && redSliderValue <= 255 {
            redSliderValue = Double(redTextField) ?? 0
            UIApplication.shared.endEditing()
        } else {
            alertPresenter.toggle()
        }
    }
    
    func setValuesFromTextGreen() {
        if greenSliderValue >= 0 && greenSliderValue <= 255 {
            greenSliderValue = Double(greenTextField) ?? 0
            UIApplication.shared.endEditing()
        } else {
            alertPresenter.toggle()
        }
    }
    
    func setValuesFromTextBlue() {
        if blueSliderValue >= 0 && blueSliderValue <= 255 {
            blueSliderValue = Double(blueTextField) ?? 0
            UIApplication.shared.endEditing()
        } else {
            alertPresenter.toggle()
        }
    }
}
