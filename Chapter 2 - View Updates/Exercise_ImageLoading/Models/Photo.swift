//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import Foundation
import UIKit

struct LoadingError: Error { }

struct Photo: Decodable, Identifiable {
    let id: String
    let author: String
    let download_url: URL
}

final class Remote<T>: ObservableObject {
    @Published var result: Result<T, Error>?
    var value: T? {
        try? result?.get()
    }
    
    let url: URL
    let transform: (Data) -> T?
    
    init(url: URL, transform: @escaping (Data) -> T?) {
        self.url = url
        self.transform = transform
    }
    
    func load() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let d = data, let v = self.transform(d) {
                    self.result = .success(v) } else {
                        self.result = .failure(LoadingError()) }
            } }.resume()
    }
}
