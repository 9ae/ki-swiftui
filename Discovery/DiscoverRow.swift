//
//  DiscoverRow.swift
//  Discovery
//
//  Created by Alice Q Wong on 2/22/20.
//  Copyright © 2020 Alice Q Wong. All rights reserved.
//

import SwiftUI

struct DiscoverRow: View {
    var profile : Profile
    
    func picture() -> Image {
        if let pic_id = profile.picture_public_id {
            let url = URL(string: "https://res.cloudinary.com/i99/image/upload/c_thumb,g_face,h_460,w_750/\(pic_id)")
            do {
                let imgData = try Data(contentsOf: url!)
                let img = UIImage(data: imgData)
               return Image(uiImage: img!)
            } catch {
              return Image(systemName: "icloud")
            }
        } else {
          return  Image(systemName: "icloud")}
    }
    
    func kinksCount(_ count: Int) -> Text {
        let noun = "\(count > 1 ? "kinks" : "kink")"
        return Text("\(count) \(noun)\n matched")
    }
    
    func vouchCount(_ count: Int) -> Text? {
        if count > 0 {
            let noun = "\(count > 1 ? "members" : "member")"
            return Text("vouched by\n\(count) \(noun)")
        } else {
            return nil
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                picture().resizable()
                HStack(alignment: .top, spacing: 16) {
                    Text(profile.name)
                        .padding(.horizontal, 16)
                        .font(.headline)
                    
                    kinksCount(profile.kinksMatched)
                        .font(.caption)
                    
                    vouchCount(profile.vouches)
                        .padding(.bottom, 8)
                        .font(.caption)
                }
                .frame(width: nil, height: 64, alignment: .center)
                .background(Color(hue: 0, saturation: 0, brightness: 1.0, opacity: 0.8))
            }
            VStack(alignment: .center, spacing: 24) {
                Button(action:{ print("liked") }){
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 36, height: 36, alignment: .center)
                        .foregroundColor(Color.pink)
                        .background(Color.white)
                        .cornerRadius(18)
                        .shadow(color: Color.gray, radius: 2, x: -1, y: 1)
                }
                Button(action:{ print("skip") }){
                   Image(systemName: "arrowshape.turn.up.right.circle.fill")
                       .resizable()
                       .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(Color.gray)
                       .background(Color.white)
                       .cornerRadius(12)
                }
            }
            .padding(.trailing, 8)
            .padding(.bottom, 8)
        }
        .background(Color.white)
    }
    
}

struct DiscverRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRow(profile: mockDiscoverProfiles[1]).previewLayout(.fixed(width: 375, height: 230))
    }
}
