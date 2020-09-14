//
//  APODSwiftUIView.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI

struct APODContentView: View {
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    private var closedRange: ClosedRange<Date> {
        let eightDaysAgo = Calendar.current.date(byAdding: .day, value: -18, to: Date())!
        return eightDaysAgo...Date()
    }
    
    @State var searchAPOD: ((String) -> Void)?
    @State private var date = Date()
    var body: some View {
        VStack {
            CLForm(title: "Astronomy Pictute of the Day")
            CLCard(title: "Discover the cosmos!", explanation: "Each day a different image or photograph of our fascinating universe is featured, along with a brief explanation written by a professional astronomer.")
            DatePicker(String(), selection: $date, in: closedRange, displayedComponents: .date)
            
            Text("Date is \(date, formatter: dateFormatter)")
            Spacer(minLength: 25)
            Button(action: {
                self.searchAPOD?(self.dateString())
            }) {
                Text("Search")
                    .font(FontFactory.fontWithStyle(.semiBold, .paragraph02))
                    .foregroundColor(Theme.BaseColor.black.color)
                    .frame(width: 90, height: 40, alignment: .center)
                    .background(Theme.BaseColor.success.color)
                .cornerRadius(10)
            }
            Spacer()
        }.background(Theme.BaseColor.backgroundPrimary.color
            .edgesIgnoringSafeArea(.all))
    }
    
    private func dateString() -> String {
        dateFormatter.string(from: date)
    }
    
}

struct APODSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        APODContentView()
    }
}
