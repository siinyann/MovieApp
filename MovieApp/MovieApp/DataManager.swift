//
//  DataManager.swift
//  MovieApp
//
//  Created by Sin Yan on 16/3/22.
//

import UIKit
import FirebaseFirestore

class DataManager: NSObject {
    static var db = Firestore.firestore()
    
    static func addMovie(movie: Movie) {
        var ref: DocumentReference? = nil
        ref = db.collection("movies").addDocument(data: [
            "name": movie.name,
            "rating": movie.rating,
            "image": movie.image,
            "desc": movie.desc
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    static func updateMovie(movie: Movie) {
        db.collection("movies").document(movie.id).setData([
            "name": movie.name,
            "rating": movie.rating,
            "image": movie.image,
            "desc": movie.desc
        ]) { err in
            if let err = err {
                print("Error updating document \(movie.id): \(err)")
            } else {
                print("Document \(movie.id) successfully updated!")
            }
        }
    }
    
    static func deleteMovie(id: String) {
        db.collection("movies").document(id).delete() { err in
            if let err = err {
                print("Error removing document \(id): \(err)")
            } else {
                print("Document \(id) successfully removed!")
            }
        }
    }
    
    // Loads the full list of movies from Firebase and converts it into a [movie] array.
    //
    // Since this is asynchronous, we need an onComplete closure, a piece of code that can be trigerred to run once the loading from Firebase is complete.
    //
    static func loadMovies(onComplete: @escaping (([Movie]) -> Void)) {
        db.collection("movies").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                onComplete([])
            } else {
                var movieList: [Movie] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let movie = Movie(
                        id: document.documentID,
                        name: data["name"] as! String,
                        desc: data["desc"] as! String,
                        rating: data["rating"] as! Int,
                        image: data["image"] as! String)
                    movieList.append(movie)
                }
                onComplete(movieList)
            }
        }
    }
    
    static func addTestData() {
        // Source: https://www.gv.com.sg/GVMovies
        addMovie(movie:Movie(
            id: "3040",
            name: "The Batman",
            desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            rating: 4,
            image: "https://www.gv.com.sg/media/imagesresize/img3040.jpg"))
        
        addMovie(movie:Movie(
            id: "3015",
            name: "Spencer",
            desc: "The marriage of Princess Diana and Prince Charles has long since grown cold. Though rumors of affairs and a divorce abound, peace is ordained for the Christmas festivities at the Queen's Sandringham Estate. There's eating and drinking, shooting and hunting. Diana knows the game. But this year, things will be profoundly different. SPENCER is an imagining of what might happened during those few fateful days.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3015.jpg"))
        
        addMovie(movie:Movie(
            id: "3073",
            name: "The Godfather (50th Anniversary)",
            desc: "Paramount Pictures celebrates the 50th Anniversary of Francis Food Coppola's cinematic masterpiece, made available on 4K Ultra HD for the first time ever. Coppola's masterful film adaptation of Mario Puzo's novel chronicles the rise and fall of the Corleone family and the film trilogy  is rightfully viewed as one of the greatest films in cinematic history. The film has been meticulously restored under the direction of Coppola, over the course of three years.",
            rating: 5,
            image: "https://www.gv.com.sg/media/imagesresize/img3073.jpg"))
    }
}

