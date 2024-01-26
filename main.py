# main.py

import asyncio
from db.database_connection import DatabaseConnection
from db.price_inserter import PriceInserter
from db.book_manager import BookManager
from config.settings import db_config
from scraper.book_scraper import AmazonScraper
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
        logging.info(f'Scraping: {book.book_id = } | {book.url}')
        print(f'{book.book_id = } | {book.url}')

        scraper.navigate_to_page(book.url)

        data = await scraper.extract_data()
        logging.info(f'{data = }')
        print(f'{data = }')

        inserter.insert_prices(book.book_id, data)

        logging.info('---')
        print('---')

    scraper.close()
    logging.info('Ending')

if __name__ == "__main__":
    asyncio.run(main())
