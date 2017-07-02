import QtQuick 2.0
import QtQuick.Controls 2.0

MouseArea {
    property alias userIcon: userIconImage.source
    property alias username: usernameLabel.text
    width: childrenRect.width
    height: childrenRect.height

    signal userSelected()

    onClicked: {
        userSelected()
    }

    Behavior on x { SpringAnimation { spring: 4; damping: 0.4; duration: 500 } }
    Behavior on y { SpringAnimation { spring: 4; damping: 0.4; duration: 500 } }

    Column {
        spacing: 20

        signal userSelected(string name)

        Image {
            id: userIconImage
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter

            Behavior on opacity { NumberAnimation { duration: 500 } }
        }

        Label {
            id: usernameLabel
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter

            Behavior on opacity { NumberAnimation { duration: 500 } }
        }
    }

    states: [
        State {
            name: "Visible"
            PropertyChanges {
                target: userIconImage
                opacity: 1
            }
            PropertyChanges {
                target: usernameLabel
                opacity: 1
            }
        },
        State {
            name: "Invisible"
            PropertyChanges {
                target: userIconImage
                opacity: 0
            }
            PropertyChanges {
                target: usernameLabel
                opacity: 0
            }
        }
    ]
}



