Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web

Namespace AdSelection
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub
		Protected Sub ASPxGridView1_RowValidating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataValidationEventArgs)
			If e.NewValues("Description").ToString() = "" OrElse e.NewValues("Description").ToString().Length > 60 Then
				e.Errors.Add((CType(sender, ASPxGridView)).Columns("Description"), "Incorrect value")
				Dim txt As ASPxTextBox = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("ASPxTextBox1"), ASPxTextBox)
				txt.IsValid = False

			End If



		End Sub
		Protected Sub ASPxGridView1_HtmlRowCreated(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
			If e.RowType = GridViewRowType.EditForm Then
				Dim txt As ASPxTextBox = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("ASPxTextBox1"), ASPxTextBox)
				Dim errLab As ASPxLabel = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("errLab"), ASPxLabel)
				If (Not txt.IsValid) Then
					errLab.Text = "Please correct this value"
				End If

			End If
		End Sub
	End Class
End Namespace
