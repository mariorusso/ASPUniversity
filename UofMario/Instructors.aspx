<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instructors.aspx.cs" Inherits="UofMario.Instructors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:EntityDataSource ID="InstructorsEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" Where="it.HireDate is not null" EntitySetName="Person" EntityTypeFilter="Person" Include="OfficeAssignment"></asp:EntityDataSource>
    <asp:GridView ID="InstructorsGridView" runat="server" DataSourceID="InstructorsEntityDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PersonID" SelectedRowStyle-BackColor="#3333CC" OnRowUpdating="InstructorsGridView_RowUpdating" OnSelectedIndexChanged="InstructorsGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
            <asp:TemplateField HeaderText="Name" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("FirstName") %>' ID="FirstNameTextBox"></asp:TextBox>
                     <asp:TextBox runat="server" Text='<%# Bind("LastName") %>' ID="LastNameTextBox"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("FirstName") %>' ID="FirstNameLabel"></asp:Label>
                     <asp:Label runat="server" Text='<%# Eval("LastName") %>' ID="LastNameLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hire Date" SortExpression="HireDate">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("HireDate","{0:d}") %>' ID="HireDateTextBox"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("HireDate","{0:d}") %>' ID="HireDateLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Office Assignment" SortExpression="OfficeAssignment">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Eval("OfficeAssignment.Location") %>' ID="OfficeAssignmentTextBox" OnInit="OfficeAssignmentTextBox_Init"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("OfficeAssignment.Location") %>' ID="OfficeAssignmentLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>          
        </Columns>
    </asp:GridView>
    
    <h2>Courses Taugh</h2>
    <asp:EntityDataSource ID="CoursesEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Course" EntityTypeFilter="" Select="" Where="@PersonID in (SELECT VALUE Instructors.PersonID FROM it.Person as Instructors)" Include="Department">
        <WhereParameters>
            <asp:ControlParameter ControlID="InstructorsGridView" Name="PersonID" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="CoursesGridView" runat="server" DataSourceID="CoursesEntityDataSource" AutoGenerateColumns="False" DataKeyNames="CourseID">
       <EmptyDataTemplate>
           <p>No Data Found</p>
       </EmptyDataTemplate>
         <Columns>
             <asp:CommandField ShowSelectButton="true" />
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits"></asp:BoundField>
            <asp:TemplateField HeaderText=" Department" SortExpression="Department">
                
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Department.Name") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        
    </asp:GridView>
    <br /><br />
        <h3>Course Details</h3>
    <asp:EntityDataSource ID="CoursesDetailsEntityDataSource" runat="server" ConnectionString="name=SchoolEntities2" DefaultContainerName="SchoolEntities2" EnableFlattening="False" EntitySetName="Course" EntityTypeFilter="" Select="" Where="it.CourseID=@CourseID" Include="Department,OnlineCourse,OnsiteCourse,StudentGrade.Person" OnSelected="CoursesDetailsEntityDataSource_selected">
        <WhereParameters>
            <asp:ControlParameter ControlID="CoursesGridView" Name="CourseID" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:DetailsView ID="CourseDetailsView" runat="server" Height="50px" Width="125px" DataSourceID="CoursesDetailsEntityDataSource" AutoGenerateRows="False" DataKeyNames="CourseID">
       <EmptyDataTemplate>
           <p>No Data Found</p>
       </EmptyDataTemplate>
        <Fields>
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits"></asp:BoundField>
            <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">                
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Department.Name") %>' ID="DepartmentNameLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Course Location" SortExpression="OnsiteCourse">                
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("OnsiteCourse.Location") %>' ID="OnsiteCourseLocationLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Course Website" SortExpression="OnlineCourse">                
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("OnlineCourse.URL") %>' ID="OnlineCourseURLLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
