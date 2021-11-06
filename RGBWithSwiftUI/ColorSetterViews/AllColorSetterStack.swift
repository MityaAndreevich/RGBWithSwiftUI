//
//  AllColorSetterStack.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 03.11.2021.
//

import SwiftUI

struct AllColorSetterStack: View {
    
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let tintColor: Color
    
    var body: some View {
        HStack{
            ColorValueTextView(value: sliderValue)
            SliderView(sliderValue: $sliderValue, tint: tintColor)
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
            ColorTFView(value: $sliderValue, textValue: $textValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct AllColorSetterStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            AllColorSetterStack(sliderValue: .constant(120), tintColor: .red)
        }
    }
}
