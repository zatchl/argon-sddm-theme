import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    property alias users: usersListView.model
    ListView {
        id: usersListView
        orientation: ListView.Horizontal
        anchors.centerIn: parent
        width: childrenRect.width
        height: childrenRect.height
        currentIndex: -1

        spacing: 100

        delegate: UserItem {
            userIcon: model.icon
            username: model.name
            x: {
                if (index == usersListView.currentIndex) {
                    (usersListView.width / 2) - (width / 2)
                } else {
                    index * (width + usersListView.spacing)
                }
            }
            y: ListView.isCurrentItem ? 100 : 0
            state: (usersListView.currentIndex == index || usersListView.currentIndex == -1) ? "Visible" : "Invisible"

            onUserSelected: {
                if (usersListView.currentIndex != index) {
                    usersListView.currentIndex = index
                } else {
                    usersListView.currentIndex = -1
                }
            }
        }
    }

    TextField {
        id: passwordField
        y: 250
        echoMode: TextInput.Password
        visible: true
        opacity: !(usersListView.currentIndex == -1)
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: "Password"

        Behavior on opacity { NumberAnimation { duration: 500 } }
    }
}



