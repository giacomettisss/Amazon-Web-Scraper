import pymysql
import time
import logging
from pymysql.constants import CLIENT

class DatabaseConnection:
    def __init__(self, db_config, retry_attempts=3, retry_interval=60):
        self.db_config = db_config
        self.retry_attempts = retry_attempts
        self.retry_interval = retry_interval
        self.connection = None

    def open_connection(self):
        try:
            self.attempt_connection()
            logging.info('Connected to Database')
        except pymysql.MySQLError as e:
            logging.info("All retry attempts failed.")
            raise

    def attempt_connection(self):
        for attempt in range(1, self.retry_attempts + 1):
            try:
                self.connection = pymysql.connect(
                    host=self.db_config['host'],
                    user=self.db_config['user'],
                    password=self.db_config['password'],
                    database=self.db_config['database'],
                    port=self.db_config['port'],
                    client_flag=CLIENT.MULTI_STATEMENTS
                )
                return
            except pymysql.MySQLError as e:
                logging.info(f"Error connecting to Database: {e}")
                if attempt != self.retry_attempts:
                    logging.info(f"Attempting to reconnect in {self.retry_interval} seconds... ({attempt}/{self.retry_attempts})")
                    time.sleep(self.retry_interval)
                else:
                    raise

    def close_connection(self):
        if self.connection:
            self.connection.close()
            self.connection = None

    def get_connection(self):
        return self.connection
    
    def __enter__(self):
        self.open_connection()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close_connection()
