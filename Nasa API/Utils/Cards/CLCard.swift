//
//  CLCard.swift
//  Nasa API
//
//  Created by Pedro Ramos on 13/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI

struct CLCard: View {
    @State var title: String
    @State var explanation: String
    var body: some View {
        VStack {
            Text(title)
                .font(FontFactory.fontWithStyle(.light, .heading04))
                .foregroundColor(Theme.BaseColor.textPrimary.color)
                .padding(.horizontal, 15)
                .frame(minWidth: 150, maxWidth: .infinity)
                .frame(height: 30)
                .lineLimit(1)
            Rectangle()
                .frame(height: 1)
                .background(Theme.BaseColor.black.color)
            Text(explanation)
                .font(FontFactory.fontWithStyle(.regular, .paragraph01))
                .foregroundColor(Theme.BaseColor.textSecondary.color)
                .padding(15)
                .lineLimit(15)
        }
    }
}

struct CLCard_Previews: PreviewProvider {
    static var previews: some View {
        CLCard(
            title: "The standard Lorem Ipsum passage, used since the 1500s",
            explanation: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            .previewLayout(.sizeThatFits)
    }
}
