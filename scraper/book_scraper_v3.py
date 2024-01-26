from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import TimeoutException
import time
import asyncio
import logging

# logging.basicConfig(level=logging.DEBUG)
# logging.basicConfig(format='%(asctime)s - %(levelname)s - %(message)s', level=logging.DEBUG)


class AmazonScraper:
    EXPLICIT_WAIT = 2
    SLEEP_TIME = 3

    def __init__(self):
        """Inicializa o AmazonScraper com um webdriver configurado."""
        self.driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
        self.wait = WebDriverWait(self.driver, self.EXPLICIT_WAIT)
    
    def navigate_to_page(self, url):
        """Navega até uma URL específica."""
        self.driver.get(url)
        time.sleep(self.SLEEP_TIME)  # Pequena pausa para garantir que a página carregue
    
    async def get_element_text_async(self, xpath):
        """Versão assíncrona de get_element_text."""
        try:
            element = await asyncio.to_thread(
                self.wait.until,
                EC.presence_of_element_located((By.XPATH, xpath))
            )
            return element.text
        except TimeoutException:
            print(f"Elemento não encontrado: {xpath}")
            return None 
    
    async def extract_price_kindle(self):
        return await self.get_element_text_async('//*[@id="tmm-grid-swatch-KINDLE"]//span[2]//span')
    
    async def extract_price_paperback(self):
        return await self.get_element_text_async('//*[@id="tmm-grid-swatch-PAPERBACK"]//span[2]//span')
    
    async def extract_price_hardcover(self):
        return await self.get_element_text_async('//*[@id="tmm-grid-swatch-HARDCOVER"]//span[2]//span')
    
    async def extract_price_audio(self):
        return await self.get_element_text_async('//*[@id="tmm-grid-swatch-AUDIO_DOWNLOAD"]//span[2]//span')

    async def extract_data(self):
        """Extrai os dados da página do produto na Amazon de forma assíncrona."""
        price_kindle, price_paperback, price_hardcover, price_audio = await asyncio.gather(
            self.extract_price_kindle(),
            self.extract_price_paperback(),
            self.extract_price_hardcover(),
            self.extract_price_audio()
        )
        return {
            'price_kindle': price_kindle,
            'price_paperback': price_paperback,
            'price_hardcover': price_hardcover,
            'price_audio': price_audio,
        }
    
    def heatup(self):
        self.navigate_to_page('https://www.google.com.br')
        self.navigate_to_page('https://www.google.com/search?q=amazon')
        self.navigate_to_page('https://www.amazon.com.br')

    def close(self):
        """Fecha o webdriver."""
        self.driver.quit()
