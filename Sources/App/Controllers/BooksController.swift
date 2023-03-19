//
//  BooksController.swift
//  
//
//  Created by Milah Alfaqeeh  on 18/03/2023.
//

import Foundation
import Vapor

final class BooksController {
    
    
    func create(req:Request) throws -> EventLoopFuture<Book> {
        let book = try req.content.decode(Book.self)
        return book.create(on: req.db).map { book }
    }
    
    
    func all(req:Request) throws -> EventLoopFuture<[Book]> {
        Book.query(on: req.db).all()
    }
    
    func getid(req:Request) throws -> EventLoopFuture<Book> {
                Book.find(req.parameters.get("bookId"), on: req.db)
                    .unwrap(or: Abort(.notFound))
    }
    
    
    
    func updata(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        
                let book = try req.content.decode(Book.self)
        
                return Book.find(book.id, on: req.db)
                    .unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.title = book.title
                        $0.cover = book.cover
                        $0.edition = book.edition
                        return $0.update(on: req.db).transform(to: .ok)
                    }
        

    }

    
    func delete(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        Book.find(req.parameters.get("bookId"), on: req.db).unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.delete(on: req.db)
                    }.transform(to: .ok)
    }
}
