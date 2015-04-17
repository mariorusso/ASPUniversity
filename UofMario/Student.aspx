<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="UofMario.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:EntityDataSource ID="StuentsEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="Person" Where="it.EnrollmentDate is not null" Include="StudentGrade"></asp:EntityDataSource>
    <asp:GridView ID="StudentsGridView" runat="server" DataSourceID="StuentsEntityDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PersonID">
        
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
            <asp:TemplateField HeaderText="Name" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("FirstName") %>' ID="FirstNameTextBox"></asp:TextBox>
                    <asp:TextBox runat="server" Text='<%# Bind("LastName") %>' ID="LastNameTextBox"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("FirstName") %>' ID="FirstNameLabel"></asp:Label>
                    <asp:Label runat="server" Text='<%# Bind("LastName") %>' ID="LastNameLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enrollment Date" SortExpression="EnrollmentDate">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("EnrollmentDate","{0:d}") %>' ID="ErollmentDateTextBox"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("EnrollmentDate","{0:d}") %>' ID="ErollmentDateLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Student Grade" SortExpression="StudentGrade">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("StudentGrade.Count") %>' ID="StudentGradesLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br /><br />
    <h2>Search Student by Name</h2>
    <p>
        Enter any part of the name
        <asp:TextBox ID="StudentSearchTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="StudentSearchButton" runat="server" Text="Search" />
        <asp:EntityDataSource ID="StudentSearchEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Person" EntityTypeFilter="Person" Where="it.EnrollmentDate is not null and ( it.FirstName Like '%'+@StudentName+'%' or it.LastName Like '%'+@StudentName+'%')">
            <WhereParameters>
                <asp:ControlParameter ControlID="StudentSearchTextBox" DefaultValue="%" Name="StudentName" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
    </p>
    <asp:GridView ID="StudentSearchGridView" runat="server" DataSourceID="StudentSearchEntityDataSource" AutoGenerateColumns="False" DataKeyNames="PersonID" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="Name" SortExpression="FirstName">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("FirstName") %>' ID="StudentSearchFirstNameLabel"></asp:Label>
                    <asp:Label runat="server" Text='<%# Bind("LastName") %>' ID="StudentSearchLastNameLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EnrollmentDate" SortExpression="EnrollmentDate">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("EnrollmentDate") %>' ID="StudentSearchEnrollmentDateLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="EnrollmentDate" HeaderText="EnrollmentDate" SortExpression="EnrollmentDate"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
