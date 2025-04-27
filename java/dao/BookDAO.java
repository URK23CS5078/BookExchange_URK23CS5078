package dao;

import java.sql.*;
import java.util.*;
import model.Book;

public class BookDAO {
    private Connection connection;
    
    // Add your database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/book_portal"; // Adjust as needed
    private static final String USER = "root"; // Change as needed
    private static final String PASSWORD = "root"; // Change as needed
    
    public BookDAO() throws SQLException {
        connection = DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    public List<Book> getAllAvailableBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE available = true";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setImageUrl(rs.getString("image_url"));
                book.setAvailable(rs.getBoolean("available"));
                book.setOwner(rs.getString("owner"));
                
                books.add(book);
            }
        }
        
        return books;
    }
    
    // Add more methods as needed (getBookById, addBook, updateBook, etc.)
    
    public void close() {
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
