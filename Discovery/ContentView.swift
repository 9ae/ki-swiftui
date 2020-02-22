//
//  ContentView.swift
//  Discovery
//
//  Created by Alice Q Wong on 2/22/20.
//  Copyright © 2020 Alice Q Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var profiles : [Profile]
    
    
    init(profiles: [Profile]){
        UITableView.appearance().separatorStyle = .none
        self.profiles = profiles
    }
    
    var body: some View {
        NavigationView{
            List(profiles, id: \.uuid){ pro in
                DiscoverRow(profile: pro)
                    .frame(width: nil, height: 230, alignment: .top)
                .cornerRadius(16)
                    .shadow(color: Color.gray, radius: 7, x: 1, y: 2)
            } // end of list
        } // end of nav view
    } // END OF BODY
} // END OF VIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(profiles: mockDiscoverProfiles)
    }
}
