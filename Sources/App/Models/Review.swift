//
//  Review.swift
//  
//
//  Created by Milah Alfaqeeh  on 17/03/2023.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver


final class Review: Model, Content  {

    static let schema = "reviews"   // table name
    
    @ID(key:.id)
    var id: UUID? // PK
    
    
    @Field(key: "body")
    var body: String
    
    @Parent(key:"book_id") //FK
    var book:Book
    
    init() {}
    
    init(id: UUID? = nil, body: String , bookId: UUID) {
        self.id = id
        self.body = body
        self.$book.id = bookId

    }
}
