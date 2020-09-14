//
//  APODDetailContentView.swift
//  Nasa API
//
//  Created by Pedro Ramos on 13/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI

struct APODDetailContentView: View {
    @State var entity: EntityAPOD
    var body: some View {
        VStack {
            CLCard(title: entity.title, explanation: entity.explanation)
            if entity.mediaType == .image {
                CLImage(withURL: entity.url)
            } else {
                Button (action: {
                    UIApplication.shared.open(URL(string: self.entity.url)!)
                }) {
                    Text("Open Video")
                        .font(FontFactory.fontWithStyle(.semiBold, .paragraph02))
                        .foregroundColor(Theme.BaseColor.black.color)
                        .frame(width: 90, height: 40, alignment: .center)
                        .background(Theme.BaseColor.actionBlue.color)
                        .cornerRadius(10)
                }
            }
            Spacer()
        }.background(Theme.BaseColor.backgrounsSecondary.color.edgesIgnoringSafeArea(.all))
    }
}

struct APODDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        APODDetailContentView(entity: EntityAPOD(copyright: nil, date: "2020-09-09", explanation: "", mediaType: .image, serviceVersion: "v1", title: "", url: "", hdurl: nil))
    }
}
