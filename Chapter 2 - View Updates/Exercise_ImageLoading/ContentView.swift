//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var remote = Remote(
        url: URL(string: "https://picsum.photos/v2/list")!,
        transform: { try? JSONDecoder().decode([Photo].self, from: $0) }
    )
    
    var body: some View {
        NavigationView {
            if let photos = remote.value {
                List(photos) { photo in
                    NavigationLink(
                        destination: DetailView(url: photo.download_url),
                        label: { Text(photo.author) }
                    )
                }
            } else {
                ProgressView()
                    .onAppear { remote.load() }
            }
        }
    }
}
