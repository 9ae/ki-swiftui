//
//  ContentView.swift
//  Discovery
//
//  Created by Alice Q Wong on 2/22/20.
//  Copyright © 2020 Alice Q Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   // var profiles : [Profile]
    @EnvironmentObject var dm : DM
    
    init(){
        UITableView.appearance().separatorStyle = .none
     //   self.profiles = profiles
    }
    
    var body: some View {
        NavigationView{
            List(dm.discoverProfiles, id: \.uuid){ pro in
                NavigationLink(destination: ProfileView(profile: pro) ){
                    DiscoverRow(profile: pro)
                        .frame(width: nil, height: 230, alignment: .top)
                    .cornerRadius(16)
                        .shadow(color: Color.gray, radius: 7, x: 1, y: 2)
                }
            } // end of list
                .navigationBarItems(trailing:
                    NavigationLink(destination: PreferencesView(), label: {
                        Image(systemName: "slider.horizontal.3").foregroundColor(Color("primaryColor"))
                    })
                        .padding(.trailing, 16)
                )
        }.background(Color.myBG) // end of nav view
    } // END OF BODY
} // END OF VIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(mockDM())
    }
}
