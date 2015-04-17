<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstructorsManagement.aspx.cs" Inherits="UofMario.InstructorsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h2>Course Management</h2>
    <h3>Instructors List</h3>
    <p>Select the Instructor:
        <asp:EntityDataSource ID="InstructorsManagementEntityDataSource" runat="server" Where="it.[HireDate] is not null" Select="it.PersonID,it.LastName+','+it.FirstName As Name" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Person"></asp:EntityDataSource>
        <asp:DropDownList ID="InstructorDropDownList" AutoPostBack="true" runat="server" DataSourceID="InstructorsManagementEntityDataSource" DataTextField="Name" DataValueField="PersonID" OnSelectedIndexChanged="InstructorDropDownList_SelectedIndexChanged" OnDataBound="InstructorDropDownList_DataBound"></asp:DropDownList>
    </p>
     <h3>Assign a Course</h3>
    <p>Select a Course:
        <asp:DropDownList ID="UnassignCoursesDropDownList" DataTextField="Title" DataValueField="CourseID" runat="server"></asp:DropDownList>
        <br />
        <asp:Button ID="AssignCoursesButton" runat="server" Text="Assign" OnClick="AssignCoursesButton_Click" />
        <br />
        <asp:Label ID="AssignCourseLabel" runat="server" Visible="false" Text="Course Successfully Assigned"></asp:Label>
    </p>
    <h3>Remove a Course</h3>
    <p>Select a Course:
        <asp:DropDownList ID="AssignedCoursesDropDownList" DataTextField="Title" DataValueField="CourseID" runat="server"></asp:DropDownList>
        <br />
        <asp:Button ID="RemoveCoursesButton" runat="server" Text="Remove" OnClick="RemoveCoursesButton_Click" />
        <br />
        <asp:Label ID="RemoveCourseLabel" runat="server" Visible="false" Text="Course Successfully Removed"></asp:Label>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
