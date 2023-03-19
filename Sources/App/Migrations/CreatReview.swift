//
//  CreatReview.swift
//  
//
//  Created by Milah Alfaqeeh  on 17/03/2023.
//

import Foundation
import Fluent
import FluentPostgresDriver



struct CreatReview: Migration {
    
    //  creat table , delete, or any changes
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("reviews") // table name
            .id()
            .field("body", .string)   // column name
            .field("book_id", .uuid, .references("books", "id"))
            .create()
    }
    
    
    // undo
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("reviews").delete() // drop the table
    }
    
    
}
