//
//  extension+View.swift
//
//
//  Created by Aitor Iglesias Pubill on 6/7/24.
//

import SwiftUI


extension View {
    public func ipaCornerRadius(value: CGFloat) -> some View {
        modifier(ipaCornerRadiusMod(value: value))
    }
}
