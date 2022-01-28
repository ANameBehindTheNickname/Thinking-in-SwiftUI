//
//
//  Copyright © 2022 ANameBehindTheNickname. All rights reserved.
//

import SwiftUI

let contacts = [Contact(name: "name1", city: "city1"), Contact(name: "name2", city: "city2")]

final class Contact: ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var name: String
    @Published var city: String
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

struct Detail: View {
    @ObservedObject var contact: Contact
    
    var body: some View {
//        print("Detail")
        return VStack {
            Text(contact.name)
                .bold()
            
            Text(contact.city)
        }
    }
}

struct ContactContentView: View {
    @State var selection: Contact?
    
    var body: some View {
//        print("ContactContentView")
        return Group {
            HStack {
                ForEach(contacts) { contact in
                    Button(contact.name) { selection = contact }
                }
            }
            
            if let contact = selection {
                Detail(contact: contact)
            }
        }
    }
}
