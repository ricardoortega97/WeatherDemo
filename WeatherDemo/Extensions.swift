//
//  Extensions.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/30/24.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RounderCorner(radius: radius, corners: corners))
    }
}

struct RounderCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
