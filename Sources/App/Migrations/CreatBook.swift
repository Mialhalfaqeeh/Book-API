//
//  CreatBook.swift
//  
//
//  Created by Milah Alfaqeeh  on 15/03/2023.
//

import Foundation
import Fluent
import FluentPostgresDriver




struct CreatBook: Migration {
    
    //  creat table , delete, or any changes
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("books") // table name
            .id()
            .field("title", .string) // column name
           // .field("year", .string)
          //  .field("cover", .string)
          //  .field("pdf", .string)
            .create()
    }
    
    
    // undo
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("books").delete() // drop the table
    }
    
    
}


