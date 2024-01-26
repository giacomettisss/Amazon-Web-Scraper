# price_inserter.py

import datetime
from .database_connection import DatabaseConnection
import pymysql

class PriceInserter:
    def __init__(self, db_connection):
        self.db_connection = db_connection

    def insert_price(self, book_id, price):
        print('Trying to insert price')
        if self.is_price_changed(book_id, price):
            self.insert_new_price(book_id, price)
        else:
            print(f"Nenhuma mudança de preço detectada para o livro com ID {book_id}.")

    def is_price_changed(self, book_id, price):
        last_price = self.get_last_price(book_id)
        return last_price is None or last_price != price

    def get_last_price(self, book_id):
        connection = self.db_connection.get_connection()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT price FROM prices WHERE book_id = %s ORDER BY date_checked DESC LIMIT 1", 
                    (book_id,)
                )
                result = cursor.fetchone()
                return result[0] if result else None
        except pymysql.MySQLError as e:
            print(f"Erro ao buscar o último preço: {e}")
            return None

    def insert_new_price(self, book_id, price):
        connection = self.db_connection.get_connection()
        date_checked = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "INSERT INTO prices (book_id, price, date_checked) VALUES (%s, %s, %s)",
                    (book_id, price, date_checked)
                )
                connection.commit()
                print(f"Preço inserido: ID do livro {book_id}, preço {price}, data verificada {date_checked}.")
        except pymysql.err.IntegrityError:
            print(f"Erro ao inserir novo preço: possível entrada duplicada para o livro com ID {book_id}.")
            connection.rollback()
        except pymysql.MySQLError as e:
            print(f"Erro ao inserir novo preço: {e}")
            connection.rollback()
