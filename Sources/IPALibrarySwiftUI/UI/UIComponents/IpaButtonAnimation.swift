//
//  IpaButtonAnimation.swift
//  
//
//  Created by Aitor Iglesias Pubill on 7/7/24.
//

import SwiftUI


/// Default Button
public struct IpaButtonAnimation <Content: View>: View {

    @Environment(\.colorScheme) var colorScheme
    
    @State private var animationAmount = 0.5
    
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
        .overlay(
            Circle()
                .stroke(.blue) //Color borde
                .scaleEffect(animationAmount*2)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1.5)
                    .repeatForever(autoreverses: true), value: animationAmount
                )
                .padding()
        )
        .onAppear {
            animationAmount = 2.0
        }
    }
    
}


#if DEBUG
struct Preview_IpaButtonAnimation: View {
    var  body: some View {
        IpaButtonAnimation(
            content: {
                Text("Animacion")
            },
            action: {
                //Llamar
            },
            cornerRadius: 10.0,
            padding: 10.0)
    }
}

#Preview {
    Preview_IpaButtonAnimation()
}

#endif
