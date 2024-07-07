//
//  IpaButton.swift
//  
//
//  Created by Aitor Iglesias Pubill on 6/7/24.
//

import SwiftUI


/// Default Button
public struct IpaButton <Content: View>: View {

    @Environment(\.colorScheme) var colorScheme
    
    //Atributos de mi componente
    let content: Content
    let action: () -> Void
    let cornerRadius: CGFloat
    let padding: CGFloat
    
    //inicializadores de mi componente
    public init(
        @ViewBuilder content: @escaping () -> Content,
        action: @escaping () -> Void,
        cornerRadius: CGFloat = 30.0,
        padding: CGFloat = 10.0
    ) {
        self.content = content()
        self.action = action
        self.cornerRadius = cornerRadius
        self.padding = padding
    }
    
    //Creamos el button
    public var body: some View {
        Button(
            action: self.action,
            label: {
                content
            }
        )
        .padding(self.padding)
        .background(IPAColor(colorScheme: colorScheme).primaryColor)
        .foregroundColor(IPAColor(colorScheme: colorScheme).textColor)
        .ipaCornerRadius(value: cornerRadius)
    }
    
}


#if DEBUG
struct Preview_IpaButton: View {
    var  body: some View {
        IpaButton(
            content: {
                Text("Mi first custom button")
            },
            action: {
                //Llamar
            },
            cornerRadius: 10.0,
            padding: 10.0)
    }
}

#Preview {
    Preview_IpaButton()
}

#endif
