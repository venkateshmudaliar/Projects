import java.io.*;
import javax.swing.*;
import java.awt.*;
import java.applet.Applet.*;
import javax.swing.table.*;
import java.awt.event.*;
import javax.swing.event.*;


class embed extends JFrame implements ActionListener
{

  JLabel tf=new JLabel("");
  JLabel imf=new JLabel("");
  JLabel dfile=new JLabel("");
  JLabel scene=new JLabel("");
   JButton b1,b2,b3,b4;
   JFrame f=new JFrame();
   JPanel p0,p1,p2,p3,p4,p5;
   JLabel l1=new JLabel();
   JLabel l2=new JLabel();
       
 public embed()
 {

  JLabel l1,l2,l3,l4,l5; 


   f.setTitle("embed");
   
   f.setBounds(120,100,540,430);
   f.setResizable(false);

    ImageIcon ii=new ImageIcon("data1.jpg");
    JLabel dfile=new JLabel("",ii,JLabel.LEFT);
    ImageIcon jj=new ImageIcon("pic.jpg");
    JLabel scene=new JLabel("",jj,JLabel.RIGHT);


   p0=new JPanel();
   p1=new JPanel();
   p2=new JPanel();
   p3=new JPanel();
   p4=new JPanel();
   p5=new JPanel();

   p0.setBackground(Color.darkGray);
   p1.setBackground(Color.gray);
   p2.setBackground(Color.gray);
   p3.setBackground(Color.gray);
   p4.setBackground(Color.gray);
   p5.setBackground(Color.gray);
   p0.setLayout(new FlowLayout(FlowLayout.LEFT,0,0));
   p1.setLayout(new FlowLayout(FlowLayout.CENTER,15,10));
   p3.setLayout(new FlowLayout(FlowLayout.LEFT,40,40));
   p2.setLayout(new FlowLayout(FlowLayout.CENTER,20,10));
   p5.setLayout(new FlowLayout(FlowLayout.LEFT,40,0));

   l1=new JLabel("Text File",JLabel.LEFT);
   l1.setForeground(Color.black);
   l1.setFont(new Font("TimesRoman",Font.BOLD,20));

   l2=new JLabel("Image/video File",JLabel.LEFT);
   l2.setForeground(Color.black);
   l2.setFont(new Font("TimesRoman",Font.BOLD,20));

   l3=new JLabel("EMBED",JLabel.LEFT);
   l3.setForeground(Color.lightGray);
   l3.setBackground(Color.darkGray);
   l3.setFont(new Font("TimesRoman",Font.BOLD,30));

   l4=new JLabel("Selected Text File  :-",JLabel.LEFT);
   l4.setForeground(Color.black);
   l4.setFont(new Font("chari",Font.BOLD,15));

   l5=new JLabel("Selected Image/Video File :-",JLabel.LEFT);
   l5.setForeground(Color.black);
   l5.setFont(new Font("chari",Font.BOLD,15));

   tf.setForeground(Color.black);
   tf.setFont(new Font("TimesRoman",Font.BOLD,15));
   imf.setForeground(Color.black);
   imf.setFont(new Font("TimesRoman",Font.BOLD,15));

   b1=new JButton("CHOOSE..."); 
   b2=new JButton("CHOOSE...");
   b3=new JButton(" EMBED ");
   b4=new JButton("CANCEL");
   b1.addActionListener(this);   
   b2.addActionListener(this);
   b3.addActionListener(this);
   b4.addActionListener(this);   
   

   
   p1.add(l1);
   p1.add(b1);
   p1.add(l2);
   p1.add(b2);
   
   p2.add(dfile);
   p2.add(b3);
   p2.add(b4);
   p2.add(scene);
   p3.add(l4);
   p3.add(tf);
   p5.add(l5);
   p5.add(imf);

   p4.setLayout(new GridLayout(4,1,0,0));
   p4.add(p1);
   p4.add(p2);
   p4.add(p3);
   p4.add(p5);
   p0.add(l3);
  

   f.getContentPane().add(p0,BorderLayout.NORTH);
   f.getContentPane().add(p4,BorderLayout.CENTER);
   f.show();
 }
public void actionPerformed(ActionEvent ae)
   {
     JFrame jp;
     String m1,m2;
     m1=new String();
     m2=new String();
     jp=new JFrame();

     FileDialog fd=new FileDialog(jp,"fd",FileDialog.LOAD);
     fd.setFile("*.cmp;");
     FileDialog fd1=new FileDialog(jp,"fd",FileDialog.LOAD);
     fd1.setFile("*.gif;*.jpg;*.bmp;*.avi");
     if(ae.getSource()==b1)
     {
     fd.setVisible(true);
     l1.setText(fd.getFile());
      //tf.setText(fd.getDirectory()+fd.getFile());
     tf.setText(fd.getFile());
     }
     else if(ae.getSource()==b2)
     {
     fd1.setVisible(true);
     l2.setText(fd1.getFile());
     fd1.getFile();
     imf.setText(fd1.getDirectory()+fd1.getFile());
     }
     if(ae.getSource()==b3)
     {
     try
     {
      m1=l1.getText();
      m2=l2.getText();
      emb(m2,m1);
      }catch(Exception e){}
     }
     else if(ae.getSource()==b4)
     { f.setVisible(false);
     f.dispose();
     }
    }
public static String encrypt(String msg)
{
    byte str[]=msg.getBytes();
    for(int i=0; i<str.length; i++) 
    str[i]=(byte)(str[i]+128);
    return new String(str);
    
}
public static String decrypt(String msg)
{
    byte str[]=msg.getBytes();
    for(int i=0; i<str.length; i++)
    str[i]=(byte)(str[i]-128);
    return new String(str);
}
public static void emb(String imgfilename, String datfilename) 
{
 try
 {
	File file1=new File(imgfilename);
        File file2=new File(datfilename);
       // System.out.println("img"+imgfilename);
        //System.out.println("dat"+datfilename);
        
        FileInputStream fin=new FileInputStream(imgfilename);
        FileOutputStream fout=new FileOutputStream("temp");	


        final int bsize=8;
        byte buffer[]=new byte[bsize];
        int nbytes,nb=0;
        while((nbytes=fin.read(buffer,0,bsize))>0) {
          fout.write(buffer,0,nbytes);
          nb=nbytes;
        }
        fin.close();

	for(int i=1; i<=8-nb; i++)
          fout.write(65);

        fout.write("DATAFILE".getBytes(),0,8);
        StringBuffer sb=new StringBuffer(file2.getName());
        sb.setLength(50);
        fout.write(sb.toString().getBytes(),0,50);

	fin=new FileInputStream(datfilename);
        while((nbytes=fin.read(buffer,0,bsize))>0) {
          fout.write(buffer,0,nbytes);
        
        }
        fin.close();
        fout.close();

        file1.delete();
	File file=new File("temp");
        file.renameTo(file1);
        est();
 }catch(Exception e){e.printStackTrace();}
        
   }
public static void est()
 {
  JFrame f1=new JFrame();
    final JDialog dialog = new JDialog (f1, "STATUS...", true);
    dialog.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {dialog.dispose();}
    });
    String s=new String();
   
    s= "DATA EMBEDDED SUCCESSFULLY";
    JLabel  lab1  = new JLabel ("E M B E D   S T A T U S", JLabel.CENTER);
    lab1.setFont(new Font("TimesRoman",Font.BOLD+Font.ITALIC,17));
    JLabel  lab2  = new JLabel (s, JLabel.CENTER);
    lab2.setFont(new Font("TimesRoman",Font.BOLD+Font.ITALIC,12));

    dialog.getContentPane().setLayout(new GridLayout(3,1,0,0));
    dialog.getContentPane().add (lab1);
    dialog.getContentPane().add (lab2);
    
    JButton butt = new JButton ("Close");
  
    JPanel p=new JPanel();
    p.add (butt);
    dialog.getContentPane().add(p);
    butt.addActionListener (new ActionListener () 
    {
      public void actionPerformed(ActionEvent e)
      {
        dialog.setVisible(false);
        dialog.dispose();
      }
    });
    dialog.setBounds(400,300,700,500);
    dialog.setSize (300, 200);
    dialog.setVisible(true);
  }

}
