<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to limit the number of uploaded files</title>
	<style type="text/css">
		.groupBox
		{
			width: 319px;
			height: 206px;
		}
	</style>
</head>
<body>
	<script type="text/javascript">
		var filesNumber;
		var msg = 'Too many files';
		function textChanged(s, e) {
			filesNumber = upload1.GetText().split(',').length;
			if (filesNumber > spinEdit.GetValue())
				alert(msg);
		}
		function uploadStart(s, e) {
			if (filesNumber > spinEdit.GetValue()) {
				alert(msg);
				e.cancel = true;
			}
		}
		function fileUploadComplete(s, e) {
			if (e.callbackData != "")
				addFileToContainer(e.callbackData);
		}
		function addFileToContainer(callbackData) {
			var label = document.createElement('label');
			label.innerText = callbackData;
			var fileContainer = document.getElementById("groupBox1");
			fileContainer.appendChild(label);
			fileContainer.appendChild(document.createElement('br'));
		}
	</script>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" Number="5" Height="19px" ClientInstanceName="spinEdit" HelpText="Files count" Width="86px" />
			<dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" Width="280px"
				ShowAddRemoveButtons="true" ShowUploadButton="true" ShowProgressPanel="true" ClientInstanceName="upload1" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
				<ClientSideEvents TextChanged="textChanged" FileUploadStart="uploadStart" FileUploadComplete="fileUploadComplete" />
				<ValidationSettings MaxFileSize="4000000"></ValidationSettings>
				<AdvancedModeSettings EnableMultiSelect="true" />
			</dx:ASPxUploadControl>
			<br />
			<fieldset class="groupBox" id="groupBox1">
				<legend>Uploaded Files</legend>
			</fieldset>
		</div>
	</form>
</body>
</html>