//
//  ScrollNewInTownView.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import SwiftUI

struct ScrollNewCollectionView: View {
    @FetchRequest var collections: FetchedResults<NewCollection>
    @State var text: String = ""
    
    init() {
        _collections = FetchRequest<NewCollection>(sortDescriptors: [])
    }
    
    init(text: String) {
        if text.isEmpty {
            _collections = FetchRequest<NewCollection>(sortDescriptors: [SortDescriptor(\.title)])
        } else {
            _collections = FetchRequest<NewCollection>(sortDescriptors: [SortDescriptor(\.title)], predicate: NSPredicate(format: "title BEGINSWITH %@", text))
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Collection")
                .font(.system(size: 14))
                .padding(.horizontal, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(collections){ collection in
                        VStack(alignment: .leading) {
                            Image("newintown")
                                .frame(width: 230, height: 141)
                            HStack {
                                Text(collection.title ?? "")
                                    .font(.system(size: 14))
                                Spacer()
                                Image(systemName: "star.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(.orange)
                                Text("\(String(format: "%.1f", collection.rating))").font(.system(size: 10))
                                Text("(\(collection.noOfReview ?? ""))").foregroundColor(.gray).font(.system(size: 10))
                                Button(action: {
                                    collection.isBookmarked = !collection.isBookmarked
                                    PersistenceController.shared.save()
                                }) {
                                    let image = collection.isBookmarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                                    image
                                        .foregroundColor(.gray)
                                        .frame(width: 16, height: 12)
                                }
                            }
                            HStack {
                                Image("location").renderingMode(.template)
                                Text(collection.location ?? "")
                                    .font(.system(size: 12))
                            }
                            Text("$\(String(format: "%.2f", collection.price))")
                                .font(.system(size: 12))
                                .bold()
                        }
                        .padding(.horizontal, 15)
                    }
                }
            }
        }
    }
}

struct ScrollNewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollNewCollectionView()
    }
}
