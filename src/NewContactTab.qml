import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4



Item {
    property list<ListElement> users;
    property alias usernameTextField: username.text
    property alias phonenumberTextField: phoneNumber.text
    property bool activeTextField: true
    id: newContactTab
    anchors.fill: parent


    ColumnLayout {
        anchors.fill: parent
        spacing: 15

        Item {
            Layout.fillHeight: true
        }

        Text {
            Layout.alignment: Qt.AlignCenter
            text: qsTr("Hello!")
            font.pointSize: 14
        }

        TextField {
            id: username
            selectByMouse: true
            implicitWidth: parent.width / 3
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("Enter name")
            onPressed: {
                console.log
                activeTextField = true;
            }

        }

        TextField {
            id:phoneNumber
            selectByMouse: true
            implicitWidth: parent.width / 3
            Layout.alignment: Qt.AlignHCenter
//            inputMask: "+38 000 000 0000"
            placeholderText: qsTr("Enter phone")
            onPressed: {
                activeTextField = false;
            }
        }


        Item {
            Layout.fillHeight: true
        }

        Keyboard {
            id: keyboard
            Layout.alignment: Qt.AlignHCenter
        } // ColumnLayout


        OwnButton {
            id: button1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            Layout.bottomMargin: 20
            onClicked: {
                contactsTab.model.append({name: username.text, phone: phoneNumber.text});
                username.clear();
                phoneNumber.clear();
            }
        } // OwnButton


        Item {
            Layout.fillHeight: true
        }

    } // ColumnLayout
}
