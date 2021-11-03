//
//  SliderView.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 02.11.2021.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double
    //@State private var textVlue = ""
    
    let tint: Color
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...255, step: 1)
            .tint(tint)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(120), tint: .red)
    }
}
