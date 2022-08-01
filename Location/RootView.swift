//
//  RootView.swift
//  Location
//
//  Created by Jack Finnis on 27/07/2022.
//

import SwiftUI

struct RootView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        LocationView(vm: vm)
            .sheet(isPresented: $vm.showWelcomeView) {
                WelcomeView(vm: vm)
            }
            .alert("Allow Access", isPresented: $vm.error) {
                Button("Cancel") {}
                Button("Open Settings", role: .cancel) {
                    vm.openSettings()
                }
            } message: {
                Text("\(APP_NAME) needs access to your location to show your speed and altitude. Please go to the Settings app and allow access to be able to use the app.")
            }
    }
}
