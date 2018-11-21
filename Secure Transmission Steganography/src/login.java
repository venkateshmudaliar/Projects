import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class login extends JFrame implements ActionListener
{
static JFrame f;
JLabel l1,l2,errorLabel;
JTextField tf1;
JPasswordField tf2;
JButton b1,b2;
int x;

public int prog() throws Exception
{
x=0;
f=new JFrame();
l1=new JLabel("User name:");
l2=new JLabel("pwd");
errorLabel = new JLabel("");
tf1=new JTextField(10);
tf2=new JPasswordField(10);
b1=new JButton("Sign in");
b2=new JButton("cancel");
l1.setBounds(50,50,100,25);
tf1.setBounds(175,50,100,25);
l2.setBounds(50,100,100,25);

tf2.setBounds(175,100,100,25);
errorLabel.setBounds(50,200,200,200);
b1.setBounds(50,150,100,20);
b2.setBounds(175,150,100,20);
b1.addActionListener(this);
b2.addActionListener(this);
f.getContentPane().setLayout(null);
f.getContentPane().add(l1);
f.getContentPane().add(tf1);
f.getContentPane().add(l2);
f.getContentPane().add(tf2);
f.getContentPane().add(b1);
f.getContentPane().add(b2);
f.getContentPane().add(errorLabel);

f.show();
f.setSize(400,500);
f.setVisible(true);
f.setResizable(false);
while(x<=0)
{
if (x>0)
{
return x;
}

}
return 0;
}

public static void main(String args[]) throws Exception
{
login l=new login();
l.prog();
}

public void actionPerformed(ActionEvent e)
{
Connection con;
Statement stmt;
ResultSet rs;
if(e.getSource()==b2)
System.exit(0);
else
{
String uname,upwd;
uname=tf1.getText();
upwd=tf2.getText();
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:dat","stegno","stegno");
stmt=con.createStatement();
String st123;
st123="select lname from admins where lname='"+uname+"' and lpwd='"+upwd+"'";
System.out.println(st123);
rs=stmt.executeQuery(st123);
if(!rs.next())
{
con.close();
f.dispose();
x=1;
}
else
{
System.out.println("Invalid Login!");
errorLabel.setText("Invalid user name or Login");
//System.exit(0);
}
}
catch(Exception e2)
{

e2.printStackTrace();
}
}
}
}

