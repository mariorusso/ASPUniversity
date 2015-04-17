using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UofMario
{
    public partial class InstructorsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InstructorDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulatedDropDownLists();
        }

        protected void InstructorDropDownList_DataBound(object sender, EventArgs e)
        {
            PopulatedDropDownLists();
        }

        protected void RemoveCoursesButton_Click(object sender, EventArgs e)
        {
            using (var context = new SchoolEntities2())
            {
                var InstructorID = Convert.ToInt32(InstructorDropDownList.SelectedValue);
                var Instructor = (from p in context.Person
                                  where p.PersonID == InstructorID
                                  select p).First();

                var CourseID = Convert.ToInt32(AssignedCoursesDropDownList.SelectedValue);
                var Course = (from c in context.Course
                              where c.CourseID == CourseID
                              select c).First();
                Instructor.Course.Remove(Course);
                try
                {
                    context.SaveChanges();
                    PopulatedDropDownLists();
                    RemoveCourseLabel.Visible = true;
                }
                catch (Exception)
                {

                    RemoveCourseLabel.Text = "Attempt to remove a Course was not successfull";
                    RemoveCourseLabel.Visible = true;
                }

            }
        }

        protected void AssignCoursesButton_Click(object sender, EventArgs e)
        {
            using (var context = new SchoolEntities2())
            {
                var InstructorID = Convert.ToInt32(InstructorDropDownList.SelectedValue);
                var Instructor = (from p in context.Person
                                  where p.PersonID == InstructorID
                                  select p).First();

                var CourseID = Convert.ToInt32(UnassignCoursesDropDownList.SelectedValue);
                var Course = (from c in context.Course
                              where c.CourseID == CourseID
                              select c).First();
                Instructor.Course.Add(Course);
                try
                {
                    context.SaveChanges();
                    PopulatedDropDownLists();
                    AssignCourseLabel.Visible = true;
                }
                catch (Exception)
                {

                    AssignCourseLabel.Text = "Attempt to assign a Course was not successfull";
                    AssignCourseLabel.Visible = true;
                }
            }

        }

        private void PopulatedDropDownLists()
        {
            using(var context = new SchoolEntities2())
            {
                var allCourses = (from c in context.Course
                                  select c).ToList();
                var InstructorID = Convert.ToInt32(InstructorDropDownList.SelectedValue);
                var Instructor = (from p in context.Person.Include("Course")
                                      where p.PersonID == InstructorID
                                      select p).First();
                var assignedCourses = Instructor.Course.ToList();
                var unassignedCourses = allCourses.Except(assignedCourses.AsEnumerable()).ToList();
                UnassignCoursesDropDownList.DataSource = unassignedCourses;
                UnassignCoursesDropDownList.DataBind();
                UnassignCoursesDropDownList.Visible = true;

                AssignedCoursesDropDownList.DataSource = assignedCourses;
                AssignedCoursesDropDownList.DataBind();
                AssignedCoursesDropDownList.Visible = true;
            }
        }

    }
}