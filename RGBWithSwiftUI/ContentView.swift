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
    
    @State private var viewColor = Color.yellow
    
    var body: some View {
        VStack {
            Image(uiImage: <#T##UIImage#>)
                .frame(width: 250, height: 150)
                .background(viewColor)
            SliderView(value: $redSliderValue, text: $redTextField, color: .red)
            SliderView(value: $greenSliderValue, text: $greenTextField, color: .green)
            SliderView(value: $blueSliderValue, text: $blueTextField, color: .blue)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var value: Double
    @Binding var text: String
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 45)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("\(lround(value))", text: $text)
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
        }
    }
}
