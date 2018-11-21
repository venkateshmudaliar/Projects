import java.util.*;
import java.awt.*;
import java.io.*;
import java.awt.event.*;
import javax.swing.*;
public class index extends JPanel implements ActionListener
{
  JTextField tf;
  JFrame f=new JFrame("index");
  JPanel p=new JPanel();
  JPanel lp=new JPanel();
  JLabel l,l1;
  JButton b1,b2;
  JTextArea ta;
  char[] data;
 
public  index()
 {

  p.setBackground(Color.gray);
  f.setResizable(false);
  p.setLayout(null);
  lp.setLayout(null);
  l1=new JLabel("INDEX",JLabel.LEFT);
  lp.setSize(800,30);
  lp.setLocation(0,0);
  l1.setForeground(Color.lightGray);
  l1.setFont(new Font("TimesRoman",Font.BOLD,30));
  l1.setSize(150,30);
  l1.setLocation(0,0);

  f.setBounds(120,100,540,450);
  l=new JLabel("Page no:");
  l.setSize(75,20);
  l.setLocation(15,45);
  l.setForeground(Color.black);
  lp.setBackground(Color.darkGray);
  lp.add(l1);
  p.add(lp);
  p.add(l);

  tf=new JTextField();
  tf.setSize(30,30);
  tf.setLocation(85,45);
  p.add(tf);
  
  b1=new JButton("  G O  ");
  b1.setSize(85,30);
  b1.setLocation(400,200);
  b1.addActionListener(this);
  p.add(b1);
   
  ta=new JTextArea();
  JScrollPane pane = new JScrollPane (ta);
  pane.setSize(300,300);
  pane.setLocation(67,100);               
 // p.add(ta);
  p.add(pane);


  b2=new JButton("CANCEL");
  b2.setSize(85,30);
  b2.setLocation(400,250);
  p.add(b2);
  
  f.getContentPane().add(p,BorderLayout.CENTER);
f.setVisible(true);
  f.show();
  b2.addActionListener(new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
           {
              f.dispose();
           }
      }); 


  }
public void actionPerformed(ActionEvent ae) 
   {
     char[] data;
     if(ae.getSource()==b1)
     {
      String a=new String();
      a=tf.getText(); 
        if(a.equals("1"))
        { 
        try
        {
        File f1=new File("intro.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }
        if(a.equals("2"))
        { 
        try{
        File f1=new File("emb.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }
        if(a.equals("3"))
        { 
        try{
        File f1=new File("demb.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }
        if(a.equals("4"))
        { 
        try{
        File f1=new File("crc.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }

        if(a.equals("5"))
        { 
        try{
        File f1=new File("crcg.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }
        if(a.equals("6"))
        { 
        try{
        File f1=new File("crcv.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }

        if(a.equals("7"))
        { 
        try{
        File f1=new File("compr.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }
        if(a.equals("8"))
        { 
        try{
        File f1=new File("decompr.txt");
        FileReader fin = new FileReader (f1);
        int filesize = (int)f1.length();
        data = new char[filesize];
        fin.read (data, 0, filesize);
        ta.setText (new String (data));
            }
        catch(Exception ex)
            {System.out.println(ex);}

          }



      }
    }
}
