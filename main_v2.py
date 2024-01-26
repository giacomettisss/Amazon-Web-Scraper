import asyncio
from db.database_connection import DatabaseConnection
from db.price_inserter import PriceInserter
from db.book_manager import BookManager
from config.settings import db_config
from scraper.book_scraper_v3 import AmazonScraper

db_connection = DatabaseConnection(db_config)
db_connection.open_connection()

async def process_book(scraper, inserter, book):
    scraper.navigate_to_page(book.url)
    data = await scraper.extract_data()
    if data:
        print(f'Data for Book ID {book.book_id}: {data}')
        inserter.insert_price(book.book_id, data['price_kindle'])

async def main():
    try:
        inserter = PriceInserter(db_connection)
        scraper = AmazonScraper()
        book_manager = BookManager(db_connection)

        books = book_manager.get_all_books()
        books_count = len(books)
        print(f'Got: {books_count} books')    

        print('Heating up')
        scraper.heatup()
        print('Processing all books')

        tasks = [process_book(scraper, inserter, book) for book in books]
        await asyncio.gather(*tasks)

    finally:
        db_connection.close_connection()  # Close the connection when done

if __name__ == "__main__":
    asyncio.run(main())