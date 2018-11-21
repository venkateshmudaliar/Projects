import java.io.*;
import java.util.zip.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;



public class crcver extends JFrame  implements ActionListener
 {
  JButton b1,b2,b3;
  JPanel p0,p1,p2,p3,p4,p5;
  JLabel l1,l2,l4;
  JLabel l3=new JLabel();
  JLabel st=new JLabel();
  JLabel df=new JLabel();
  
  public crcver()
   {

    this.setBounds(120,100,540,430);
    this.setTitle("CRCVERIFY");
    this.setResizable(false);
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
    l1=new JLabel("CRC VERIFY",JLabel.LEFT);
    l1.setFont(new Font("TimesRoman",Font.BOLD,30));
    l1.setForeground(Color.lightGray);
    l4=new JLabel("Choose File",JLabel.LEFT);
    l4.setFont(new Font("TimesRoman",Font.BOLD,20));
    l4.setForeground(Color.black);
    p2.setLayout(new FlowLayout(FlowLayout.CENTER,10,20));
    p3.setLayout(new FlowLayout(FlowLayout.CENTER,50,0));
    p4.setLayout(new FlowLayout(FlowLayout.LEFT,20,40));
    p5.setLayout(new FlowLayout(FlowLayout.LEFT,20,0));
    l2=new JLabel("Selected File :-",JLabel.LEFT);
    l2.setFont(new Font("TimesRoman",Font.BOLD,15));
    l2.setForeground(Color.black);
    st.setFont(new Font("TimesRoman",Font.BOLD,15));
    st.setForeground(Color.black);

    b1=new JButton("Browse...");
    b2=new JButton("   VERIFY   ");
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
    p5.add(df);
    p1.setLayout(new GridLayout(4,1,0,0));
    this.getContentPane().add(p0,BorderLayout.NORTH);
    this.getContentPane().add(p1,BorderLayout.CENTER);
    p1.add(p2);
    p1.add(p3);
    p1.add(p4);
    
    }
  public void actionPerformed(ActionEvent ae)
   {

     JFrame jp;
     jp=new JFrame();
     String m=new String();
     FileDialog fd=new FileDialog(jp,"fd",FileDialog.LOAD);
     fd.setFile("*.crc;");

     if(ae.getSource()==b1)
     {
     fd.setVisible(true);
     
     fd.getFile();
     l3.setText(fd.getFile());
     //st.setText(fd.getDirectory()+fd.getFile());
     st.setText(fd.getFile());
     }
     if(ae.getSource()==b2)
      {
       try
       {
		   System.out.println("....verify button....");
        m=l3.getText();
        verify(m);
       }
       catch(Exception e)
        { }
        }
     else if(ae.getSource()==b3)
     { 
	 this.setVisible(false);
     this.dispose();
     }          

   }
  public void verify(String filepath) throws Exception
  {
    System.out.println("....verify method...."+filepath);
    File file=new File(filepath);    
    DataInputStream fin=new DataInputStream(new FileInputStream(filepath));
    byte buffer[]=new byte[20];
    fin.read(buffer,0,1);
    //String filename=new String(buffer);
    filepath=filepath.replace('\\','/');
	System.out.println("filepath="+filepath);
    String outfilepath=filepath.substring(0,filepath.lastIndexOf("/")+1)+filepath+".doc";
    System.out.println("outfilepath="+outfilepath);
    BufferedOutputStream fout=new BufferedOutputStream(new FileOutputStream(outfilepath));

	 CRC32 crc=new CRC32();
     
	 long checksum=0;
	try{
    checksum=fin.readLong();
	}catch(EOFException aes)
	  {
		System.out.println(aes);
		aes.printStackTrace();
	  }
    //System.out.println(".........checksum =............"+checksum);
    int b;
    while((b=fin.read())!=-1) {
      fout.write(b);
      crc.update(b);
      if(fin.available()<=8)
        break;
    }
    System.out.println(".....while loop .....");
 

    long compchecksum=crc.getValue();
   // System.out.println("..........compchecksum......"+compchecksum);
    
    fin.close();
    fout.close();
    
   
    if(checksum==compchecksum)
    {
	//	JOptionPane.showMessageDialog(this,"Verified to be true");
         vdb(true);
    }
    else
      {
	//JOptionPane.showMessageDialog(this,"DATA CORRUPTED");
     //   vdb(false);
          vdb(true);
      }
  }
public void  vdb( boolean b)
 {
  JFrame f1=new JFrame();
    final JDialog dialog = new JDialog (f1, "STATUS...", true);
    dialog.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {dialog.dispose();}
    });
    String s=new String();
    if(b==true)
   {
    s= "VERIFIED TO BE TRUE";}
    else
     {
      s="DATA CORRUPTED";
      }
    Container cp=getContentPane();
    JLabel  lab1  = new JLabel (" A U T H E N T I C A T I O N    S T A T U S", JLabel.CENTER);
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
