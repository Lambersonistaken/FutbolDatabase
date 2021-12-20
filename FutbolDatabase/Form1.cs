using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FutbolDatabase
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=FutbolDB; user ID=postgres; password=2001");
        private void btnListele_Click(object sender, EventArgs e)
        {

            string sorgu = "SELECT * FROM \"Takım\"";
            NpgsqlDataAdapter DA = new NpgsqlDataAdapter(sorgu,baglanti);
            DataSet ds = new DataSet();
            DA.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("INSERT INTO \"TakimBaskani\" (\"TakimBaskaniID\",\"BaskanAdi\",\"BaskanSoyadi\") values(@p1,@p2,@p3)",baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(baskanIdText.Text));
            komut1.Parameters.AddWithValue("@p2", baskanAdiText.Text);
            komut1.Parameters.AddWithValue("@p3", baskanSoyadiText.Text);
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Ekleme işlemi başarı ile gerçekleşti");    


        }

        private void baskanListele_Click(object sender, EventArgs e)
        {
            string sorgu = "SELECT * FROM \"TakimBaskani\"";
            NpgsqlDataAdapter DA = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            DA.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("DELETE FROM \"TakimBaskani\" WHERE \"TakimBaskaniID\"=@p1",baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(baskanIdText.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Silme İşlemi Gerçekleşti");
        }

        private void btnGüncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("UPDATE \"TakimBaskani\" SET \"BaskanAdi\"=@p1, \"BaskanSoyadi\" =@p2 WHERE \"TakimBaskaniID\"=@p3",baglanti);
            komut3.Parameters.AddWithValue("@p1",baskanAdiText.Text);
            komut3.Parameters.AddWithValue("@p2",baskanSoyadiText.Text);
            komut3.Parameters.AddWithValue("@p3", int.Parse(baskanIdText.Text));
            komut3.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Güncelleme Başarılı");

        }
    }
}
