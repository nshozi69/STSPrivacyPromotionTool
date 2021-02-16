using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrivacyRiskAssessmentTool.Models;

namespace PrivacyRiskAssessmentTool.Controller
{
    public class DataAccessLayer
    {
        private void GetFactorLevels()
        {
            List<model_factorslevels> factorlevels = new List<model_factorslevels>();
            string constr = ConfigurationManager.ConnectionStrings["myDatabaseConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT LevelName, LevelValue FROM tbl_factorlevels";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            factorlevels.Add(new model_factorslevels
                            {
                                levelname = sdr["LevelName"].ToString(),
                                levelvalue = sdr["LevelValue"].ToString()
                            });
                        }
                    }
                    con.Close();
                }
            }

        }

        private void GetFactors()
        {
            List<model_factors> factors = new List<model_factors>();
            string constr = ConfigurationManager.ConnectionStrings["myDatabaseConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT FactorName, FactorNode FROM tbl_factors";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            factors.Add(new model_factors
                            {
                                factorname = sdr["FactorName"].ToString(),
                                factornode = sdr["FactorNode"].ToString()
                            });
                        }
                    }
                    con.Close();
                }
            }

        }

        private void GetNodes()
        {
            List<model_stsnodes> nodes = new List<model_stsnodes>();
            string constr = ConfigurationManager.ConnectionStrings["myDatabaseConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT NodesName FROM tbl_stsnodes";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            nodes.Add(new model_stsnodes
                            {
                                nodesname = sdr["NodesName"].ToString()
                            });
                        }
                    }
                    con.Close();
                }
            }

        }
    }
}
