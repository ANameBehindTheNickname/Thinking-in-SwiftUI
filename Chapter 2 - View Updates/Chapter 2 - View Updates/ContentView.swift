//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI

struct LabelView: View {
    @Binding var number: Int
    
    @ViewBuilder var helper: some View {
        if number > 0 {
            Text("fdafsd")
        }
    }
    
    var helper2: some View {
        Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            } else {
                Image(systemName: "lightbulb")
            }
        }
    }
    
    var body: some View {
        print("LabelView")
        return Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        print("Content view")
        return VStack {
            Button("Tap me!") { counter += 1 }
            LabelView(number: $counter)
        }
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
