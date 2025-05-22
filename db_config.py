# db_config.py
import mysql.connector

def get_db_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='', #change it with your password
        database='MovieDB'
    )
