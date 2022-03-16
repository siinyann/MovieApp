//
//  Movie.swift
//  MovieApp
//
//  Created by Sin Yan on 15/3/22.
//

import UIKit

class Movie: NSObject {
    var id : String
    var name : String
    var desc : String
    var rating : Int
    var image : String
    
    init(id: String, name: String, desc: String, rating: Int, image: String)
    {
        self.id = id
        self.name = name
        self.desc = desc
        self.rating = rating
        self.image = image
    }


}
