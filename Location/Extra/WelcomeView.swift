//
//  WelcomeView.swift
//  Location
//
//  Created by Jack Finnis on 27/07/2022.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(15)
                .padding()
                .horizontallyCentred()
            Text("Welcome to\n\(NAME)")
                .bold()
                .font(.largeTitle)
                .horizontallyCentred()
                .padding(.bottom, 50)
            
            WelcomeRow(image: "speedometer", title: "Track your speed", description: "Track your live speed in miles per hour and kilometers per hour.")
            WelcomeRow(image: "arrow.up.to.line", title: "Measure your altitude", description: "Measure your altitude above sea level in feet and metres.")
            
            Spacer()
            Button {
                vm.buttonTapped()
            } label: {
                Text("Continue")
                    .bold()
                    .padding()
                    .horizontallyCentred()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(15)
            }
        }
        .padding()
        .interactiveDismissDisabled()
    }
}

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
