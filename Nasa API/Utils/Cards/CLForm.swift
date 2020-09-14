//
//  CLForm.swift
//  Nasa API
//
//  Created by Pedro Ramos on 13/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI

struct CLForm: View {
    @State var title: String
    var body: some View {
        HStack {
            Image(systemName: "staroflife")
            VStack {
                Text(title)
                    .lineLimit(1)
            }
        }
        .font(FontFactory.fontWithStyle(.black, .heading04))
        .frame(maxWidth: .infinity)
        .frame(height: 30, alignment: .center)
        .padding(10)
        .foregroundColor(Theme.BaseColor.textPrimary.color)
        .background(Theme.BaseColor.disabled.color)
    }
}

struct CLForm_Previews: PreviewProvider {
    static var previews: some View {
        CLForm(title: "Lorem ipsum")
            .previewLayout(.sizeThatFits)
    }
}
