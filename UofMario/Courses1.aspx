<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses1.aspx.cs" Inherits="UofMario.Courses1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h2>Courses</h2>
    <asp:EntityDataSource ID="DepartmentsEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Department"></asp:EntityDataSource>
    <asp:DropDownList ID="DepartmentsDropDownList" runat="server" DataSourceID="DepartmentsEntityDataSource" DataTextField="Name" DataValueField="DepartmentID" AutoPostBack="True"></asp:DropDownList>
    <asp:EntityDataSource ID="CoursesEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Course" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="DepartmentsDropDownList" Name="DepartmentID" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="DepartmnetsGridView" runat="server" DataSourceID="CoursesEntityDataSource" AutoGenerateColumns="False" DataKeyNames="CourseID">
        <Columns>
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits"></asp:BoundField>
            <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <h2>Search Courses by Name</h2>
    <p>
        Enter any part of the name
        <asp:TextBox ID="CourseSearchTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="CourseSearchButton" runat="server" Text="Search" />
    </p>
    <asp:EntityDataSource ID="SearchCourseEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Course" Include="Department"></asp:EntityDataSource>
    <asp:QueryExtender ID="SearchQueryExtender" runat="server" TargetControlID="SearchCourseEntityDataSource">
        <asp:SearchExpression SearchType="StartsWith" DataFields="Title">
            <asp:ControlParameter ControlID="CourseSearchTextBox" />
        </asp:SearchExpression>
        <asp:OrderByExpression DataField="Department.Name" Direction="Ascending">
            <asp:ThenBy DataField="Title" Direction="Ascending" />
        </asp:OrderByExpression>
    </asp:QueryExtender>
    <asp:GridView ID="SearchGridView" runat="server" DataSourceID="SearchCourseEntityDataSource" AutoGenerateColumns="False" DataKeyNames="CourseID" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits"></asp:BoundField>

            <asp:TemplateField HeaderText="Department">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Department.Name") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#999999"></EditRowStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
