import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12




Item {
    signal clicked();
    property alias text: recText.text
    id: root
    implicitHeight: 50
    implicitWidth: 200



    Rectangle {
        id: rect
        anchors.fill: parent
        radius: parent.height / 4

        Image {
            id: ownButtonImg1
            anchors.fill: parent
            source: ownButtonArea.containsPress ? "img/blueButPressed.png" : "img/blueBut.png"
        }

        Text {
            id: recText
            anchors.centerIn: parent
            text: qsTr("Das geht mih auf den Sack ! ! !")
        }

        MouseArea {
            id: ownButtonArea
            anchors.fill: parent
            onClicked: { root.clicked() }
        }
    }

}
