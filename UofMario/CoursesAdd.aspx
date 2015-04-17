<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CoursesAdd.aspx.cs" Inherits="UofMario.CoursesAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:EntityDataSource ID="AddCourseEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Course" EnableInsert="True" EnableDelete="true"></asp:EntityDataSource>
    <asp:DetailsView ID="AddCourseDetailsView1" DataKeyNames="CourseID" OnItemInserting="AddCourseDetailsView1_ItemInserting" runat="server" Height="50px" Width="125px" DataSourceID="AddCourseEntityDataSource" AutoGenerateRows="False" DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits" ReadOnly="True"></asp:BoundField>
        
        <asp:TemplateField HeaderText="Departments" SortExpression="Department.Name">
               <InsertItemTemplate>
                   <asp:EntityDataSource ID="DepartmentsEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Department" Select="it.[DepartmentID], it.[Name]"></asp:EntityDataSource>
                    <asp:DropDownList ID="DepartmentsDropDownList" runat="server" DataSourceID="DepartmentsEntityDataSource" DataTextField="Name" DataValueField="DepartmentID" OnInit="DepartmentsDropDownList_Init" AutoPostBack="True"></asp:DropDownList>
               </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="true" />
        </Fields>
    </asp:DetailsView>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
