//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    @Binding var value: Double
    
    var body: some View {
        print("Knob")
        return KnobShape()
            .rotationEffect(.init(degrees: value * 330))
            .onTapGesture {
                value = value < 0.5 ? 1 : 0
            }
    }
}

struct ContentViewKnob: View {
    @State private var volume = 0.5
    
    var body: some View {
        print("ContentViewKnob")
        return VStack {
            Knob(value: $volume)
                .frame(width: 100, height: 100)
            
            MySlider(value: $volume, range: (0...1))
        }
    }
}

struct MySlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    
    var body: some View {
        print("MySlider")
        return Slider(value: $value, in: range)
    }
}
