from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import TimeoutException
from decimal import Decimal
import time
import re
import logging

class AmazonScraper:
    EXPLICIT_WAIT = 0
    SLEEP_TIME_HEAT_UP = 5
    PRICE_XPATHS = {
        'kindle': '//*[@id="tmm-grid-swatch-KINDLE"]//span[2]//span',
        'paperback': '//*[@id="tmm-grid-swatch-PAPERBACK"]//span[2]//span',
        'hardcover': '//*[@id="tmm-grid-swatch-HARDCOVER"]//span[2]//span',
        'audio': '//*[@id="tmm-grid-swatch-AUDIO_DOWNLOAD"]//span[2]//span',
    }

    def __init__(self):
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument('window-size=1920x1080')
        chrome_options.add_argument("--log-level=3")
        
        chrome_service = ChromeService(ChromeDriverManager().install())

        self.driver = webdriver.Chrome(service=chrome_service, options=chrome_options)
        self.wait = WebDriverWait(self.driver, self.EXPLICIT_WAIT)
    
    def navigate_to_page(self, url, time_sleep=0):
        logging.info(f'Navigating to {url}')
        self.driver.get(url)
        time.sleep(time_sleep) 
    
    def get_element_text(self, xpath):
        try:
            return self.wait.until(
                EC.presence_of_element_located((By.XPATH, xpath))
            ).text
        except TimeoutException:
            print(f"Element not found: {xpath}")
            return None 
    
    def extract_price(self, price_type):
        xpath = self.PRICE_XPATHS.get(price_type)
        if not xpath:
            print(f"Invalid price type: {price_type}")
            return None
        return self.get_element_text(xpath)
    
    def extract_data(self):
        data = {
            'price_kindle': self.convert_price_to_number(self.extract_price('kindle')),
            'price_paperback': self.convert_price_to_number(self.extract_price('paperback')),
            'price_hardcover': self.convert_price_to_number(self.extract_price('hardcover')),
            'price_audio': self.convert_price_to_number(self.extract_price('audio')),
        }
        return data
    
    def convert_price_to_number(self, price_str):
        if price_str is None:
            return None
        try:
            pattern = '\d+\,\d+'
            prices = re.findall(pattern, price_str)
            if prices:
                price = prices[0].replace(',', '.')
                return Decimal(str(price))
            return None
        except ValueError:
            logging.info(f"Error converting the price: {price_str}")
            return None
    
    def heatup(self):
        self.navigate_to_page('https://www.google.com.br', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.google.com/search?q=youtube', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.youtube.com', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.youtube.com/watch?v=ABotmndh6ro&list=RDABotmndh6ro&start_radio=1&ab_channel=TROPADOBRUXO', self.SLEEP_TIME_HEAT_UP)
        # self.navigate_to_page('https://www.youtube.com/watch?v=Lv7Drjl-GB0&ab_channel=bbno%24', self.SLEEP_TIME_HEAT_UP + 10)
        self.navigate_to_page('https://www.google.com.br', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.google.com/search?q=g1', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://g1.globo.com/', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://g1.globo.com/sp/vale-do-paraiba-regiao/verao-2024/noticia/2024/01/31/e-de-verdade-sacada-de-piscina-em-apartamento-de-luxo-confunde-turistas-em-ubatuba-sp-e-viraliza.ghtml', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.google.com.br', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.google.com/search?q=amazon', self.SLEEP_TIME_HEAT_UP)
        self.navigate_to_page('https://www.amazon.com.br', self.SLEEP_TIME_HEAT_UP)

    def print_source_code(self):
        source_code = self.driver.page_source
        logging.info(source_code)

    def close(self):
        self.driver.quit()
