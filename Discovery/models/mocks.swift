//
//  mocks.swift
//  Discovery
//
//  Created by Alice Q Wong on 2/22/20.
//  Copyright © 2020 Alice Q Wong. All rights reserved.
//

import Foundation

func genPro(name: String, age: Int, picture: String, vouches: Int, kinksMatched: Int) -> Profile {
    let pro = Profile(uuid: UUID().uuidString , name: name, age:age, picture_public_id: picture)
    pro.vouches = vouches
    pro.kinksMatched = kinksMatched
    return pro
}

let mockDiscoverProfiles : [Profile] = [
    genPro(name: "Test Kenzi", age: 29, picture: "95f2176b-5369-42b3-9bab-bc6494361c76", vouches: 0, kinksMatched: 4),
    genPro(name: "Test Demo 2", age: 32, picture: "f2e2f199-3a7c-4392-82a1-dcc796c74bb9", vouches: 8, kinksMatched: 1),
]
