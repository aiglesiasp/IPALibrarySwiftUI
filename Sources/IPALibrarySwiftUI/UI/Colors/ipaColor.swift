//
//  ipaColor.swift
//
//
//  Created by Aitor Iglesias Pubill on 6/7/24.
//

import SwiftUI

///Struct de colores generales de la App

public struct IPAColor {
    private var colorScheme: ColorScheme
    
    public init(colorScheme: ColorScheme = .light) {
        self.colorScheme = colorScheme
    }
    
    ///Primary Color
    public var primaryColor: Color {
        switch colorScheme {
        case .light:
            return Color.orange
        case .dark:
            return Color.gray
        @unknown default:
            return Color.orange
        }
    }
    
    ///Secondary Color
    public var secundaryColor = Color.white
    
    public var textColor = Color.gray
    
    ///Color Background Caja Texto
    public var textBackColor: Color {
        switch colorScheme {
        case .light:
            return Color.white
        case .dark:
            return Color.red.opacity(0.6)
        @unknown default:
            return Color.white
        }
    }
    
    ///Color Foreground Caja Texto
    public var textForeColor: Color {
        return Color.orange
    }
    
    ///Color Button Action
    public var buttonActionText: Color {
        switch colorScheme {
        case .light:
            return Color.black
        case .dark:
            return Color.white
        @unknown default:
            return Color.black
        }
    }
}
