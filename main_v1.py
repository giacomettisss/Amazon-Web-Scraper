# main.py

import asyncio
from db.database_connection import DatabaseConnection
from db.price_inserter import PriceInserter
from db.book_manager import BookManager
from config.settings import db_config
from scraper.book_scraper_v3 import AmazonScraper
import logging
from db.book import Book

# logging.basicConfig(level=logging.DEBUG)
# logging.basicConfig(format='%(asctime)s - %(levelname)s - %(message)s', level=logging.DEBUG)

urls = ['https://www.amazon.com.br/dp/B09WF2MVT8']

async def main():
    logging.info('Starting')
    
    db_connection = DatabaseConnection(db_config)
    db_connection.open_connection()

    inserter = PriceInserter(db_connection)
    scraper = AmazonScraper()
    book_manager = BookManager(db_connection)

    books = book_manager.get_all_books()

    try:
        scraper.heatup()
        for url in urls:
            scraper.navigate_to_page(url)
            data = await scraper.extract_data()
            logging.info(f'Data from {url}:')
            logging.info(data)
            print(data)
            logging.info('---')
    finally:
    scraper.close()
    logging.info('Ending')

if __name__ == "__main__":
    asyncio.run(main())

# if __name__ == "__main__":
#     db_connection = DatabaseConnection(db_config)
#     db_connection.open_connection()

#     try:
#         inserter = PriceInserter(db_connection)

#         book_id = 2
#         price = 29.99 
        
#         inserter.insert_price(book_id, price)
#     finally:
#         db_connection.close_connection()


# main.py
# import asyncio
# from db.database_connection import DatabaseConnection
# from db.price_inserter import PriceInserter
# from db.book_manager import BookManager
# from config.settings import db_config
# from scraper.book_scraper_v3 import AmazonScraper

# async def process_book(scraper, inserter, book):
#     print(f'Processing book {book.book_id}')
#     scraper.navigate_to_page(book.url)
#     data = await scraper.extract_data()
#     print(f'{data = }')
#     if data:
#         print(f'{data = }')
#         await inserter.insert_price(book.book_id, data['price_kindle']) 

# async def main():
#     db_connection = DatabaseConnection(db_config)
#     db_connection.open_connection()

#     try:
#         inserter = PriceInserter(db_connection)
#         scraper = AmazonScraper()
#         book_manager = BookManager(db_connection)

#         books = book_manager.get_all_books()
#         books_count = len(books)
#         print(f'Getted: {books_count} books')    

#         print('Heating up')
#         scraper.heatup()
#         print('Processing all books')

#         tasks = [process_book(scraper, inserter, book) for book in books]
#         await asyncio.gather(*tasks)  # Gather all tasks into one

#     finally:
#         db_connection.close_connection()

# if __name__ == "__main__":
#     asyncio.run(main())
