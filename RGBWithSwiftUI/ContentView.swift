//
//  ContentView.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            Image("Image")
                .frame(width: 250, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .background(Color.yellow)
            RedSliderView(value: $redSliderValue, color: .red)
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

struct RedSliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(value)")
                .foregroundColor(color)
            Slider(value: $value)
            
        }
    }
}
