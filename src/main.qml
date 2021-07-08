import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 2.12
import QtQuick.Controls 2.4



Window {
    property bool debug: false
    id: main
    width: 640
    height: 480
    visible: true
    title: qsTr("QML, LOL")

    TabBar {
        id: bar
        TabButton {
            text: "New Contact"
            width: implicitWidth + 5

        }

        TabButton {
            text: "Contacts"
            width: implicitWidth + 5
        }
    } // TabBar

    StackLayout {

        anchors.fill: parent
        currentIndex: bar.currentIndex


        NewContactTab {
            id: newContactTab
        }

        ContactsTab {
            id: contactsTab
        }
    } // StackLayout

} // window
