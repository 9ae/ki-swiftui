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
    
    func vouchCount(_ count: Int) -> VouchCountView? {
        if count > 0 {
            return VouchCountView(count: count)
        } else {
            return nil
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
        ZStack(alignment: .bottomTrailing) {
            self.picture().resizable()
            HStack(alignment: .top, spacing: 16) {
                Text(self.profile.name)
                    .padding(.horizontal, 16)
                    .font(.headline)
                    .foregroundColor(Color.myBG)
                
                KinksCountView(count: self.profile.kinksMatched)
                
                self.vouchCount(self.profile.vouches)
            }
            .frame(width: geometry.size.width , height: 64, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .background(Color(hue: 0, saturation: 0, brightness: 0.1, opacity: 0.8))
            VStack(alignment: .center, spacing: 24) {
                HeartButton(size: 36){print("liked")}
                    .shadow(color: Color.gray, radius: 2, x: -1, y: 1)
                NextButton(size: 25){print("skip")}
            }
            .padding(.trailing, 8)
            .padding(.bottom, 8)
        }
        .background(Color.white)
        }
    } // END OF view

}

struct DiscverRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRow(profile: mockDiscoverProfiles[1]).previewLayout(.fixed(width: 375, height: 230))
    }
}
