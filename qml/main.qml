// main.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    width: 800
    height: 600
    visible: true
    title: "Radio Playout Mockup"
    color: "#33373C" // Main dark background

    // Define the ListModel for the playlist data
    ListModel {
        id: playlistModel

        ListElement {
            itemType: "onAir"
            deviceId: 2
            artist: "CATHERINE WHEEL"
            title: "Judy staring at the sun"
            details: "LP: Adam & Eve / 1995 / Mercury"
            countdownTime: ":02⁷"
            durationInfo: ":16 / 3:49 / F"
            leftIndicatorColor: "#FF4500" // Red
            itemBackgroundColor: "#B0B0B0" // Light Gray background for non-current ON AIR
            iconSymbol: "◄"
            showProgress: false
            progressValue: 0.0
            startTime: "" // Not applicable for OnAir in this specific way
        }
        ListElement {
            itemType: "onAir"
            deviceId: 1
            artist: "WEIRD AL YANKOVIC"
            title: "Another one rides the bus"
            countdownTime: ":04⁴"
            durationInfo: ":19 / 3:31 / C"
            leftIndicatorColor: "#FF4500" // Red
            itemBackgroundColor: "#66CC33" // Green background for current item
            iconSymbol: "◄"
            showProgress: true // Show progress visualization
            progressValue: 0.8 // Example progress ~80%
            startTime: ""
        }
        ListElement {
            itemType: "queued"
            startTime: "23:54:41"
            artist: "CHURCH, THE"
            title: "Under the milky way tonight"
            countdownTime: "3:47⁸"
            durationInfo: ":11 / 3:48 / D"
            iconSymbol: "◄"
            // Default colors and progress from PlaylistItem.qml will be used
            leftIndicatorColor: "#44474C"
            itemBackgroundColor: "#44474C"
            showProgress: false
            progressValue: 0.0
            deviceId: 0
            details: ""
        }
        ListElement {
            itemType: "queued"
            startTime: "23:57:23"
            artist: "PHOENIX"
            title: "Too young (radio cut)"
            countdownTime: "3:19²"
            durationInfo: ":18 / 3:19 / F"
            iconSymbol: "◄"
            leftIndicatorColor: "#44474C"
            itemBackgroundColor: "#44474C"
            showProgress: false
            progressValue: 0.0
            deviceId: 0
            details: ""
        }
        ListElement {
            itemType: "sync"
            startTime: "00:00:00"
            artist: "SYGNAŁ CZASU"
            title: "Tu RR... jest północ"
            countdownTime: ":07¹"
            durationInfo: ":07 / C"
            leftIndicatorColor: "#007ACC" // Blue for SYNC START
            itemBackgroundColor: "#44474C"
            iconSymbol: "⚡"
            showProgress: false
            progressValue: 0.0
            deviceId: 0
            details: ""
        }
        ListElement {
            itemType: "vtr"
            startTime: "00:00:07"
            artist: "VTR"
            title: "Sobota 11 sie 00:00"
            countdownTime: ":11⁶"
            durationInfo: ":11 / C"
            leftIndicatorColor: "#9370DB" // Purple for VTR
            itemBackgroundColor: "#44474C"
            iconSymbol: "○"
            showProgress: false
            progressValue: 0.0
            deviceId: 0
            details: ""
        }
        ListElement {
            itemType: "link"
            startTime: "00:00:07"
            artist: "ROGER WATERS"
            title: "Radio waves"
            countdownTime: "4:49⁶"
            durationInfo: ":31 / 4:49 / F"
            leftIndicatorColor: "#9370DB" // Purple for LINK
            itemBackgroundColor: "#44474C"
            iconSymbol: "◄"
            showProgress: false
            progressValue: 0.0
            deviceId: 0
            details: ""
        }
    } // End ListModel


    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // --- 1. Top Area (Identical to previous version) ---
        Rectangle {
            id: topArea
            color: "#44474C"
            Layout.fillWidth: true
            Layout.preferredHeight: 60

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                // 1.1 Left Panel (Time, Date, Mode)
                RowLayout {
                    Layout.preferredWidth: 200
                    spacing: 15
                    ColumnLayout { /* ... Time/Date ... */
                        spacing: 2
                        Layout.alignment: Qt.AlignVCenter
                        Label {
                            id: timeLabel
                            text: "23:49:01"
                            color: "white"
                            font.pixelSize: 28
                            font.bold: true
                        }
                        Label {
                            id: dateLabel
                            text: "Poniedziałek 11 pazdziernika 2007"
                            color: "#C0C0C0"
                            font.pixelSize: 11
                        }
                    }
                    Button { /* ... Auto/Manual Button ... */
                        id: modeButton
                        text: "Auto"
                        highlighted: true
                        checkable: true
                        checked: true
                        Layout.preferredWidth: 70
                        Layout.preferredHeight: 40
                        Layout.alignment: Qt.AlignVCenter
                        background: Rectangle {
                            color: modeButton.checked ? "#FF4500" : "#33AA33"
                            radius: 3
                        }
                        contentItem: Label {
                            text: modeButton.text
                            color: "white"
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onCheckedChanged: {
                            text = checked ? "Auto" : "Manual"
                        }
                    }
                }

                // Spacer
                Item { Layout.fillWidth: true }

                // 1.2 Right Panel (Emission Blocks)
                GridLayout { /* ... Emission Blocks ... */
                    rows: 2
                    columns: 3
                    columnSpacing: 10
                    rowSpacing: 2
                    Layout.alignment: Qt.AlignVCenter
                    Label {
                        text: "22:00:00"
                        color: "#C0C0C0"
                        font.pixelSize: 11
                        Layout.alignment: Qt.AlignRight
                    }
                    Label {
                        text: "ON AIR"
                        color: "#66CC33"
                        font.bold: true
                        font.pixelSize: 11
                    }
                    Label {
                        text: "Nocny maraton muzyczny (-00:01:01)"
                        color: "white"
                        font.pixelSize: 11
                    }
                    Label {
                        text: "06:00:00"
                        color: "#C0C0C0"
                        font.pixelSize: 11
                        Layout.alignment: Qt.AlignRight
                    }
                    Label {
                        text: "-06:10:59"
                        color: "#C0C0C0"
                        font.pixelSize: 11
                    }
                    Label {
                        text: "Informacje + prognoza pogody + reklama"
                        color: "white"
                        font.pixelSize: 11
                    }
                }
            }
        } // End Top Area

        // --- 2. Main Area (Playlist using ListView) ---
        ListView {
            id: playlistView
            model: playlistModel // Assign the model here
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 1 // Thin line between items
            clip: true // Ensure items don't draw outside the view

            // The delegate renders each item from the model
            delegate: PlaylistItem {
                // Bind PlaylistItem properties to model properties
                // The 'model' object provides access to ListElement properties
                itemType: model.itemType
                deviceId: model.deviceId
                startTime: model.startTime
                artist: model.artist
                title: model.title
                details: model.details
                countdownTime: model.countdownTime
                durationInfo: model.durationInfo
                leftIndicatorColor: model.leftIndicatorColor
                itemBackgroundColor: model.itemBackgroundColor // Bind this too
                iconSymbol: model.iconSymbol
                showProgress: model.showProgress
                progressValue: model.progressValue

                // Ensure the delegate takes the full width of the ListView
                width: playlistView.width
            }

            // Optional: Add scrollbar if needed (usually appears automatically)
            ScrollIndicator.vertical: ScrollIndicator { }

        } // End Playlist ListView

        // --- 3. Control Buttons Area (Identical to previous version) ---
        Rectangle {
            id: bottomArea
            color: "#33373C"
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.margins: 5

            RowLayout {
                anchors.fill: parent
                spacing: 10

                // 3.1 Left Buttons
                RowLayout { /* ... ADD/DEL/MOVE/COPY/CUE buttons ... */
                    spacing: 5
                    Repeater {
                        model: [
                            "ADD",
                            "DEL",
                            "MOVE",
                            "COPY",
                            "CUE"]
                        delegate: Button {
                            /* ... Button Style ... */
                            text: modelData
                            implicitWidth: 60
                            implicitHeight: 35
                            background: Rectangle{
                                color:"#55595C"
                                radius: 3
                                border.color: "#666A6D"
                                border.width: 1
                            }
                            contentItem: Label {
                                text: parent.text
                                color:"#D0D0D0"
                                font.pixelSize:11
                                font.bold:true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }

                // Spacer
                Item {
                    Layout.fillWidth: true
                }

                // 3.2 Right Buttons
                RowLayout { /* ... LOG/CARTS/LIBRARY/SHOW buttons ... */
                    spacing: 5
                    Repeater {
                        model: [
                            "LOG",
                            "CARTS",
                            "LIBRARY",
                            "SHOW"
                        ]
                        delegate: Button {
                            /* ... Button Style ... */
                            text: modelData
                            implicitWidth: 70
                            implicitHeight: 35
                            background: Rectangle{
                                color:"#55595C"
                                radius: 3
                                border.color: "#666A6D"
                                border.width: 1
                            }
                            contentItem: Label {
                                text: parent.text
                                color:"#D0D0D0"
                                font.pixelSize:11
                                font.bold:true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
            }
        } // End Bottom Area

    } // End Main ColumnLayout
}
