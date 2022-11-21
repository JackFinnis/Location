//
//  LocationView.swift
//  Location
//
//  Created by Jack Finnis on 27/07/2022.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "speedometer").icon()
                Spacer()
                HStack(alignment: .lastTextBaseline) {
                    Text(vm.speed(from: vm.location.speed)).number()
                    Text(vm.speedUnit).unit()
                }
            }
            Row {} trailing: {
                Text("± \(vm.speed(from: vm.location.speedAccuracy)) \(vm.speedUnit)")
            }
            
            Spacer()
            HStack {
                Image(systemName: "arrow.up.to.line").icon()
                Spacer()
                HStack(alignment: .lastTextBaseline) {
                    Text(vm.altitude(from: vm.location.altitude)).number()
                    Text(vm.altitudeUnit).unit()
                }
            }
            Row {} trailing: {
                Text("± \(vm.altitude(from: vm.location.verticalAccuracy)) \(vm.altitudeUnit)")
            }
            
            Spacer()
            Label(vm.location.timestamp.formattedRelative(), systemImage: "clock.arrow.circlepath")
                .onTapGesture {
                    vm.objectWillChange.send()
                }
            Picker("Select Unit", selection: $vm.metric) {
                Text("Metric").tag(true)
                Text("Imperial").tag(false)
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}
