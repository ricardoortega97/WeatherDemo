//
//  LoadingView.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/30/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
       ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
    }
}

#Preview {
    LoadingView()
}
