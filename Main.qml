import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "components"
import SddmComponents 2.0

Item {
    id: root

    LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    Repeater {
        id: screens
        model: screenModel

        Background {
            x: geometry.x; y: geometry.y; width: geometry.width; height:geometry.height
            source: config.background
            fillMode: Image.PreserveAspectCrop
            onStatusChanged: {
                if (status == Image.Error && source !== config.defaultBackground) {
                    source = config.defaultBackground
                }
            }
        }

        onItemAdded: {
            if (index === screenModel.primary) {

            }
        }
    }

    Login {
        users: userModel
        anchors.top: parent.top
        anchors.topMargin: parent.height / 3
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Column {
        id: clockAndPower
        spacing: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter

        Clock {
            anchors.horizontalCenter: parent.horizontalCenter
        }

        PowerSettings {
            anchors.horizontalCenter: parent.horizontalCenter
            onSleepClicked: {
                if (sddm.canSuspend) {
                    sddm.suspend()
                } else if (sddm.canHibernate) {
                    sddm.hibernate()
                } else if (sddm.canHybridSleep) {
                    sddm.hybridSleep()
                }
            }
            onRestartClicked: {
                sddm.reboot()
            }
            onShutdownClicked: {
                sddm.powerOff()
            }
        }
    }
}
