using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace UofMario
{
    public partial class Instructors : System.Web.UI.Page
    {
        private TextBox InstructorsOfficeTextBox;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void OfficeAssignmentTextBox_Init(object sender, EventArgs e)
        {
            InstructorsOfficeTextBox = sender as TextBox;
        }

        protected void InstructorsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        protected void InstructorsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (var context = new SchoolEntities2())
            {
                var instructorOfficeBeingUpdated = Convert.ToInt32(e.Keys[0]);
                var officeAssignment = (from o in context.OfficeAssignment
                                        where o.InstructorID == instructorOfficeBeingUpdated
                                        select o).FirstOrDefault();

                try
                {
                    if (string.IsNullOrEmpty(InstructorsOfficeTextBox.Text) == false)
                    {
                        if (officeAssignment==null)
                        {
                            OfficeAssignment objOfficeAssignment = new OfficeAssignment();
                            objOfficeAssignment.InstructorID = instructorOfficeBeingUpdated;
                            objOfficeAssignment.Location = InstructorsOfficeTextBox.Text;
                            context.OfficeAssignment.Add(objOfficeAssignment);
                        }
                        else
                        {
                            officeAssignment.Location = InstructorsOfficeTextBox.Text;
                            
                        }
                        context.SaveChanges();
                    }
                    else if (string.IsNullOrEmpty(InstructorsOfficeTextBox.Text) == false && officeAssignment != null) 
                    {
                        officeAssignment.Location = InstructorsOfficeTextBox.Text;
                        officeAssignment.InstructorID = instructorOfficeBeingUpdated;
                        context.SaveChanges();
                    }                    
                    
                }
                    
                catch (Exception)
                {
                    
                    throw;
                }
            }
        }
        protected void CoursesDetailsEntityDataSource_selected(object sender, EntityDataSourceSelectedEventArgs e)
        {

        }
    }
}