import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.applet.*;
import java.io.*;

class dembed extends JPanel implements ActionListener
 {
  JButton b1,b2,b3;
  JPanel p0,p1,p2,p3,p4,p5,p6;
  JLabel l1,l2,l3,l4,si,buf;
  JFrame f=new JFrame();
  static String fpath;

public dembed()
   {

   f.setTitle("DE-EMBED");
   
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

    ImageIcon jj=new ImageIcon("pic.jpg");
    JLabel scene=new JLabel("",jj,JLabel.RIGHT);
    si=new JLabel();
    si.setForeground(Color.black);
    si.setFont(new Font("TimesRoman",Font.BOLD,15));
    buf=new JLabel();
    l1=new JLabel("DE-EMBED",JLabel.LEFT);
    l1.setFont(new Font("TimesRoman",Font.BOLD,30));
    l1.setForeground(Color.lightGray);
    l4=new JLabel("Choose Image/Video File",JLabel.LEFT);
    l4.setFont(new Font("TimesRoman",Font.BOLD,20));
    l4.setForeground(Color.black);
    p2.setLayout(new FlowLayout(FlowLayout.CENTER,30,20));
    p3.setLayout(new FlowLayout(FlowLayout.CENTER,50,0));
    p4.setLayout(new FlowLayout(FlowLayout.LEFT,20,40));
    p5.setLayout(new FlowLayout(FlowLayout.LEFT,20,0));
    l2=new JLabel("Selected Image/Video File :-",JLabel.LEFT);
    l2.setFont(new Font("TimesRoman",Font.BOLD,15));
    l2.setForeground(Color.black);
    l3=new JLabel();
    l3.setFont(new Font("TimesRoman",Font.BOLD,15));
    l3.setForeground(Color.black);
    b1=new JButton("Browse...");
    b2=new JButton("DEMBED");
    b3=new JButton(" CANCEL ");
    b1.addActionListener(this);
    b2.addActionListener(this);
    b3.addActionListener(this);

    p0.add(l1);
    p2.add(l4);
    p2.add(b1);
    p3.add(scene);
    p3.add(b2);
    p3.add(b3);
    p4.add(l2);
    p4.add(si);
    p5.add(l3);
    p1.setLayout(new GridLayout(4,1,0,0));
    f.getContentPane().add(p0,BorderLayout.NORTH);
    p1.add(p2);
    p1.add(p3);
    p1.add(p4);
    p1.add(p5);
    f.getContentPane().add(p1,BorderLayout.CENTER);
   f.show();    
    }

public void actionPerformed(ActionEvent ae)
   {
     JFrame jp;
     jp=new JFrame();
    
     String m=new String();
      m=null;
     FileDialog fd=new FileDialog(jp,"fd",FileDialog.LOAD);
     fd.setFile("*.gif;*.bmp;*.jpeg;*.jpg;*.avi;");
     if(ae.getSource()==b1)
     {
     fd.setVisible(true);
     fd.getFile();
      //si.setText(fd.getDirectory()+fd.getFile());
     si.setText(fd.getFile());
      buf.setText(fd.getFile());
     }
     if(ae.getSource()==b2)
     {
      try{
          m=(String)buf.getText();
          demb(m);
         }

         catch(Exception e)
         {
          System.out.println(e);
         }
     }
     else if(ae.getSource()==b3)
     {
      f.setVisible(false);
      f.dispose();
     }

  }

public static String change(String msg)
{
    byte str[]=msg.getBytes();
    for(int i=0; i<str.length; i++) 
    str[i]=(byte)(str[i]+128);
    return new String(str);
}
public static String rechange(String msg)
{
    byte str[]=msg.getBytes();
    for(int i=0; i<str.length; i++)
    str[i]=(byte)(str[i]-128);
    return new String(str);
}

public static void demb(String filename)
{
    try{ 
        File file=new File(filename);
        FileInputStream fin=new FileInputStream(filename);
	int bsize=8;
	byte buffer[]=new byte[bsize];
        int nbytes;
        
	String s="";
        while((nbytes=fin.read(buffer,0,bsize))>0)
        {
          s=new String(buffer);
          if(s.equals("DATAFILE"))
            break;
        }

        if(!s.equals("DATAFILE"))
        {
          vdb(false);
          fin.close();
          return;
        }

        buffer=new byte[50];
        fin.read(buffer,0,50);
        s=new String(buffer);
        String datfilename=s.trim();
      
        fpath=datfilename.substring(0,datfilename.lastIndexOf(".")+1) + "cmp";
        FileOutputStream fout=new FileOutputStream(fpath);
	bsize=1024*20;
        buffer=new byte[bsize];
 	while((nbytes=fin.read(buffer,0,bsize))>0)
        {
	  fout.write(buffer,0,nbytes);
	}
        fin.close();
        fout.close();
        vdb(true);
        }catch(Exception ex)
         {System.out.println(ex);
         }

    }

public static void vdb( boolean b)
 {
  JFrame f1=new JFrame();
    final JDialog dialog = new JDialog (f1, "STATUS...", true);
    dialog.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {dialog.dispose();}
    });
    String s=new String();
    if(b==true)
   {
    s= "DATA FILE EXTRACTED AND SAVED AS : "+fpath;}
    else
     {
      s="NO DATA FILE EMBEDDED";
      }
    JLabel  lab1  = new JLabel (" D E - E M B E D   S T A T U S", JLabel.CENTER);
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
    dialog.setBounds(400,300,750,500);
    dialog.setSize (350, 200);
    dialog.setVisible(true);
  }


}

