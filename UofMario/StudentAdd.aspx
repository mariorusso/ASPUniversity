<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentAdd.aspx.cs" Inherits="UofMario.StudentAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:EntityDataSource ID="StudentEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EnableInsert="True" EntitySetName="Person" EntityTypeFilter="Person"></asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="StudentEntityDataSource" AutoGenerateRows="False" DataKeyNames="PersonID" DefaultMode="Insert">
        <Fields>  
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>          
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>            
            <asp:BoundField DataField="EnrollmentDate" HeaderText="EnrollmentDate" SortExpression="EnrollmentDate"></asp:BoundField>
        
            <asp:CommandField ShowInsertButton="true" />

        </Fields>
        
    </asp:DetailsView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
