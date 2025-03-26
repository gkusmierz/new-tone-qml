import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: mainWindow
    width: 800
    height: 600
    visible: true
    title: "Radio Automation" // or whatever title you want

    background: Rectangle {
        color: "#333333" // Dark Gray Background
    }

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        spacing: 0 // Reduced spacing

        // Top Bar
        Rectangle {
            id: topBar
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "#222222" // Darker Gray Background
            RowLayout {
                anchors.fill: parent
                spacing: 10

                //Clock
                Text {
                    id: timeDisplay
                    text: "23:49:01" //Example
                    color: "white"
                    font.pixelSize: 30
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                }

                Text {
                    id: dateDisplay
                    text: "Poniedzialek 11 pazdziernika 2007" //Example
                    color: "white"
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                }

                Rectangle {
                    id: autoModeIndicator
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 30
                    color: "orangered" // Or whatever color you need
                    Text {
                        anchors.centerIn: parent
                        text: "Auto"
                        color: "white"
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                } // Spacer to push to right
                ColumnLayout {
                   Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                   Text {
                       id: onAirTime
                       text: "ON AIR"
                       color: "green"
                   }
                   Text {
                       id: timeInfo
                       text: "-06:10:59"
                       color: "white"
                   }

                }
                ColumnLayout {
                   Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                    Text {
                        id: nightMarathon
                        text: "Nocny maraton muzyczny (-00:01:01)"
                        color: "white"
                    }
                    Text {
                        id: info
                        text: "Informacje + prognoza pogody + reklama"
                        color: "white"
                    }
                }
            }
        }

        // Playlist Area
        ScrollView {
            id: playlistScrollView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ColumnLayout {
                id: playlistLayout
                width: playlistScrollView.width
                spacing: 0

                // Example Playlist Item
                PlaylistItem {
                    onAir: true
                    priority: 2
                    title: "CATHERINE WHEEL"
                    artist: "Judy staring at the sun"
                    startTime: ""
                    duration: ":027"
                }
                PlaylistItem {
                    onAir: true
                    priority: 1
                    title: "WEIRD AL YANKOVIC"
                    artist: "Another one rides the bus"
                    startTime: ""
                    duration: ":044"
                }
                PlaylistItem {
                    onAir: false
                    priority: 0
                    title: "CHURCH, THE"
                    artist: "Under the milky way tonight"
                    startTime: "23:54:41"
                    duration: "3:478"
                }
                // Add more PlaylistItem components here...
            }
        }

        // Bottom Buttons
        RowLayout {
            id: bottomButtonsLayout
            Layout.fillWidth: true
            Layout.preferredHeight: 20
            spacing: 10
            /*Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }*/
            Button {
                text: "ADD"
                onClicked: { /* Logic to add a new item */ }
                Layout.alignment: Qt.AlignHCenter
            }
            Button {
                text: "DEL"
                onClicked: { /* Logic to delete the selected item */ }
                Layout.alignment: Qt.AlignHCenter
            }
            Button {
                text: "MOVE"
                onClicked: { /* Logic to move the selected item */ }
                Layout.alignment: Qt.AlignHCenter
            }
             Button {
                text: "COPY"
                onClicked: { /* Logic to copy the selected item */ }
                Layout.alignment: Qt.AlignHCenter
            }
             Button {
                text: "CUE"
                onClicked: { /* Logic to queue the selected item */ }
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

           Button {
                text: "LOG"
                onClicked: { /* Logic to log the  item */ }
                Layout.alignment: Qt.AlignHCenter
            }
            Button {
                text: "CARTS"
                onClicked: { /* Logic to handle cart operation */ }
                Layout.alignment: Qt.AlignHCenter
            }
            Button {
                text: "LIBRARY"
                onClicked: { /* Logic to open library */ }
                Layout.alignment: Qt.AlignHCenter
            }
             Button {
                text: "SHOW"
                onClicked: { /* Logic to show the info */ }
                Layout.alignment: Qt.AlignHCenter
            }
            /*Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }*/
        }
    }
}
