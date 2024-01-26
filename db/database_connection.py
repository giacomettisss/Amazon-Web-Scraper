# database_connection.py

import pymysql
from pymysql.constants import CLIENT

class DatabaseConnection:
    def __init__(self, db_config):
        self.db_config = db_config
        self.connection = None

    def open_connection(self):
        if not self.connection:
            try:
                self.connection = pymysql.connect(
                    host=self.db_config['host'],
                    user=self.db_config['user'],
                    password=self.db_config['password'],
                    database=self.db_config['database'],
                    port=self.db_config['port'],
                    client_flag=CLIENT.MULTI_STATEMENTS
                )
                print('Connected to Database')
            except pymysql.MySQLError as e:
                print(f"Error connecting to Database: {e}")
                raise

    def close_connection(self):
        if self.connection:
            self.connection.close()
            self.connection = None

    def get_connection(self):
        return self.connection
    