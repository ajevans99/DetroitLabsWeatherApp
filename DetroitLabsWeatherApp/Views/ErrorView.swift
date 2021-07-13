//
//  ErrorView.swift
//  DetroitLabsWeatherApp
//
//  Created by Austin Evans on 7/12/21.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 40, height: 40)
            Text("Something went wrong")
                .multilineTextAlignment(.center)
                .font(.system(size: 30, weight: .bold, design: .rounded))
            Text("Please try again later")
                .font(.system(size: 16, weight: .regular, design: .rounded))
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
