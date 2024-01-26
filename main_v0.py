# main.py

import asyncio
from db.database_connection import DatabaseConnection
from db.price_inserter import PriceInserter
from db.book_manager import BookManager
from config.settings import db_config
from scraper.book_scraper_v3 import AmazonScraper
import logging
from db.book import Book

# logging.basicConfig(level=logging.PRODUTION)
# logging.basicConfig(format='%(asctime)s - %(levelname)s - %(message)s', level=logging.DEBUG)



async def main():
    logging.info('Starting')
    
    db_connection = DatabaseConnection(db_config)
    db_connection.open_connection()

    scraper = AmazonScraper()
    book_manager = BookManager(db_connection)
    inserter = PriceInserter(db_connection)

    books = book_manager.get_all_books()
    print(f'Getten {len(books)} books')    

    scraper.heatup()
    print('Heated up')
    for book in books:
        scraper.navigate_to_page(book.url)
        data = await scraper.extract_data()
        logging.info(f'Data from {book.url}:')
        logging.info(data)
        print(f'{data = }')
        logging.info('---')
        inserter.insert_price(book.book_id, data['price_kindle'])

    # for _ in range(0,33):
    #     inserter.insert_price(2, _)
    scraper.close()
    logging.info('Ending')

if __name__ == "__main__":
    asyncio.run(main())
