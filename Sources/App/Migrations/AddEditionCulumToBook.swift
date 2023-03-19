//
//  AddEditionCulumToBook.swift
//  
//
//  Created by Milah Alfaqeeh  on 19/03/2023.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct AddEditionCulumToBook : Migration {
    func prepare(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .field("edition", .string)
            .update()
    }
    
    func revert(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .deleteField("edition")
            .delete()
    }
    
    
}

