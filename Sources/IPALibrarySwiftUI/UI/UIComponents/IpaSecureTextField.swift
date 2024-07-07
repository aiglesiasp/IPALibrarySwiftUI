//
//  IpaSecureTextField.swift
//
//
//  Created by Aitor Iglesias Pubill on 7/7/24.
//

import SwiftUI

public struct IpaSecureTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let text: Binding<String>
    let placeHolder: String
    let keyboardType: UIKeyboardType
    let onSubmit: ()-> Void
    
    //MARK: - Init
    public init(
        text: Binding<String>,
        placeHolder: String,
        keyboardType: UIKeyboardType,
        onSubmit: @escaping () -> Void
    ) {
        self.text = text
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        self.onSubmit = onSubmit
    }
    
    public var body: some View {
        SecureField(placeHolder, text: text)
            .keyboardType(keyboardType)
            .onSubmit(onSubmit)
            .padding()
            .background(IPAColor(colorScheme: colorScheme).textBackColor)
            .foregroundColor(IPAColor(colorScheme: colorScheme).textColor)
            .ipaCornerRadius(value: 20.0)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.none)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
    }
}


#if DEBUG
struct Preview_IpaSecureTextField: View {
    @State private var name: String = ""
    
    var  body: some View {
        IpaSecureTextField(
            text: $name,
            placeHolder: "password...",
            keyboardType: .default) {
                //onSubmit
            }
    }
}

#Preview {
    Preview_IpaSecureTextField()
}

#endif
