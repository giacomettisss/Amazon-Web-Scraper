from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import TimeoutException
import time

class AmazonScraper:
    def __init__(self):
        """Inicializa o AmazonScraper com um webdriver configurado."""
        self.driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
        self.wait = WebDriverWait(self.driver, 10)  # Espera explícita
    
    def navigate_to_page(self, url):
        """Navega até uma URL específica."""
        self.driver.get(url)
        time.sleep(1)  # Pequena pausa para garantir que a página carregue
    
    def get_element_text(self, xpath):
        """Retorna o texto de um elemento identificado por um XPath ou None se não encontrado."""
        try:
            return self.wait.until(
                EC.presence_of_element_located((By.XPATH, xpath))
            ).text
        except TimeoutException:
            print(f"Elemento não encontrado: {xpath}")
            return None 
    
    def extract_price_kindle(self):
        """Extrai o preço do Kindle."""
        return self.get_element_text('//*[@id="tmm-grid-swatch-KINDLE"]//span[2]//span')
    
    def extract_price_paperback(self):
        """Extrai o preço da versão Paperback."""
        return self.get_element_text('//*[@id="tmm-grid-swatch-PAPERBACK"]//span[2]//span')
    
    def extract_price_hardcover(self):
        """Extrai o preço da versão Hardcover."""
        return self.get_element_text('//*[@id="tmm-grid-swatch-HARDCOVER"]//span[2]//span')
    
    def extract_price_audio(self):
        """Extrai o preço da versão Hardcover."""
        return self.get_element_text('//*[@id="tmm-grid-swatch-AUDIO_DOWNLOAD"]//span[2]//span')



    def extract_data(self):
        """Extrai os dados da página do produto na Amazon."""
        xpaths = {
            'kindle': '//*[@id="tmm-grid-swatch-KINDLE"]//span[2]//span',
            'paperback': '//*[@id="tmm-grid-swatch-PAPERBACK"]//span[2]//span',
            'hardcover': '//*[@id="tmm-grid-swatch-HARDCOVER"]//span[2]//span',
            'audio': '//*[@id="tmm-grid-swatch-AUDIO_DOWNLOAD"]//span[2]//span'
        }
        
        self.wait_for_elements(xpaths.values())

        data = {key: self.extract_price(xpath) for key, xpath in xpaths.items()}
        return data
    
    def wait_for_elements(self, xpaths):
        """Espera até que todos os elementos em uma lista de xpaths estejam presentes."""
        for xpath in xpaths:
            try:
                return self.wait.until(
                    EC.presence_of_element_located((By.XPATH, xpath))
                ).text
            except TimeoutException:
                print(f"Elemento não encontrado: {xpath}")
                return None 

    def extract_price(self, xpath):
        """Extrai o preço de um elemento identificado por um XPath."""
        return self.get_element_text(xpath)

    def heatup(self):
        self.navigate_to_page('https://www.google.com.br')
        self.navigate_to_page('https://www.google.com/search?q=amazon')
        self.navigate_to_page('https://www.amazon.com.br')

    def close(self):
        """Fecha o webdriver."""
        self.driver.quit()

def main():
    """Função principal que orquestra o processo de scraping."""
    scraper = AmazonScraper()
    try:
        scraper.heatup()
        for url in urls:
            scraper.navigate_to_page(url)
            inicio = time.time()
            data = scraper.extract_data()
            fim = time.time()
            tempo_execucao = fim - inicio
            print(f'Data from {url}:')
            print(data)
            print(f"A função levou {tempo_execucao:.2f} segundos para ser executada.")
            print('---')
    finally:
        scraper.close()


urls = [
    'https://www.amazon.com.br/Designing-Data-Intensive-Applications-Reliable-Maintainable-ebook/dp/B06XPJML5D',
    'https://www.amazon.com.br/Fundamentals-Data-Engineering-English-Reis-ebook/dp/B0B4VH4T37',
    'https://www.amazon.com.br/Data-Pipelines-Pocket-Reference-Processing-ebook/dp/B08WGSM9CJ',
    'https://www.amazon.com.br/Learning-Spark-Lightning-Fast-Analytics-English-ebook/dp/B08F9WVFCT',
    'https://www.amazon.com.br/Staff-Engineers-Path-English-ebook/dp/B0BG16Y553',
    'https://www.amazon.com.br/Staff-Engineer-Leadership-management-English-ebook/dp/B08RMSHYGG',
    'https://www.amazon.com.br/Learning-Domain-Driven-Design-English-Khononov-ebook/dp/B09J2CMJZY',
    'https://www.amazon.com.br/Building-Event-Driven-Microservices-Leveraging-Organizational-ebook/dp/B08C9V1FC9'
]

if __name__ == "__main__":
    main()


# scraper = AmazonScraper()
# scraper.heatup()
# scraper.navigate_to_page(urls[0])