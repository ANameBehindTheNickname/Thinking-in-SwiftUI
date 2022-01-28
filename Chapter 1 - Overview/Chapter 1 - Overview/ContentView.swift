//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Button(
                action: { counter += 1 },
                label: {
                    Text("Tap me!")
                        .padding()
                        .background(Color(.tertiarySystemFill))
                        .cornerRadius(5)
                }
            )
            
            if counter > 0 {
                Text("You've tapped me \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
        }
        .debug()
        .frame(width: 200, height: 200)
        .border(Color.black)
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
