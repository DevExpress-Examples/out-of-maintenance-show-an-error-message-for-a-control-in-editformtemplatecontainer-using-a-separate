<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="AdSelection._Default" %>

<%@ register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>

<%@ register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGridView"
	TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwgv:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated" OnRowValidating="ASPxGridView1_RowValidating">
			<templates>
				<editform>
				   <table>
					<tr>
					  <td>
					<dxe:aspxtextbox ID="ASPxTextBox1" runat="server" Width="170px" Text='<%#Bind("Description")%>'>
						<validationsettings ErrorText="">
						</validationsettings>
					</dxe:aspxtextbox>
					  </td>
					  <td>
						  <dxe:aspxlabel ID="errLab" runat="server" Text="*" ForeColor="Red">
						  </dxe:aspxlabel>
					  </td>
					 </tr>
				   </table>
					<dxwgv:aspxgridviewtemplatereplacement ReplacementType="EditFormUpdateButton" ID="Update" runat="server">
					</dxwgv:aspxgridviewtemplatereplacement>
				</editform>
			</templates>
			<columns>
				<dxwgv:gridviewcommandcolumn VisibleIndex="0">
					<editbutton Visible="True">
					</editbutton>
				</dxwgv:gridviewcommandcolumn>
				<dxwgv:gridviewdatatextcolumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
					<editformsettings Visible="False" />
				</dxwgv:gridviewdatatextcolumn>
				<dxwgv:gridviewdatatextcolumn FieldName="CategoryName" VisibleIndex="2">
				</dxwgv:gridviewdatatextcolumn>
				<dxwgv:gridviewdatatextcolumn FieldName="Description" VisibleIndex="3">
				</dxwgv:gridviewdatatextcolumn>
			</columns>
		</dxwgv:aspxgridview>
		<asp:accessdatasource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT * FROM [Categories]" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ?, [Picture] = ? WHERE [CategoryID] = ?">
			<deleteparameters>
				<asp:parameter Name="CategoryID" Type="Int32" />
			</deleteparameters>
			<updateparameters>
				<asp:parameter Name="CategoryName" Type="String" />
				<asp:parameter Name="Description" Type="String" />
				<asp:parameter Name="Picture" Type="Object" />
				<asp:parameter Name="CategoryID" Type="Int32" />
			</updateparameters>
			<insertparameters>
				<asp:parameter Name="CategoryID" Type="Int32" />
				<asp:parameter Name="CategoryName" Type="String" />
				<asp:parameter Name="Description" Type="String" />
				<asp:parameter Name="Picture" Type="Object" />
			</insertparameters>
		</asp:accessdatasource>
	</div>
	</form>
</body>
</html>