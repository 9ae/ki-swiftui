//
//  DailyMatches.swift
//  Discovery
//
//  Created by Alice Q Wong on 2/29/20.
//  Copyright © 2020 Alice Q Wong. All rights reserved.
//

import SwiftUI

struct DailyMatches: View {
    
    @EnvironmentObject var dm : DM
    
    var hideAction: () -> Void
    
    func picture(_ profile : Profile) -> Image? {
        if let pic_id = profile.picture_public_id {
            let url = URL(string: "https://res.cloudinary.com/i99/image/upload/c_thumb,g_face,h_144,w_144/\(pic_id)")
            do {
                let imgData = try Data(contentsOf: url!)
                let img = UIImage(data: imgData)
                return Image(uiImage: img!)
            } catch {
              return nil
            }
        } else {
          return  nil
        }
    }
    
    func renderMatch(_ index : Int) -> AnyView {
        let empty = AnyView(Circle()
                .foregroundColor(Color.myFadePrimary)
                .frame(width: 72, height: 72))
        
        if index < dm.dailyMatches.count {
            let profile = dm.dailyMatches[index]
            if let pic = picture(profile) {
                return AnyView(VStack{
                    pic.resizable().frame(width: 72, height: 72, alignment: .center).clipShape(Circle())
                    Text(profile.name).foregroundColor(Color.myTitle).font(.subheadline)
                })
            } else {
                return empty
            }
        } else {
            return empty
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button(action: self.hideAction){Image(systemName: "chevron.up.square.fill").foregroundColor(Color.myAction)}
                Spacer()
                Text("Today's Matches").font(.callout).foregroundColor(Color.myText)
                Spacer()
            }
            HStack(alignment: .top) {
                renderMatch(0)
                Spacer()
                renderMatch(1)
                Spacer()
                renderMatch(2)
            }
        }.padding().background(Color.myBG)
    } //end of view
}

struct DailyMatches_Previews: PreviewProvider {
    static var previews: some View {
        DailyMatches(hideAction: { print("hide") }).previewLayout(.fixed(width: 375, height: 150)).environmentObject(mockDM())
    }
}
