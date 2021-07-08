import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.4



Item {
    readonly property int _width: 50
    readonly property int _height: 45
    readonly property int _space: 1
    property string currentChar: ""
    property string tmp
    property int currentIndex: -1

    width: _width * 3
    height: _height * 4


    Column {
        spacing: _space
        Repeater {
            id: repeater1
            model: newContactTab.activeTextField ? [["", "abc" , "def"], ["ghi", "jkl" , "mno"], ["pqrs", "tuv" , "wxyz"]] :
                                   [[1,2,3],[4,5,6],[7,8,9]]
            Row {
                spacing: _space
                Repeater {
                    id: repeater2
                    model:  modelData

                    Rectangle {
                        width: _width
                        height: _height
                        color: Qt.rgba(.8, .8, .8, .9)
                        Text {
                            id: txt
                            anchors.centerIn: parent
                            text: modelData
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                txt.text = modelData
                                currentIndex++;
                                currentIndex %= newContactTab.activeTextField ? modelData.length : 1
                                currentChar = txt.text[currentIndex]
                                txt.text = txt.text.replace(txt.text[currentIndex], "<b>" + txt.text[currentIndex] + "</b>")
                            }

                            onExited: {
                                txt.text = modelData;
                                if(currentIndex != -1)
                                    if(newContactTab.activeTextField) {
                                        newContactTab.usernameTextField += currentChar;
                                    } else {
                                        newContactTab.phonenumberTextField += currentChar;
                                    }
                                currentChar = ""
                                currentIndex = -1;
                            }
                        } // MouseArea
                    } // Rectangle
                } // Repeater2
            } // Row
        } // Repeater1

        Row {
            spacing: _space

            Rectangle {
                width: _width
                height: _height
                color: "transparent"
            } // Rectangle

            Rectangle {
                width: _width
                height: _height
                color: Qt.rgba(.8, .8, .8, .9)
                Text {
                    anchors.centerIn: parent
                    text: newContactTab.activeTextField ? "_" : 0
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if(newContactTab.activeTextField) {
                            currentChar = " ";
                        } else {
                            currentChar = "0";
                        }
                    }

                    onExited: {
                        if(newContactTab.activeTextField) {
                            newContactTab.usernameTextField += currentChar;
                        } else {
                            newContactTab.phonenumberTextField += currentChar;
                        }
                    }


                }
            } // Rectangle

            Rectangle {
                width: _width
                height: _height
                color: Qt.rgba(.8, .8, .8, .9)
                Text {
                    anchors.centerIn: parent
                    text: "←"
                    font.pointSize: 12
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(newContactTab.activeTextField) {
                            newContactTab.usernameTextField =
                                    newContactTab.usernameTextField.substring(0, newContactTab.usernameTextField.length - 1);
                        } else {
                            newContactTab.phonenumberTextField =
                                    newContactTab.phonenumberTextField.substring(0, newContactTab.phonenumberTextField.length - 1)
                        }
                    }

                }

            } // Rectangle
        }
    } // Column


}
