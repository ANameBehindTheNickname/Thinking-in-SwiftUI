//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI
import UIKit

struct DetailView: View {
    @ObservedObject var remote: Remote<UIImage>
    
    init(url: URL) {
        remote = .init(url: url, transform: { UIImage(data: $0) })
    }
    
    var imageOrPlaceholder: Image {
        remote.value.map(Image.init) ?? Image(systemName: "photo")
    }
    
    var body: some View {
        imageOrPlaceholder
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .onAppear {
                remote.load()
            }
    }
}
