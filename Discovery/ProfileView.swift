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
    
    func bioPrompts () -> AnyView? {
        if let prompts = profile.prompts?.filter({ prompt in prompt.show}) {
            return AnyView(VStack(alignment: .leading) {
                ForEach(prompts, id: \.title) { q in
                    VStack(alignment: .leading) {
                        Text(q.title).font(.caption)
                        Text(q.answer!).font(.body)
                    }.padding(.vertical, 8)
                    } //end of ForeEach
                }) // end of VStack
            }
        else { return nil }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 16) {
                    picture().resizable().frame(width: nil, height: 400, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(profile.name).font(.title)
                        Text("\(profile.age) years old, living in \(profile.city!)")
                            .font(.body)
                        HStack(alignment: .top, spacing: 16) {
                            KinksCountView(count: profile.kinksMatched).fixedSize(horizontal: false, vertical: true)
                            
                            if profile.vouches > 0 {
                                VouchCountView(count: profile.vouches).fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                    bioText()?.padding(16).font(.body).lineLimit(nil)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("My gender(s) are:").font(.subheadline)
                        TagList(labels: profile.genders, bgColor: Color.green, textColor: Color.white).padding(.leading, -8)
                            .padding(.bottom, 16)
                        Text("Role(s) I play are:").font(.subheadline)
                        TagList(labels: profile.roles, bgColor: Color.orange, textColor: Color.white).padding(.leading, -8)
                    }.padding(.horizontal, 16)
                    
                    bioPrompts()?.padding(.horizontal, 16).font(.body)
                    
                    // To give additional space between content and buttons
                    Rectangle().frame(minWidth: 10, idealWidth: nil, maxWidth: nil, minHeight: 50, idealHeight: nil, maxHeight: nil, alignment: .center)
                        .foregroundColor(Color.white)
                    
                } // end of content stack
            } //end of scroll view
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
