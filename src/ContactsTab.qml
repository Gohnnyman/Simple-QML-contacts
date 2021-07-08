import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4



Item {
    readonly property alias model: nameModel
    readonly property int _width: parent.width / 2
    readonly property int _height: 50
    property int lastindx
    anchors.fill: parent
    anchors.topMargin: 20
    id: contactsTab

    Text {
        id: title
        text: qsTr("Contacts:");
        font.pointSize: 14;
    }


    ListModel {
        id: nameModel
    }

    Component {
        id: nameDelegate
        ColumnLayout {
            spacing: 2
            RowLayout {
                spacing: 0

                Rectangle {
                    color: "#DEE8FE"
                    width: _width
                    height: _height
                    clip: true

                    ColumnLayout {
                        anchors.topMargin: 10
                        id: lt
                        spacing: 1

                        Text {
                            id: txt1
                            text: "Name: " + model.name
                            font.pointSize: 12
                        } // Text

                        Text {
                            id: txt2
                            text: "Phone: " + model.phone
                        } // Text
                    } // ColumnLayout

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            lastindx = index;
                            deletebut.visible = true;
                        }
                    } // MouseArea
                } // Rectangle

                Rectangle {
                    width: 1
                    height: _height
                    color: "white"
                } // Rectangle

                Rectangle {
                    id: deletebut
                    visible: false
                    color: "#DEE8FE"
                    width: txt.implicitWidth
                    height: _height

                    Text {
                        anchors.centerIn: parent
                        id: txt
                        leftPadding: 5
                        rightPadding: 5
                        text: "Delete"
                    } // Text

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            contactsTab.model.remove(index);
                            deletebut.visible = false;
                        } // onClicked
                    } // MouseArea
                } // Rectangle
            } //RowLayout
        } // ColumnLayout
    } // Component

    ListView {
        id: lv
        anchors.top: title.bottom
        anchors.bottom: parent.bottom
        width: _width * 2
        model: nameModel
        delegate: nameDelegate
        clip: true
    } // ListView

}
