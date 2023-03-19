//
//  AddCoverCulumToBook.swift
//  
//
//  Created by Milah Alfaqeeh  on 18/03/2023.
//

import Foundation
import Fluent
import FluentPostgresDriver


struct AddCoverCulumToBook: Migration {
    func prepare(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .field("cover", .string)
            .update()
    }
    
    func revert(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .deleteField("cover")
            .delete()
    }
    
    
}
