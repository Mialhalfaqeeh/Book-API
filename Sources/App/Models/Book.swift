//
//  Book.swift
//  
//
//  Created by Milah Alfaqeeh  on 15/03/2023.
//

import Foundation
import Vapor
import Fluent


final class Book: Model, Content  {

    static let schema = "books"   // table name 
    
    @ID(key:.id)   // PK
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    
    @Field(key: "edition")
    var edition: String
   
    @Field(key: "cover")
    var cover: String

    
    @Field(key: "pdf")
    var pdf: String

    
    @Children(for: \.$book)
    var reviews:[Review]
    
    init() {}
    
    init(id: UUID? = nil, title: String, cover: String ) {
        self.id = id
        self.title = title
        self.cover = cover
                
    }
}



