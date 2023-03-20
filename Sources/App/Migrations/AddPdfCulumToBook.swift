//
//  AddPdfCulumToBook.swift
//  
//
//  Created by Milah Alfaqeeh  on 20/03/2023.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct AddPdfCulumToBook : Migration {
    func prepare(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .field("pdf", .string)
            .update()
    }
    
    func revert(on database: FluentKit.Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .deleteField("pdf")
            .delete()
    }
    
    
}
