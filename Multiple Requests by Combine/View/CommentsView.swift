//
//  CommentsView.swift
//  Multiple Requests by Combine
//
//  Created by Dmitry Novosyolov on 13/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var zipVM: ZipViewModel
    var post: Post
    var body: some View {
        List {
            ForEach(zipVM.filterCommentsByPost(for: post)) { comment in
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "envelope")
                            .font(.subheadline)
                        Text(comment.email)
                            .foregroundColor(.blue)
                            .onTapGesture { print("Send email to: \(comment.email)")}
                        Spacer()
                        Text("ID: \(comment.id)")
                    }
                    .font(.caption)
                    Text(comment.name.capitalizingFirstLetter())
                        .bold()
                        .font(.custom("Optima", size: 15))
                    Text(comment.body.capitalizingFirstLetter())
                        .font(.custom("San Francisco", size: 14))
                        .lineLimit(nil)
                    Spacer()
                }
            }
        }.navigationBarTitle("Your Comments")
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(zipVM: ZipViewModel(),
                     post: Post(id: 777, title: "bla", body: "bla bla"))
    }
}
