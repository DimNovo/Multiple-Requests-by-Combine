//
//  ContentView.swift
//  Multiple Requests by Combine
//
//  Created by Dmitry Novosyolov on 13/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var zipVM = ZipViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(zipVM.posts) { post in
                    NavigationLink(destination: CommentsView(zipVM: self.zipVM, post: post)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(post.title.capitalizingFirstLetter())
                                .bold()
                                .font(.custom("Optima", size: 15))
                            Text(post.body.capitalizingFirstLetter())
                                .font(.custom("San Francisco", size: 14))
                                .lineLimit(nil)
                            Spacer()
                            HStack(alignment: .firstTextBaseline) {
                                Image(systemName: "message.fill")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .shadow(color: .secondary, radius: 5, x: 0, y: 5)
                                Text("\(self.zipVM.filterCommentsByPost(for: post).count)")
                                Spacer()
                                Text("ID: \(post.id)")
                            }
                            .font(.caption)
                        }
                    }
                }
            }.navigationBarTitle("My Posts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
