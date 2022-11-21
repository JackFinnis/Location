//
//  View.swift
//  Ecommunity
//
//  Created by Jack Finnis on 16/01/2022.
//

import SwiftUI

extension View {
    func horizontallyCentred() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func number() -> some View {
        self
            .font(.system(size: 70))
    }
    
    func unit() -> some View {
        self
            .font(.system(size: 50))
            .foregroundColor(.secondary)
    }
    
    func icon() -> some View {
        self
            .font(.system(size: 40))
            .foregroundColor(.accentColor)
    }
}
