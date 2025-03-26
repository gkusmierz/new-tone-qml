// PlaylistItem.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    width: parent.width
    height: 60
    color: itemBackgroundColor // Default background

    // Define properties for customization
    property string itemType: "queued" // "onAir", "queued", "sync", "vtr", "link"
    property int deviceId: 0
    property string startTime: ""
    property string iconSymbol: "♫" // Placeholder: "♫" music, "!" jingle, "○" vtr/other
    property string artist: "Artist"
    property string title: "Title"
    property string details: "" // e.g., LP info
    property string countdownTime: ":00"
    property string durationInfo: ":00 / :00 / F"
    property color itemBackgroundColor: "#44474C" // Default gray
    property color leftIndicatorColor: "#44474C"
    property bool showProgress: false
    property real progressValue: 0.0 // 0.0 to 1.0

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // 1. Left Indicator Section
        Rectangle {
            id: leftIndicator
            color: root.leftIndicatorColor
            Layout.preferredWidth: 70
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 5
                spacing: 2

                Label {
                    text: {
                        if (root.itemType === "onAir") return "ON AIR";
                        if (root.itemType === "sync") return "SYNC";
                        if (root.itemType === "link") return "LINK";
                        if (root.itemType === "vtr") return "VTR";
                        return "START"; // default for queued
                    }
                    color: "white"
                    font.bold: true
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    text: {
                        if (root.itemType === "onAir") return root.deviceId.toString();
                        if (root.startTime) return root.startTime;
                        return "";
                    }
                    color: "white"
                    font.pixelSize: 11
                    Layout.alignment: Qt.AlignHCenter
                }

                // Add START label below time for sync/link/vtr
                 Label {
                    text: (root.itemType === "sync" || root.itemType === "link" || root.itemType === "vtr") ? "START" : ""
                    color: "white"
                    font.pixelSize: 11
                    Layout.alignment: Qt.AlignHCenter
                    visible: text !== ""
                }
            }
        }

        // 2. Middle Information Section
        Rectangle {
            id: middleSection
            color: root.itemBackgroundColor // Base color
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true // Important for progress bar

            // Progress Bar visualization (optional, static here)
            Rectangle {
                visible: root.showProgress
                width: parent.width * root.progressValue
                height: parent.height
                color: Qt.lighter(root.itemBackgroundColor, 1.1) // Slightly lighter background for progress
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }


            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                spacing: 8

                Label {
                    id: iconLabel
                    text: root.iconSymbol
                    color: "white"
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignVCenter
                }

                ColumnLayout {
                    spacing: 2
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter

                    Label {
                        text: root.artist
                        color: "white"
                        font.pixelSize: 13
                        font.bold: true
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Label {
                        text: root.title
                        color: "#CCCCCC" // Lighter gray for title/details
                        font.pixelSize: 12
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                     Label {
                        text: root.details
                        color: "#AAAAAA" // Even lighter gray for extra details
                        font.pixelSize: 11
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                        visible: text !== ""
                    }
                }
            }
        }

        // 3. Right Timing Section
        Rectangle {
            id: rightSection
            color: root.itemBackgroundColor // Match background
            Layout.preferredWidth: 100
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.rightMargin: 10
                spacing: 2

                Label {
                    text: root.countdownTime
                    color: "white"
                    font.pixelSize: 24 // Larger countdown time
                    font.bold: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }
                Label {
                    text: root.durationInfo
                    color: "#B0B0B0" // Gray for details
                    font.pixelSize: 11
                    Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                }
            }
        }
    }
}
