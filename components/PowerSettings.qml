import QtQuick 2.0
import QtQuick.Controls 2.0
import SddmComponents 2.0

Row {
    spacing: 40

    signal sleepClicked()
    signal restartClicked()
    signal shutdownClicked()

    Image {
        id: sleepIcon
        source: "../resources/sleep.png"
        visible: sddm.canSuspend || sddm.canHibernate || sddm.canHybridSleep

        MouseArea {
            anchors.fill: parent
            onClicked: sleepClicked()
        }
    }

    Image {
        id: restartIcon
        source: "../resources/restart.png"
        visible: sddm.canReboot

        MouseArea {
            anchors.fill: parent
            onClicked: restartClicked()
        }
    }

    Image {
        id: shutdownIcon
        source: "../resources/power.png"
        visible: sddm.canPowerOff

        MouseArea {
            anchors.fill: parent
            onClicked: shutdownClicked()
        }
    }
}
