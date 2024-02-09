# main.py

import asyncio
from db.database_connection import DatabaseConnection
from db.price_inserter import PriceInserter
from db.book_manager import BookManager
from config.settings import db_config
from scraper.book_scraper import AmazonScraper
import logging
from db.book import Book
import time

# logging.basicConfig(level=logging.PRODUTION)
logging.getLogger('selenium').setLevel(logging.WARNING)
logging.getLogger('urllib3').setLevel(logging.WARNING)
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.DEBUG)

def main():
    logging.info('Starting')
    
    db_connection = DatabaseConnection(db_config)
    db_connection.open_connection()

    scraper = AmazonScraper()
    book_manager = BookManager(db_connection)
    inserter = PriceInserter(db_connection)

    logging.info('Heating up')
    scraper.heatup()
    logging.info('Heated up')
    
    books = book_manager.get_all_books()
    logging.info(f'Getten {len(books)} books')    

    for book in books:
        logging.info(f'Scraping: {book.book_id = } | {book.url}')

        scraper.navigate_to_page(book.url)

        time.sleep(2)

        scraper.print_source_code()

        data = scraper.extract_data()
        logging.info(f'{data = }')

        inserter.insert_prices(book.book_id, data)

        logging.info('---')

    scraper.close()
    logging.info('Ending')

if __name__ == "__main__":
    main()
