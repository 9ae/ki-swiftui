//
//  ProfileView.swift
//  Discovery
//
//  Created by Alice Q Wong on 2/22/20.
//  Copyright © 2020 Alice Q Wong. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
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
    
    func bioText () -> Text? {
        if let s = profile.bio {
            return Text(s)
        } else {
            return nil
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 16) {
                    picture().resizable().frame(width: nil, height: 400, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(profile.name).font(.title)
                        Text("\(profile.age) years old, living in \(profile.city!)")
                        HStack(alignment: .top, spacing: 16) {
                            KinksCountView(count: profile.kinksMatched)
                            
                            if profile.vouches > 0 {
                                VouchCountView(count: profile.vouches)
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                    bioText()?.padding(16).font(.body)
                    
                }
            }
            HStack(alignment: .center, spacing: 24) {
                NextButton(size: 32){print("skip")}
                HeartButton(size: 48) {
                    print("like")
                }
            }.padding()
        }.background(Color.white)
    } // end of view
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: mockDiscoverProfiles[1])
    }
}
