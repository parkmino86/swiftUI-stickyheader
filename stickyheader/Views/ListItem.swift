//
//  ListItem.swift
//  stickyheader
//
//  Created by minoh.park on 7/9/24.
//

import SwiftUI

struct ListItem: View {
    let title: String
    
    var body: some View {
        ZStack {
            Image(title)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.black)
                .opacity(0.5)
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}
