import sys
from PySide6.QtWidgets import QApplication, QMainWindow
from PySide6.QtCore import QObject, Slot, QUrl
from PySide6.QtQml import QQmlApplicationEngine
import sqlite3

class DatabaseManager(QObject):
    def __init__(self):
        super().__init__()
        self.connection = sqlite3.connect('mydatabase.db')
        self.cursor = self.connection.cursor()

        # Create a table if it doesn't exist
        self.cursor.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY,
                name TEXT
            )
        ''')
        self.connection.commit()

    @Slot(str, result=bool)
    def execute_query(self, query_str):
        try:
            self.cursor.execute(query_str)
            self.connection.commit()
            return True
        except sqlite3.Error as e:
            print(f"An error occurred: {e}")
            return False

    @Slot(str, result=str)
    def fetch_data(self, query_str):
        try:
            self.cursor.execute(query_str)
            result = self.cursor.fetchall()
            return '\n'.join([str(row) for row in result])
        except sqlite3.Error as e:
            print(f"An error occurred: {e}")
            return ""

    def __del__(self):
        self.connection.close()
