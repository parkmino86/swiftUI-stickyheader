//
//  ContentView.swift
//  stickyheader
//
//  Created by minoh.park on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetY: CGFloat = CGFloat.zero
    @Environment(\.colorScheme) var colorScheme
    
    let contents = ["Seoul", "Daejeon", "Daegu", "Busan"]
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                let offset = geometry.frame(in: .global).minY
                setOffset(offset: offset)
                ZStack {
                    Image("Korea")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    Text("대한민국")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .frame(
                    width: geometry.size.width,
                    height: 250 + (offset > 0 ? offset : 0)
                )
                .offset(y: (offset > 0 ? -offset : 0))
            }
            .frame(minHeight: 250)
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header: Header()) {
                    VStack {
                        ForEach(contents, id: \.self) { name in
                            ListItem(title: name)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
        }
        .overlay(
            GeometryReader { geometry in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .frame(height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(offsetY > -250 ? 0 : 1)
            }, alignment: .top
        )
    }
    
    func setOffset(offset: CGFloat) -> some View {
        DispatchQueue.main.async {
            self.offsetY = offset
        }
        return EmptyView()
    }
}

#Preview {
    ContentView()
}
