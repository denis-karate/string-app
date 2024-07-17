from flask import Flask, jsonify
import psycopg2
import random
import os

app = Flask(__name__)

# Функция для получения конфигурационных данных из переменных окружения или их значений по умолчанию
def get_env_variable(name, default=None):
    return os.getenv(name, default)

# Создание соединения с базой данных
def get_db_connection():
    conn = psycopg2.connect(
        host=get_env_variable('DB_HOST', 'localhost'),
        database=get_env_variable('DB_NAME', 'mydatabase'),
        user=get_env_variable('DB_USER', 'myuser'),
        password=get_env_variable('DB_PASSWORD', 'mypassword')
    )
    return conn

# Создание таблицы и заполнение тестовыми данными
def init_db():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('''
        CREATE TABLE IF NOT EXISTS strings (
            id SERIAL PRIMARY KEY,
            content TEXT NOT NULL
        )
    ''')
    # Получение строк для инициализации из переменной окружения
    init_strings = get_env_variable('INIT_STRINGS', '').split('\n')
    for string in init_strings:
        if string.strip():  # Игнорирование пустых строк
            cur.execute('INSERT INTO strings (content) VALUES (%s)', (string.strip(),))
    conn.commit()
    cur.close()
    conn.close()

# Инициализация базы данных при старте приложения
init_db()

@app.route('/random-strings', methods=['GET'])
def get_random_strings():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT content FROM strings ORDER BY RANDOM() LIMIT 10')
    rows = cur.fetchall()
    cur.close()
    conn.close()
    random_strings = random.sample([row[0] for row in rows], random.randint(1, len(rows)))
    return jsonify(random_strings)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

