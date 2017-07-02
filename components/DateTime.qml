import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: root
    property date dateTime: new Date()
    property color textColor: "white"
    property alias timeFont: timeLabel.font
    property alias dateFont: dateLabel.font


    Timer {
        running: true; repeat: true
        onTriggered: root.dateTime = new Date()
    }

    Column {
        spacing: 30

        Label {
            id: timeLabel
            color: textColor
            text: Qt.formatTime(dateTime, "hh:mm")
            font.pointSize: 16
        }

        Label {
            id: dateLabel
            color: textColor
            text: Qt.formatDate(dateTime, Qt.DefaultLocaleLongDate)
            font.pointSize: 16
        }
    }

}
