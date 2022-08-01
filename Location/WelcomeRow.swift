//
//  WelcomeRow.swift
//  Location
//
//  Created by Jack Finnis on 27/07/2022.
//

import SwiftUI

struct WelcomeRow: View {
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(.accentColor)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical)
    }
}

struct WelcomeRow_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeRow(image: "speedometer", title: "Track your speed", description: "Track your live speed in miles per hour and kilometers per hour.")
    }
}
