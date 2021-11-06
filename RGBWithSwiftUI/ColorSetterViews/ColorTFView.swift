//
//  ColorTFView.swift
//  RGBWithSwiftUI
//
//  Created by Dmitry Logachev on 02.11.2021.
//

import SwiftUI

struct ColorTFView: View {
    
    @Binding var value: Double
    @Binding var textValue: String
    
    @State private var alertPresenter = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            checkValue()
        }
        .frame(width: 45)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong Format!", isPresented: $alertPresenter, actions: {}) {
            Text("Please, enter value from 0 to 255.")
        }
    }
}

extension ColorTFView {
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        alertPresenter.toggle()
        value = 0
        textValue = "0"
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorTFView(value: .constant(120), textValue: .constant("120"))
        }
    }
}
