from pathlib import Path
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickView

from clipboardHandler import ClipboardHandler

def load():
    for qml_file in qml_file_array:
        print("loading file", qml_file, "\n")
        engine.load(qml_file)
        
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    
    clipboard_handler = ClipboardHandler()
    
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("clipboardHandler",clipboard_handler)
    engine.setOfflineStoragePath("E:/qt_project/pyside/simplified_qq_py")
    qml_file_array = []
    qml_file_array.append(Path(__file__).parent / "qml/Main.qml")
    
    load()
    
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)
    