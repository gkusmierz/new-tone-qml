import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: mainWindow
    width: 1024
    height: 768
    visible: true
    title: "Radio Automation Playout"
    color: "#2a2a2a"

    // Root layout
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        // 1. Top information area
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: "#333333"
            radius: 4

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 8

                // 1.1 Left information panel
                Rectangle {
                    Layout.preferredWidth: 300
                    Layout.fillHeight: true
                    color: "#3a3a3a"
                    radius: 4

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 4

                        // 1.1.1 Current time
                        Text {
                            id: timeText
                            font.pixelSize: 24
                            font.bold: true
                            color: "white"
                            text: "12:34:56"
                        }

                        // 1.1.2 Current date
                        Text {
                            id: dateText
                            font.pixelSize: 16
                            color: "#cccccc"
                            text: "Tuesday, March 26, 2025"
                        }

                        // 1.1.3 AUTO/MANUAL button
                        Rectangle {
                            id: autoButton
                            Layout.preferredWidth: 120
                            Layout.preferredHeight: 30
                            color: "red"
                            radius: 3
                            property bool isAuto: true

                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                text: autoButton.isAuto ? "AUTO" : "MANUAL"
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    autoButton.isAuto = !autoButton.isAuto
                                    autoButton.color = autoButton.isAuto ? "red" : "green"
                                }
                            }
                        }
                    }
                }

                // 1.2 Right emission blocks panel
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#3a3a3a"
                    radius: 4

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        // 1.2.1 Current emission block
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#444444"
                            radius: 3

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 6
                                spacing: 2

                                Text {
                                    text: "CURRENT EMISSION BLOCK"
                                    color: "#aaaaaa"
                                    font.pixelSize: 12
                                }

                                Text {
                                    text: "Morning Show - 10:00-12:00"
                                    color: "yellow"
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                            }
                        }

                        // 1.2.2 Next emission block
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#444444"
                            radius: 3

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 6
                                spacing: 2

                                Text {
                                    text: "NEXT EMISSION BLOCK"
                                    color: "#aaaaaa"
                                    font.pixelSize: 12
                                }

                                Text {
                                    text: "Afternoon Tunes - 12:00-14:00"
                                    color: "lightgreen"
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                            }
                        }
                    }
                }
            }
        }

        // 2. Main playlist area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#333333"
            radius: 4

            ListView {
                id: playlistView
                anchors.fill: parent
                anchors.margins: 8
                spacing: 6
                clip: true
                model: playlistModel

                delegate: Rectangle {
                    width: ListView.view.width
                    height: 70
                    radius: 4
                    color: index < 2 ? "#2a2a2a" : "#3a3a3a"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 6
                        spacing: 6

                        // 2.4 Left status rectangle
                        Rectangle {
                            Layout.preferredWidth: 80
                            Layout.fillHeight: true
                            color: model.isOnAir ? "red" : "#4a4a4a"
                            radius: 3

                            Column {
                                anchors.centerIn: parent
                                spacing: 4

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: model.isOnAir ? "ON AIR" : "START"
                                    color: "white"
                                    font.bold: true
                                    font.pixelSize: 14
                                }

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: model.isOnAir ? model.deviceId : model.duration
                                    color: "white"
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                            }
                        }

                        // 2.5 Middle content with progress
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#222222"
                            radius: 3

                            // Progress indicator
                            Rectangle {
                                height: parent.height
                                width: parent.width * model.progress
                                radius: 3
                                color: model.type === "music" ? "#006699" :
                                       model.type === "jingle" ? "#669900" : "#996600"
                            }

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 8
                                spacing: 10

                                // 2.5.1 Type icon
                                Text {
                                    Layout.preferredWidth: 30
                                    text: model.type === "music" ? "♫" :
                                          model.type === "jingle" ? "♪" : "▶"
                                    color: "white"
                                    font.pixelSize: 24
                                    horizontalAlignment: Text.AlignHCenter
                                }

                                // 2.5.2 & 2.5.3 Artist & Title
                                Column {
                                    Layout.fillWidth: true
                                    spacing: 4

                                    Text {
                                        width: parent.width
                                        text: model.artist
                                        color: "white"
                                        font.pixelSize: 18
                                        font.bold: true
                                        elide: Text.ElideRight
                                    }

                                    Text {
                                        width: parent.width
                                        text: model.title
                                        color: "#cccccc"
                                        font.pixelSize: 16
                                        elide: Text.ElideRight
                                    }
                                }
                            }
                        }

                        // 2.3 Right timing labels
                        Column {
                            Layout.preferredWidth: 100
                            Layout.fillHeight: true
                            spacing: 8

                            // 2.3.1 Emission time countdown
                            Text {
                                width: parent.width
                                horizontalAlignment: Text.AlignRight
                                text: model.emissionTime
                                color: "yellow"
                                font.pixelSize: 18
                                font.bold: true
                            }

                            // 2.3.2 Intro/ending method
                            Text {
                                width: parent.width
                                horizontalAlignment: Text.AlignRight
                                text: model.introTime + " / " + model.endingMethod
                                color: "lightgreen"
                                font.pixelSize: 16
                            }
                        }
                    }
                }
            }
        }

        // 3. Control buttons area
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: "#333333"
            radius: 4

            RowLayout {
                anchors.fill: parent
                anchors.margins: 6
                spacing: 10

                // 3.1 Left control buttons
                Row {
                    Layout.preferredWidth: parent.width * 0.5 - 5
                    Layout.fillHeight: true
                    spacing: 8

                    Repeater {
                        model: ["ADD", "DEL", "MOVE", "COPY", "CUE"]
                        delegate: Rectangle {
                            width: (parent.width - 32) / 5
                            height: parent.height
                            color: "#4a4a4a"
                            radius: 3

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                color: "white"
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onPressed: parent.color = "#666666"
                                onReleased: parent.color = "#4a4a4a"
                            }
                        }
                    }
                }

                // 3.2 Right control buttons
                Row {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 8

                    Repeater {
                        model: ["LOG", "CARTS", "LIBRARY", "SHOW"]
                        delegate: Rectangle {
                            width: (parent.width - 24) / 4
                            height: parent.height
                            color: "#4a4a4a"
                            radius: 3

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                color: "white"
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onPressed: parent.color = "#666666"
                                onReleased: parent.color = "#4a4a4a"
                            }
                        }
                    }
                }
            }
        }
    }

    // Playlist model (using direct values to avoid script expressions)
    ListModel {
        id: playlistModel

        ListElement {
            artist: "The Beatles"
            title: "Hey Jude"
            type: "music"
            progress: 0.7
            isOnAir: true
            deviceId: "1"
            duration: "3:54"
            emissionTime: "1:10"
            introTime: "0:20"
            endingMethod: "F"
        }

        ListElement {
            artist: "Radio Jingle"
            title: "Station ID"
            type: "jingle"
            progress: 0.3
            isOnAir: true
            deviceId: "2"
            duration: "0:15"
            emissionTime: "0:10"
            introTime: "0:00"
            endingMethod: "C"
        }

        ListElement {
            artist: "Queen"
            title: "Bohemian Rhapsody"
            type: "music"
            progress: 0.0
            isOnAir: false
            deviceId: ""
            duration: "5:55"
            emissionTime: "2:00"
            introTime: "0:30"
            endingMethod: "F"
        }

        ListElement {
            artist: "News Intro"
            title: "Hourly Update"
            type: "jingle"
            progress: 0.0
            isOnAir: false
            deviceId: ""
            duration: "0:10"
            emissionTime: "4:05"
            introTime: "0:00"
            endingMethod: "C"
        }

        ListElement {
            artist: "Weather Report"
            title: "Local Forecast"
            type: "vtr"
            progress: 0.0
            isOnAir: false
            deviceId: ""
            duration: "1:30"
            emissionTime: "5:15"
            introTime: "0:00"
            endingMethod: "D"
        }

        ListElement {
            artist: "Michael Jackson"
            title: "Billie Jean"
            type: "music"
            progress: 0.0
            isOnAir: false
            deviceId: ""
            duration: "4:54"
            emissionTime: "6:45"
            introTime: "0:15"
            endingMethod: "F"
        }

        ListElement {
            artist: "Commercial Break"
            title: "Sponsored Content"
            type: "vtr"
            progress: 0.0
            isOnAir: false
            deviceId: ""
            duration: "2:30"
            emissionTime: "11:39"
            introTime: "0:00"
            endingMethod: "C"
        }
    }

    // Timer to update clock
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var date = new Date();
            timeText.text = Qt.formatTime(date, "HH:mm:ss");
            dateText.text = Qt.formatDateTime(date, "dddd, MMMM d, yyyy");
        }
    }
}
