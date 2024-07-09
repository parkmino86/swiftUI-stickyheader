# SwiftUI Sticky Header

## Overview

This project demonstrates how to implement a sticky header using SwiftUI. The sticky header remains fixed at the top of the view while the content scrolls underneath it, providing a sleek and modern user experience.

## Features

- **Sticky Header**: A header that remains fixed while content scrolls.
- **Smooth Scrolling**: Seamless integration with SwiftUI's List and ScrollView.
- **Customizable Design**: Easily adaptable to different header styles and content.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## Installation

Clone the repository:

```sh
git clone https://github.com/parkmino86/swiftUI-stickyheader.git
cd swiftUI-stickyheader
```

Open the project in Xcode:

```sh
open stickyheader.xcodeproj
```

Build and run the project on your desired simulator or device.

## Usage

To use the sticky header in your own project, you can integrate the provided `StickyHeaderView` into your SwiftUI views. Customize the content and appearance as needed.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        StickyHeaderView {
            // Your content here
        }
    }
}
```

### Example Code

Below is an example implementation of the sticky header in `ContentView.swift`:

```swift
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
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

Inspired by various SwiftUI tutorials and examples on sticky headers and smooth scrolling.

## Contact

For any questions or feedback, feel free to open an issue or contact me directly.
