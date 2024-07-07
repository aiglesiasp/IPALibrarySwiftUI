//
//  IpaSecureTextFieldVisor.swift
//
//
//  Created by Aitor Iglesias Pubill on 7/7/24.
//


import SwiftUI

public struct IpaSecureTextFieldVisor: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let text: Binding<String>
    let placeHolder: String
    let keyboardType: UIKeyboardType
    let onSubmit: ()-> Void
    @State private var show = false
    
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
        ZStack {
            if(!show) {
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
            } else {
                TextField(placeHolder, text: text)
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
            
            HStack {
                Spacer()
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: "eye")
                })
                .foregroundStyle(show ? .gray : .blue)
                .padding(.trailing, 10)
            }
        }
    }
}


#if DEBUG
struct Preview_IpaSecureTextFieldVisor: View {
    @State private var name: String = ""
    
    var  body: some View {
        IpaSecureTextFieldVisor(
            text: $name,
            placeHolder: "password...",
            keyboardType: .default) {
                //onSubmit
            }
    }
}

#Preview {
    Preview_IpaSecureTextFieldVisor()
}

#endif
