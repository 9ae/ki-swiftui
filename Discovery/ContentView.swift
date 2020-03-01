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
    
    @State var showDailyMatches = false
    
    init(){
        UITableView.appearance().separatorStyle = .none
     //   self.profiles = profiles
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
            List(dm.discoverProfiles, id: \.uuid){ pro in
                NavigationLink(destination: ProfileView(profile: pro) ){
                    DiscoverRow(profile: pro)
                        .frame(width: nil, height: 230, alignment: .top)
                        .cornerRadius(16)
                        .shadow(color: Color.gray, radius: 7, x: 1, y: 2)
                }
            } // end of list
            
            DailyMatches(hideAction: {
                self.showDailyMatches = false
            }).offset(x: 0, y: showDailyMatches ? 0 : -300).animation(.easeIn)
                .clipped()
                .shadow(color: Color.black, radius: 8, x: 0, y: 5)
            } // end of zStack
            .navigationBarItems(trailing:
                NavigationLink(destination: PreferencesView(), label: {
                    Image(systemName: "slider.horizontal.3").foregroundColor(Color("primaryColor"))
                })
                    .padding(.trailing, 16)
            )
            .navigationBarHidden(showDailyMatches)
        } // end of nav view
        .background(Color.myBG)
        .onAppear {
            self.showDailyMatches = self.dm.dailyMatches.count > 0
        }
    } // END OF BODY
} // END OF VIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(mockDM())
    }
}
