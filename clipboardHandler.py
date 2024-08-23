
from PySide6.QtCore import QObject, Slot, Signal, QByteArray, QBuffer, QIODevice
from PySide6.QtGui import QClipboard, QGuiApplication
from io import BytesIO
import base64

class ClipboardHandler(QObject):
    def __init__(self):
        super().__init__()
    
    @Slot(result=str)   
    def getClipboardContent(self):
        clipboard = QGuiApplication.clipboard()
        mime_data = clipboard.mimeData()
        if mime_data.hasImage():
            image = clipboard.image()
            # buffer = BytesIO()
            byte_array = QByteArray()
            buffer = QBuffer(byte_array)
            buffer.open(QIODevice.WriteOnly)
            image.save(buffer,"PNG")
            image_base64 = base64.b64encode(buffer.data()).decode("utf-8")
            buffer.close()
            return f"<img src='data:image/png;base64,{image_base64}'/>"
        elif mime_data.hasText():
            return mime_data.text()
        return ""
    
    