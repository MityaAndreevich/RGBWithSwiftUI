//
//  ColorValueTextView.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 02.11.2021.
//

import SwiftUI

struct ColorValueTextView: View {
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 45)
            .foregroundColor(.white)
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorValueTextView(value: 100)
        }
    }
}
