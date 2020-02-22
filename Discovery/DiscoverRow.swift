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
        ZStack(alignment: .trailing) {
          picture().resizable().scaledToFill()
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(profile.name).padding(.horizontal, 16)
                Spacer()
                kinksCount(profile.kinksMatched)
                    .padding(.horizontal, 16)
                vouchCount(profile.vouches)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
            }
            .background(Color.purple)
        }
    }
    
}

struct DiscverRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRow(profile: mockDiscoverProfiles[1]).previewLayout(.fixed(width: 375, height: 230))
    }
}
