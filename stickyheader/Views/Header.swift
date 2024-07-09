//
//  Header.swift
//  stickyheader
//
//  Created by minoh.park on 7/9/24.
//

import SwiftUI

struct Header: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Spacer()
            Text("City of Korea")
                .fontWeight(.bold)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Text("한국의 도시")
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Spacer()
            Divider()
                .background(colorScheme == .dark ? Color.white : Color.black)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 56)
        .background(Rectangle().foregroundColor(colorScheme == .dark ? .black : .white))
    }
}
