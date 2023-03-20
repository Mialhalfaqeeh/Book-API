//
//  ReviewsController.swift
//  
//
//  Created by Milah Alfaqeeh  on 19/03/2023.
//

import Foundation
import Vapor

final class ReviewsController {
    
    
    func create(req:Request) throws -> EventLoopFuture<Review> {
        let review = try req.content.decode(Review.self)
        return review.create(on: req.db).map {review}
    }

    func all(req:Request) throws -> EventLoopFuture<[Review]> {
        Review.query(on: req.db).all()
    }
    
}
