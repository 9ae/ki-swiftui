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
    
    pro.city = "New York"
    pro.genders = ["agender","non-binary"]
    pro.roles = ["domme", "exhibitionist", "masochist"]
    pro.bio = "Lorem ipsum. blah bha. | He's not like the other guys. He's a NICE guy -- but wait, is he really that nice? What's behind his sweet, romantic act? In this video, we take on the Nice Guy archetype and figure out what he represents in our world today."
    pro.kinks =
        [ Kink(label: "pegging", code: "pegging", form: .act, exp: 3, likesGive: true, likesGet: false, likesBoth: false),
          Kink(label: "massages", code: "massages", form: .service, exp: 2, likesGive: false, likesGet: false, likesBoth: true),
          Kink(label: "corset", code: "corset", form: .wearable, exp: 2, likesGive: false, likesGet: true, likesBoth: false)
        ]
    
    pro.prompts =
        [BioPrompt(title: "I am really good at...", answer: "making breakfast", show: true),
         BioPrompt(title: "I spend my days thinking about...", answer: "soccer", show: false),
         BioPrompt(title: "My safe word is...", answer: "penguin", show: true)
        ]
    
    return pro
}

let mockDiscoverProfiles : [Profile] = [
    genPro(name: "Test Kenzi", age: 29, picture: "95f2176b-5369-42b3-9bab-bc6494361c76", vouches: 0, kinksMatched: 4),
    genPro(name: "Test Demo 2", age: 32, picture: "f2e2f199-3a7c-4392-82a1-dcc796c74bb9", vouches: 8, kinksMatched: 1),
]
