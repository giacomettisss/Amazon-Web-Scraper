# book_manager.py

import pymysql
import logging
from .book import Book

class BookManager:
    def __init__(self, db_connection):
        self.db_connection = db_connection
        
    def get_all_books(self):
        with self.db_connection as connection:
            try:
                with connection.get_connection().cursor() as cursor:
                    cursor.execute("SELECT id, title, author, url FROM books")
                    result = cursor.fetchall()
                    return [Book(*row) for row in result]
            except pymysql.MySQLError as e:
                logging.info(f"Erro ao buscar os livros: {e}")
                return []