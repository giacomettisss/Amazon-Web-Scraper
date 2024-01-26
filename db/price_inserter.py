# price_inserter.py

from .database_connection import DatabaseConnection
import datetime
import pymysql

class PriceInserter:
    def __init__(self, db_connection):
        self.db_connection = db_connection

    def insert_prices(self, book_id, prices):
        """
        Insert multiple prices if they have changed.
        :param book_id: ID of the book
        :param prices: Dictionary of prices with types as keys
        """
        with self.db_connection as connection:
            print('Trying to insert prices')
            for price_type, price in prices.items():
                if self.is_price_changed(book_id, price_type, price, connection):
                    self.insert_new_price(book_id, price_type, price, connection)
                else:
                    print(f"No price change detected for book ID {book_id} ({price_type}).")

    def is_price_changed(self, book_id, price_type, price, connection):
        """
        Check if the price has changed compared to the last entry.
        :param book_id: ID of the book
        :param price_type: Type of the price (kindle, paperback, etc.)
        :param price: Current price to check
        :param connection: Database connection
        """
        last_price = self.get_last_price(book_id, price_type, connection)
        print(f'{last_price = } | {price = }')
        return last_price is None or last_price != price

    def get_last_price(self, book_id, price_type, connection):
        """
        Fetch the last price of a specific type for the book.
        :param book_id: ID of the book
        :param price_type: Type of the price (kindle, paperback, etc.)
        :param connection: Database connection
        """
        try:
            with connection.get_connection().cursor() as cursor:
                cursor.execute(
                    "SELECT price FROM prices WHERE book_id = %s AND price_type = %s ORDER BY date_checked DESC LIMIT 1",
                    (book_id, price_type)
                )
                result = cursor.fetchone()
                return result[0] if result else None
        except pymysql.MySQLError as e:
            print(f"Error fetching the last price: {e}")
            return None

    def insert_new_price(self, book_id, price_type, price, connection):
        """
        Insert a new price into the database.
        :param book_id: ID of the book
        :param price_type: Type of the price (kindle, paperback, etc.)
        :param price: Price to insert
        :param connection: Database connection
        """
        date_checked = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        try:
            with connection.get_connection().cursor() as cursor:
                cursor.execute(
                    "INSERT INTO prices (book_id, price_type, price, date_checked) VALUES (%s, %s, %s, %s)",
                    (book_id, price_type, price, date_checked)
                )
                connection.get_connection().commit()
                print(f"Price inserted: Book ID {book_id}, {price_type} price {price}, checked on {date_checked}.")
        except pymysql.err.IntegrityError:
            print(f"Error inserting new price: possible duplicate entry for book ID {book_id}.")
            connection.get_connection().rollback()
        except pymysql.MySQLError as e:
            print(f"Error inserting new price: {e}")
            connection.get_connection().rollback()