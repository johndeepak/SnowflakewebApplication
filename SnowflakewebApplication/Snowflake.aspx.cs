using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Snowflake.Data.Client;
using System.Data;
using Newtonsoft.Json;

namespace SnowflakewebApplication
{
    public partial class Snowflake : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }
        #region manual
        //protected void Save_Click(object sender, EventArgs e)
        //{
        //    string connectionString = "scheme=https;host=jo69808.us-central1.gcp.snowflakecomputing.com;ROLE=sysadmin;WAREHOUSE=John;user=johns;password=Water123;DB=JOHN;account=jo69808.us-central1.gcp.*;";

        //    using (var conn = new SnowflakeDbConnection())
        //    {
        //        conn.ConnectionString = connectionString;
        //        conn.Open();
        //        var cmd = conn.CreateCommand();
        //        if (Ids.Text != string.Empty)
        //        {
        //            cmd.CommandText = "Update  Employee set Firstname='" + FirstName.Text + "',Lastname= '" + LastName.Text + "',Address='" + Address.Text + "' where Id='" + Ids.Text + "'";
        //            Save.Text = "Save";
        //            Ids.Text = "";
        //            clear();
        //        }
        //        else
        //        {
        //            cmd.CommandText = "insert into  Employee values('" + FirstName.Text + "','" + LastName.Text + "','" + Address.Text + "','" + System.Guid.NewGuid() + "'); ";
        //            clear();
        //        }
        //        var reader = cmd.ExecuteReader();

        //        conn.Close();
        //        ShowData();
        //    }
        //}
        #endregion
        protected void Save_Click(object sender, EventArgs e)
        {
            string connectionString = "scheme=https;host=jo69808.us-central1.gcp.snowflakecomputing.com;ROLE=sysadmin;WAREHOUSE=John;user=johns;password=Water123;DB=JOHN;account=jo69808.us-central1.gcp.*;";

            using (var conn = new SnowflakeDbConnection())
            {
                conn.ConnectionString = connectionString;
                conn.Open();
                var cmd = conn.CreateCommand();
                if (Ids.Text == string.Empty)
                {
                    Ids.Text = System.Guid.NewGuid().ToString();
                }
                cmd.CommandText = "call Employeesave('" + FirstName.Text + "','" + LastName.Text + "','" + Address.Text + "','" + Ids.Text + "')";             
                var reader = cmd.ExecuteReader();
                Save.Text = "Save";
                Ids.Text = "";
                clear();
                conn.Close();
                ShowData();
            }
        }
        public void clear()
        {
            FirstName.Text = "";
            LastName.Text = "";
            Address.Text = "";
        }
        public void ShowData()
        {
            string connectionString1 = "scheme=https;host=jo69808.us-central1.gcp.snowflakecomputing.com;ROLE=sysadmin;WAREHOUSE=John;user=johns;password=Water123;DB=JOHN;account=jo69808.us-central1.gcp.*;";
            DataTable dt = new DataTable();
            SnowflakeDbConnection con = new SnowflakeDbConnection();
            con.ConnectionString = connectionString1;
            con.Open();
            SnowflakeDbDataAdapter adapt = new SnowflakeDbDataAdapter("CALL Employee_Grid()", con);
            adapt.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                string data = dt.Rows[0]["Employee_Grid"].ToString();

                List<Employee> EmployeeData = JsonConvert.DeserializeObject<List<Employee>>(data);

                grid.DataSource = EmployeeData;
                grid.DataBind();
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow grd = (GridViewRow)btn.NamingContainer;
            Label lbl = (Label)grd.FindControl("Id");
            Label firstname = (Label)grd.FindControl("FirstName");
            Label lasttname = (Label)grd.FindControl("LastName");
            Label address = (Label)grd.FindControl("Address");
            Ids.Text = lbl.Text;
            FirstName.Text = firstname.Text;
            LastName.Text = lasttname.Text;
            Address.Text = address.Text;
            Save.Text = "Update";
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow grd = (GridViewRow)btn.NamingContainer;
            Label lbl = (Label)grd.FindControl("Id");
            string connectionString = "scheme=https;host=jo69808.us-central1.gcp.snowflakecomputing.com;ROLE=sysadmin;WAREHOUSE=John;user=johns;password=Water123;DB=JOHN;account=jo69808.us-central1.gcp.*;";

            using (var conn = new SnowflakeDbConnection())
            {
                conn.ConnectionString = connectionString;
                conn.Open();
                var cmd = conn.CreateCommand();

                cmd.CommandText = "call Employee_Delete('" + lbl.Text + "')";
                var reader = cmd.ExecuteReader();
                //Save.Text = "Save";
                Ids.Text = "";
                clear();
                conn.Close();
                ShowData();
            }
        }
            public class Employee
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Address { get; set; }
            public string Id { get; set; }

        }
        
    }
}
