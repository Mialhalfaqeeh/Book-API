//
//  ReviewsController.swift
//  
//
//  Created by Milah Alfaqeeh  on 19/03/2023.
//

import Foundation
import Vapor



struct ReviewsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let reviews = routes.grouped("reviews")
        reviews.get(use: all)
        reviews.post(use: create)

        reviews.group(":reviewId") { reviews in
           reviews.get(use: getid)
           reviews.put(use: updata)
           reviews.delete(use: delete)
        }

    }

  func create(req:Request) throws -> EventLoopFuture<Review> {
        let review = try req.content.decode(Review.self)
        return review.create(on: req.db).map {review}
    }

  func all(req:Request) throws -> EventLoopFuture<[Review]> {
        Review.query(on: req.db).all()
    }

  func getid(req:Request) throws -> EventLoopFuture<Review> {
                Review.find(req.parameters.get("reviewId"), on: req.db)
                    .unwrap(or: Abort(.notFound))
    }
    func updata(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        
                let review = try req.content.decode(Review.self)
        
                return Review.find(review.id, on: req.db)
                    .unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.body = review.body
    
                        return $0.update(on: req.db).transform(to: .ok)
                    }
        

    }


    func delete(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        Review.find(req.parameters.get("reviewId"), on: req.db).unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.delete(on: req.db)
                    }.transform(to: .ok)
    }
}
