import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.applet.*;
import java.util.zip.*;
import java.io.*;


public class decompress extends JPanel  implements ActionListener
 {
  JButton b1,b2,b3;
  String m=new String();
  JPanel p0,p1,p2,p3,p4,p5;
  JLabel l1,l2,l3,l4;
  JLabel st=new JLabel();
  JLabel df=new JLabel();
  JLabel buf=new JLabel();
  JFrame f=new JFrame();
  public decompress()
   {

    f.setTitle("decompress");
    f.setBounds(120,100,540,430);
    f.setResizable(false);
    p0=new JPanel();
    p1=new JPanel();
    p2=new JPanel();
    p3=new JPanel();
    p4=new JPanel();
    p5=new JPanel();
    p0.setBackground(Color.darkGray);
     p2.setBackground(Color.gray);
      p3.setBackground(Color.gray);
       p4.setBackground(Color.gray);
        p5.setBackground(Color.gray);
    p0.setLayout(new FlowLayout(FlowLayout.LEFT,0,0));
    l1=new JLabel("DECOMPRESSION",JLabel.LEFT);
    l1.setFont(new Font("TimesRoman",Font.BOLD,30));
    l1.setForeground(Color.lightGray);
    l4=new JLabel("Choose Text File",JLabel.LEFT);
    l4.setFont(new Font("TimesRoman",Font.BOLD,20));
    l4.setForeground(Color.black);
    st.setForeground(Color.black);
    st.setFont(new Font("TimesRoman",Font.BOLD,15));
    df.setForeground(Color.black);
    df.setFont(new Font("TimesRoman",Font.BOLD,15));
    p2.setLayout(new FlowLayout(FlowLayout.CENTER,10,20));
    p3.setLayout(new FlowLayout(FlowLayout.CENTER,50,0));
    p4.setLayout(new FlowLayout(FlowLayout.LEFT,20,40));
    p5.setLayout(new FlowLayout(FlowLayout.LEFT,20,0));
    l2=new JLabel("Selected Text File :-",JLabel.LEFT);
    l2.setFont(new Font("TimesRoman",Font.BOLD,15));
    l2.setForeground(Color.black);
    l3=new JLabel("Decompressed File :-",JLabel.LEFT);
    l3.setFont(new Font("TimesRoman",Font.BOLD,15));
    l3.setForeground(Color.black);
    b1=new JButton("Browse...");
    b2=new JButton("DECOMPRESS");
    b3=new JButton("   CANCEL   ");
    b1.addActionListener(this);
    b2.addActionListener(this);
    b3.addActionListener(this);

    p0.add(l1);
    p2.add(l4);
    p2.add(b1);
    p3.add(b2);
    p3.add(b3);
    p4.add(l2);
    p4.add(st);
    p5.add(l3);
    p5.add(df);
    p1.setLayout(new GridLayout(4,1,0,0));
    f.getContentPane().add(p0,BorderLayout.NORTH);
    p1.add(p2);
    p1.add(p3);
    p1.add(p4);
    p1.add(p5);
    f.getContentPane().add(p1,BorderLayout.CENTER);
f.setVisible(true);
    f.show();
    }
 public void actionPerformed(ActionEvent ae)
   {
     JFrame jp;
     m=null;
     jp=new JFrame();
     FileDialog fd=new FileDialog(jp,"fd",FileDialog.LOAD);
     fd.setFile("*.cmp;");
    
    if(ae.getSource()==b1)
    {
     fd.setVisible(true);
     fd.getFile();
     
     //st.setText(fd.getDirectory()+fd.getFile());
     st.setText(fd.getFile());
     buf.setText(fd.getFile());
     }
    if(ae.getSource()==b2)
     {
     try
     {
      m=(String)buf.getText();
      decomp(m,mtrim(m));
      df.setText(mtrim(m));
     }
      catch(Exception e)
       {System.out.print(e);}
     }
     else if(ae.getSource()==b3)
     {
      f.setVisible(false);
      f.dispose();
     }

    }
   String mtrim(String s1)
    {
      int l=s1.length();
      int k=l-3;
      return(s1.substring(0,k)+"crc");
    }
     

 public void decomp(String srcfile, String dstfile) throws IOException
 {
    BufferedInputStream fin=new BufferedInputStream(
                                new GZIPInputStream(
                                    new FileInputStream(srcfile)));

    BufferedOutputStream fout=new BufferedOutputStream(
                                    new FileOutputStream(dstfile));

    int b;
    while((b=fin.read())!=-1)
      fout.write(b);

    fin.close();
    fout.close();
  }
 
}
