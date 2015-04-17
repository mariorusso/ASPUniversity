﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UofMario
{
   
    public partial class CoursesAdd : System.Web.UI.Page
    {
        private DropDownList departmentDropDownList;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DepartmentsDropDownList_Init(object sender, EventArgs e)
        {
            departmentDropDownList = sender as DropDownList;
        }

        protected void AddCourseDetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            var departmetID = Convert.ToInt32(departmentDropDownList.SelectedValue);
            e.Values["DepartmentID"] = departmetID;
        }
    }
}