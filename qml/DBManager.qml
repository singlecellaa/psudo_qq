import QtQuick
import QtQuick.LocalStorage

Item {
    property var db

    function initDatabase() {
        db = LocalStorage.openDatabaseSync("MyDB", "1.0", "my db", 100000)
        db.transaction( function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)')
        })
    }
    function readData() {
        print('readData()')
        if(!db) { return }
        db.transaction(function(tx) {
            const result = tx.executeSql('select * from data where name="crazy"')
            if(result.rows.length === 1) {
                const value = result.rows[0].value
                const obj = JSON.parse(value)
                crazy.x = obj.x
                crazy.y = obj.y
            }
        })
    }
    function storeData() {
        if(!db) { return }
        db.transaction(function(tx) {
            var result = tx.executeSql('SELECT * from data where name = "crazy"')
            var obj = { x: crazy.x, y: crazy.y }
            if(result.rows.length === 1) { 
                result = tx.executeSql('UPDATE data set value=? where name="crazy"', [JSON.stringify(obj)])
            } else { 
                result = tx.executeSql('INSERT INTO data VALUES (?,?)', ['crazy', JSON.stringify(obj)])
            }
        })
    }
    Component.onCompleted: {
        initDatabase()
    }
}