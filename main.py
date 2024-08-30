from pathlib import Path
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from clipboardHandler import ClipboardHandler
from databaseManager import DatabaseManager

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    
    clipboard_handler = ClipboardHandler()
    
    engine = QQmlApplicationEngine()
    db_manager = DatabaseManager()
    
    engine.rootContext().setContextProperty("clipboardHandler",clipboard_handler)
    engine.rootContext().setContextProperty("dbManager",db_manager)
    
    engine.setOfflineStoragePath("E:/qt_project/pyside/simplified_qq_py")
    
    engine.load(Path(__file__).parent / "qml/Main.qml")
    
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)
    