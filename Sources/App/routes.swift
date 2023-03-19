import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    
    let bookController = BooksController()
    
    // loclhost:8080/books  POST
    app.post("books", use: bookController.create)
    
    
    // loclhost:8080/books  GET
    app.get("books", use: bookController.all)
    
    
    // loclhost:8080/books/:bookId PUT
    app.put("books", use: bookController.updata)
    
    
    // loclhost:8080/books/:bookId DELETE
    app.delete("books",":bookId", use: bookController.delete)
}
