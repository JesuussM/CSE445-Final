using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSE445_Final
{
    public partial class Member : System.Web.UI.Page
    {
        private string CrimesCsvPath => Server.MapPath("~/App_Data/CrimeData.csv");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblSearchError.Visible = false;
            string zip = (txtZip.Text ?? string.Empty).Trim();
            if (string.IsNullOrWhiteSpace(zip))
            {
                lblSearchError.Text = "Enter a ZIP code.";
                lblSearchError.Visible = true;
                gvCrimes.DataSource = null;
                gvCrimes.DataBind();
                return;
            }

            try
            {
                var table = LoadLatestCrimesByZip(zip, 50);
                gvCrimes.DataSource = table;
                gvCrimes.DataBind();
            }
            catch (Exception ex)
            {
                lblSearchError.Text = "Error loading data: " + ex.Message;
                lblSearchError.Visible = true;
                gvCrimes.DataSource = null;
                gvCrimes.DataBind();
            }
        }

        // Filters Crime data by ZIP code and returns a data table of the latest crimes for that ZIP, limited to maxRows
        private DataTable LoadLatestCrimesByZip(string zip, int maxRows)
        {
            if (!File.Exists(CrimesCsvPath))
                throw new FileNotFoundException("Crimes CSV not found at " + CrimesCsvPath);

            using (var sr = new StreamReader(CrimesCsvPath))
            {
                string headerLine = sr.ReadLine();
                if (string.IsNullOrEmpty(headerLine))
                    return new DataTable();

                var headers = ParseCsvLine(headerLine);

                int idxOccurredOn = Array.FindIndex(headers, h => string.Equals(h, "OCCURRED ON", StringComparison.OrdinalIgnoreCase));
                int idxCrime = Array.FindIndex(headers, h => string.Equals(h, "UCR CRIME CATEGORY", StringComparison.OrdinalIgnoreCase) ||
                                                             string.Equals(h, "UCR CRIME", StringComparison.OrdinalIgnoreCase));
                int idxAddress = Array.FindIndex(headers, h => string.Equals(h, "100 BLOCK ADDR", StringComparison.OrdinalIgnoreCase) ||
                                                               string.Equals(h, "100 BLOCK ADDRESS", StringComparison.OrdinalIgnoreCase) ||
                                                               string.Equals(h, "100 BLOCK ADDR ", StringComparison.OrdinalIgnoreCase) ||
                                                               string.Equals(h, "100 BLOCK ADDR", StringComparison.OrdinalIgnoreCase));
                int idxZip = Array.FindIndex(headers, h => string.Equals(h, "ZIP", StringComparison.OrdinalIgnoreCase) ||
                                                           string.Equals(h, "ZIPCODE", StringComparison.OrdinalIgnoreCase));

                var records = new List<CrimeRecord>();

                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    var row = ParseCsvLine(line);
                    if (row.Length == 0) continue;

                    string rowZip = idxZip >= 0 && idxZip < row.Length ? (row[idxZip] ?? string.Empty).Trim() : string.Empty;
                    if (!string.Equals(rowZip, zip, StringComparison.OrdinalIgnoreCase))
                        continue;

                    DateTime dt = DateTime.MinValue;
                    if (idxOccurredOn >= 0 && idxOccurredOn < row.Length)
                    {
                        DateTime.TryParse(row[idxOccurredOn], CultureInfo.InvariantCulture, DateTimeStyles.AssumeLocal, out dt);
                    }

                    string crimeType = idxCrime >= 0 && idxCrime < row.Length ? row[idxCrime] : string.Empty;
                    string address = idxAddress >= 0 && idxAddress < row.Length ? row[idxAddress] : string.Empty;

                    records.Add(new CrimeRecord
                    {
                        OccurredOn = dt,
                        Crime = crimeType ?? string.Empty,
                        Address = address ?? string.Empty,
                        Zipcode = rowZip ?? string.Empty
                    });
                }

                // order by OccurredOn desc, take maxRows
                var top = records.OrderByDescending(r => r.OccurredOn).ThenBy(r => r.Crime).Take(maxRows).ToList();

                var dtRes = new DataTable();
                dtRes.Columns.Add("OccurredOn", typeof(DateTime));
                dtRes.Columns.Add("Crime", typeof(string));
                dtRes.Columns.Add("Address", typeof(string));
                dtRes.Columns.Add("Zipcode", typeof(string));

                foreach (var r in top)
                {
                    var dr = dtRes.NewRow();
                    dr["OccurredOn"] = r.OccurredOn == DateTime.MinValue ? (object)DBNull.Value : r.OccurredOn;
                    dr["Crime"] = r.Crime;
                    dr["Address"] = r.Address;
                    dr["Zipcode"] = r.Zipcode;
                    dtRes.Rows.Add(dr);
                }

                return dtRes;
            }
        }

        // Parses a CSV line into list, handling quoted values
        private string[] ParseCsvLine(string line)
        {
            if (line == null) return new string[0];
            var values = new List<string>();
            bool inQuotes = false;
            var current = new System.Text.StringBuilder();

            for (int i = 0; i < line.Length; i++)
            {
                char c = line[i];

                if (c == '\"')
                {
                    if (inQuotes && i + 1 < line.Length && line[i + 1] == '\"')
                    {
                        current.Append('\"');
                        i++;
                    }
                    else
                    {
                        inQuotes = !inQuotes;
                    }
                }
                else if (c == ',' && !inQuotes)
                {
                    values.Add(current.ToString());
                    current.Clear();
                }
                else
                {
                    current.Append(c);
                }
            }

            values.Add(current.ToString());
            return values.ToArray();
        }

        private class CrimeRecord
        {
            public DateTime OccurredOn { get; set; }
            public string Crime { get; set; }
            public string Address { get; set; }
            public string Zipcode { get; set; }
        }
    }
}