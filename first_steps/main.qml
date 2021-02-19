import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import Qt.labs.platform 1.0
import QtQuick.Dialogs 1.2

Window {
    //        width: 1500
    //        height: 500
    maximumWidth: root.width
    minimumWidth: root.width
    maximumHeight: root.height
    minimumHeight: root.height
    visible: true
    title: qsTr("Hello World")

    property int offset: 100
    property int space: 20



    ColorDialog{
        id: colordialog
        modality: Qt.WindowModal
        title: "Выбери цвет"
        color: "green"
        onAccepted: {
            console.log("Accepted:" + color)
        }
        onRejected: {
            console.log("Rejected:")
        }

    }
    FontDialog{
        id: fontdialog
        modality: Qt.NonModal
        title: "Выбери шрифт"
        onAccepted: {
            //            preview.font.pixelSize = fontdialog.font.pixelSize
            preview.font.pointSize = fontdialog.font.pointSize
            console.log("Accepted:" + color)
        }
        onRejected: {
            console.log("Rejected:")
        }

    }

    Rectangle{
        id: root
        width: 1500
        height: 500
        anchors.centerIn: parent
        Text {
            id: txt1
            text: qsTr("root Window")
            font.pixelSize: 12
        }
        Rectangle{
            id: rect1
            anchors.centerIn: parent
            width: root.width - offset
            height: root.height -offset
            color: "cyan"
            Text {
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                id: txt2
                text: qsTr("rect1")
                font.pixelSize: 12
            }

            Row{
                id: row1
                spacing: space
                width: parent.width
                height: parent.height

                Column{
                    id: col2
                    spacing: space
                    width: colrow1rect1.width
                    height: rect1.height - rect1.y
                    Rectangle{
                        id: colrow1rect1
                        width: offset
                        height: parent.height - offset
                        color: "gold"
                        Rectangle{
                            id: imageRect
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            Image {
                                id: arrow
                                fillMode: Image.Tile
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                visible: true
                                source: "images/arrow.svg"
                            }
                            Component.onCompleted: imageRect.y = upAndDown ()
                        }

                        Rectangle{
                            id: grayrect
                            width: parent.width - 2 * space
                            height: space
                            color: "gray"
                            x: parent.width * 0.5 - width * 0.5
                            y: parent.y + row2rect2.y + row2rect2.height - height
                            z: 999

                            TapHandler {
                                acceptedPointerTypes: PointerDevice.GenericPointer | PointerDevice.Finger | PointerDevice.Pen
                                onTapped: console.log("clicked")
                            }

                            Drag.active: dragArea.drag.active
                            MouseArea {
                                id: dragArea
                                anchors.fill: parent
                                drag.target: parent
                                onClicked: {
                                    arrow.visible = false
                                }
                                onMouseXChanged: {
                                    arrow.visible = false
                                }
                            }


                        }

                        border.color: "black"
                        border.width: 1
                    }
                    Rectangle{
                        id: colrow1rect2
                        width: offset
                        height: rect1.height - colrow1rect1.height - space
                        color: "gold"
                        Text {
                            id: row1rect1txt
                            text: qsTr("colrow1rect2")
                            font.pixelSize: 12
                        }

                        border.color: "black"
                        border.width: 1
                    }
                }

                Column{
                    id: col3
                    spacing: space
                    Rectangle{
                        id: row1rect2
                        width: colrow1rect1.width
                        height: row1.height - offset * 0.5
                        color: "red"
                        Text {
                            id: txt4
                            text: qsTr("row1rect2")
                            font.pixelSize: 12
                        }

                        border.color: "black"
                        border.width: 1
                    }

                    Rectangle{
                        id: row1rect22
                        width: colrow1rect1.width
                        height: rect1.height - (row1rect2.height + space)
                        color: "green"
                        Text {
                            id: txt41
                            text: qsTr("row1rect22")
                            font.pixelSize: 12
                        }

                        border.color: "black"
                        border.width: 1
                    }
                }
                Rectangle{
                    id: row1rect3
                    width: colrow1rect1.width
                    height: parent.height
                    color: "red"
                    Text {
                        id: txt411
                        text: qsTr("colrow1rect1")
                        font.pixelSize: 12
                    }

                    border.color: "black"
                    border.width: 1
                }
                Rectangle{
                    id: row1rect31
                    width: offset
                    height: parent.height
                    color: "blue"
                    Text {
                        id: txt5
                        text: qsTr("row1rect31")
                        font.pixelSize: 12
                    }

                    border.color: "black"
                    border.width: 1
                }
                Item {
                    id: item1
                    width: parent.width - x
                    height: parent.height - y

                    Column{
                        id: col1
                        spacing: space

                        Rectangle{
                            id: row2rect1
                            width: item1.width
                            height: offset
                            color: "magenta"
                            Text {
                                id: txt6
                                text: qsTr("row2rect1")
                                font.pixelSize: 12
                            }

                            border.color: "black"
                            border.width: 1

                            // выбор цвета
                            Row{
                                spacing: space
                                anchors.centerIn: parent

                                Button{
                                    id: btnColor
                                    text: "Color"
                                    anchors.bottomMargin: space
                                    onClicked: {
                                        colordialog.open()
                                    }
                                    font.pointSize: 16

                                }
                                Button{
                                    id: btnFomt
                                    text: "Font"
                                    onClicked: {
                                        fontdialog.open()
                                        preview.font = fontdialog.font
                                        //                                        preview.font.pixelSize = fontdialog.font.pixelSize
                                        preview.font.pointSize = fontdialog.font.pointSize
                                    }
                                    font.pointSize: 16
                                }
                                Button{
                                    id: btnClear
                                    text: "Clear"
                                    onClicked: {
                                        txtText.text = ""
                                    }
                                    font.pointSize: 16
                                }
                            }
                        }
                        Rectangle{
                            id: row2rect2
                            width: item1.width
                            height: offset
                            color: "magenta"
                            Text {
                                id: txt7
                                text: qsTr("row2rect2")
                                font.pixelSize: 12
                            }

                            border.color: "black"
                            border.width: 1


                            // выбор цвета

                            TextField {
                                anchors.centerIn: parent
                                id: txtText
                                placeholderText: qsTr("Вводи текст!")
                                width: 500
                                font.pointSize: 12

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        oneclick()
                                        console.log(txtText.text)
                                    }
                                }

                            }

                        }

                        Item {
                            id: item2
                            width: parent.width - x
                            height: parent.height - y
                            Text {anchors.centerIn: parent
                                id: item2txt
                                text: qsTr("item2")
                            }

                            Row{
                                id: row3
                                spacing: space
                                Rectangle{
                                    id: row3Rect1
                                    width: offset
                                    height: rect1.height - (col1.height + col1.spacing)

                                    color: "blue"
                                    Text {
                                        id: txt8
                                        text: qsTr("row3Rect1")
                                        font.pixelSize: 12
                                    }

                                    border.color: "black"
                                    border.width: 1
                                }
                                Rectangle{
                                    id: row3Rect2
                                    width: offset
                                    height: rect1.height - (col1.height + col1.spacing)

                                    color: "blue"
                                    Text {
                                        id: txt9
                                        text: qsTr("row3Rect2")
                                        font.pixelSize: 12
                                    }

                                    border.color: "black"
                                    border.width: 1
                                }
                                Rectangle {
                                    id: rectcolortxt
                                    width: rect1.width - (x + 4 * (space + offset))
                                    height: rect1.height - (col1.height + col1.spacing)

                                    Text {
                                        id: preview
                                        anchors.centerIn: parent
                                        color: colordialog.color
                                        text: txtText.text
                                    }
                                    border.color: "black"
                                    border.width: 1
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    property bool flag: true

    function oneclick(){
        if(flag){
            txtText.placeholderText = ""
            txtText.forceActiveFocus()
            flag = false
        }else{
            txtText.forceActiveFocus()
        }
    }

    function upAndDown (){
        while (arrow.visible === true) {
            imageRect.y = x
            x = x + 0.1
            if (x === 1)
                x = x * (-1)
            return imageRect.y
        }
    }
}
