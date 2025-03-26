import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: playlistItem
    Layout.fillWidth: true
    Layout.preferredHeight: 50
    color: onAir ? (priority === 1 ? "lightgreen" : "orangered") : "#444444" // Example colors
    property bool onAir: false
    property int priority: 0
    property string title: ""
    property string artist: ""
    property string startTime: ""
    property string duration: ""

    RowLayout {
        anchors.fill: parent
        spacing: 10

        Rectangle {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            color: onAir ? (priority === 1 ? "lightgreen" : "orangered") : "transparent"
            visible: onAir
            Text {
                anchors.centerIn: parent
                text: priority > 0 ? String(priority) : ""
                color: "white"
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter

            Text {
                text: title
                color: "white"
                font.bold: true
            }

            Text {
                text: artist
                color: "lightgray"
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
            Text {
                text: startTime
                color: "lightgray"
            }
             Text {
                text: duration
                color: "white"
            }
        }
    }
}
