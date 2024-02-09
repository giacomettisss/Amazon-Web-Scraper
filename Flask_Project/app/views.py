# app/views.py

from flask import render_template
from app import app, mysql

@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute('''
WITH prices_changed AS (
    SELECT DISTINCT book_id, price_type
    FROM `prices`
    WHERE DATE(date_checked) >= DATE(CURDATE() - INTERVAL 7 DAY)
    ORDER BY date_checked DESC
),
book_prices AS (
    SELECT
        prices.book_id,
        prices.price_type,
        FIRST_VALUE(prices.price) OVER (PARTITION BY prices.book_id, prices.price_type ORDER BY prices.date_checked DESC) AS actual_price,
        MAX(prices.price) OVER (PARTITION BY prices.book_id, prices.price_type) AS max_price,
        MIN(prices.price) OVER (PARTITION BY prices.book_id, prices.price_type) AS min_price,
        ROW_NUMBER() OVER (PARTITION BY prices.book_id, prices.price_type ORDER BY prices.date_checked DESC) AS rn,
        prices.date_checked
    FROM prices
    JOIN prices_changed
        ON prices_changed.book_id = prices.book_id
        AND prices_changed.price_type = prices.price_type
),
price_proximity_analysis AS (
    SELECT
        bp.book_id,
        bp.price_type,
        bp.actual_price,
        bp.max_price,
        bp.min_price,
        CASE
            WHEN (bp.actual_price - bp.min_price) / (bp.max_price - bp.min_price) <= 1.0/3 THEN 'Próximo do preço mínimo'
            WHEN (bp.actual_price - bp.min_price) / (bp.max_price - bp.min_price) >= 2.0/3 THEN 'Próximo do preço máximo'
            ELSE 'Bem no meio'
        END AS price_proximity,
        ROUND(((bp.max_price - bp.actual_price) / bp.max_price) * 100, 2) AS discount_pct_from_max,
        bp.date_checked,
    	bp.rn
    FROM book_prices bp
)
SELECT
    ppa.book_id,
    ppa.price_type,
    b.title,
    ppa.actual_price,
    ppa.max_price,
    case 
    	when ppa.discount_pct_from_max > 10 and ppa.price_proximity = 'Próximo do preço mínimo' then "Compre agora! 🤑"
    	when ppa.discount_pct_from_max > 10 and ppa.price_proximity = 'Bem no meio' then "Compre com cautela 🧐"
        else "Espere o preço baixar 😎"
    end as is_it_worth,
    CONCAT(ppa.discount_pct_from_max, "% de desconto") discount,
    b.url
    -- ppa.min_price,
    -- ppa.price_proximity,
    -- ppa.discount_pct_from_max,
    -- ppa.date_checked
FROM price_proximity_analysis ppa
JOIN books b
    ON b.id = ppa.book_id
WHERE ppa.rn = 1
ORDER BY ppa.discount_pct_from_max desc
-- , ppa.book_id, ppa.date_checked DESC;;;;;;;
    ''')
    dados = cur.fetchall()

    if dados:
        column_names = [desc[0] for desc in cur.description]
        dados_dict = [dict(zip(column_names, row)) for row in dados]
    else:
        dados_dict = []

    cur.close()
    return render_template('index.html', dados=dados_dict)
