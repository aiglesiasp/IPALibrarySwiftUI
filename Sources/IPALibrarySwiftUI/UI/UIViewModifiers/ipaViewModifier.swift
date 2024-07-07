//
//  ipaViewModifier.swift
//  
//
//  Created by Aitor Iglesias Pubill on 6/7/24.
//

import SwiftUI

///Modificador de vista para corner Radius
public struct ipaCornerRadiusMod: ViewModifier {
    let value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    
    ///content = parametro de entrada de la vista
    ///some View = La salida
    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: value))
    }
}
