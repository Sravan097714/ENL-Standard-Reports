controladdin "Drop Area Control AddIn"
{
    StartupScript = 'ControlAddIns/DropAreaControl/Script/start.js';
    Scripts = 'ControlAddIns/DropAreaControl/Script/DropArea.js';
    StyleSheets = 'ControlAddIns/DropAreaControl/StyleSheet/DropArea.css';
    Images = 'ControlAddIns/DropAreaControl/Image/BackgroundImage.png';

    MinimumHeight = 100;
    MinimumWidth = 150;
    HorizontalShrink = true;
    HorizontalStretch = true;

    event AddInReady();
    event FileDropBegin(filename: Text);
    procedure ReadyForData(filename: Text);
    event FileDrop(data: Text);
    event FileDropEnd();
    event AllFilesUploaded();
}