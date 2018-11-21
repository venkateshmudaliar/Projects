import java.io.*;
import java.util.zip.CRC32;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;



public class crcgen extends JFrame  implements ActionListener
 {
  JButton b1,b2,b3;
  JPanel p0,p1,p2,p3,p4,p5;
  JLabel l1,l2,l3,l4,l5,l6;
  JLabel st=new JLabel();
  JLabel df=new JLabel();
  String crcfile=new String();
  public crcgen()
   {

    this.setBounds(120,100,540,430);
    this.setTitle("crcgen");
    this.setResizable(false);
    p0=new JPanel();
    p1=new JPanel();
    p2=new JPanel();
    p3=new JPanel();
    p4=new JPanel();
    p5=new JPanel();

    l3=new JLabel();
    p0.setBackground(Color.darkGray);
    p1.setBackground(Color.gray);
     p2.setBackground(Color.gray);
      p3.setBackground(Color.gray);
       p4.setBackground(Color.gray);
        p5.setBackground(Color.gray);
    p0.setLayout(new FlowLayout(FlowLayout.LEFT,0,0));
    l1=new JLabel("CRC GENERATION",JLabel.LEFT);
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
    l5=new JLabel("Generated File :-",JLabel.LEFT);
    l5.setFont(new Font("TimesRoman",Font.BOLD,15));
    l5.setForeground(Color.black);

    l6=new JLabel();

    st.setFont(new Font("TimesRoman",Font.BOLD,15));
    st.setForeground(Color.black);

    df.setFont(new Font("TimesRoman",Font.BOLD,15));
    df.setForeground(Color.black);


    b1=new JButton("Browse...");
    b2=new JButton(" GENERATE ");
    b3=new JButton("   CANCEL   ");
   b1.addActionListener(this);
  //b1.addActionListener(new crcgen());
    
    b2.addActionListener(this);
    b3.addActionListener(this);

    p0.add(l1);
    p2.add(l4);
    p2.add(b1);
    p3.add(b2);
    p3.add(b3);
    p4.add(l2);
    p4.add(st);
    p5.add(l5);
    p5.add(df);
    p1.setLayout(new GridLayout(4,1,0,0));
    this.getContentPane().add(p0,BorderLayout.NORTH);
    this.getContentPane().add(p1,BorderLayout.CENTER);
    p1.add(p2);
    p1.add(p3);
    p1.add(p4);
    p1.add(p5);
	this.setSize(600,600);
    }
  public void actionPerformed(ActionEvent ae)
   {
     JFrame jp;
     jp=new JFrame();
     FileDialog fd=new FileDialog(jp,"fd",FileDialog.LOAD);
     fd.setFile("*.txt;*.doc;");

     String m=new String();
	 String n=new String();
     if(ae.getSource()==b1)
     {
     fd.setVisible(true);
     fd.getFile();
     l3.setText(fd.getFile());
     st.setText(fd.getDirectory()+fd.getFile());
     l6.setText(fd.getDirectory());
	 //System.out.println("........label is set...."+l3.getText());
     }
     if(ae.getSource()==b2)
      {
       try
       {
        m=l3.getText();
		n=st.getText();
		System.out.println(m+":::,::::"+n);
        generate(m,n);
       }
       catch(Exception e)
        {e.printStackTrace(); }
        }
     else if(ae.getSource()==b3)
     { 
	 this.setVisible(false);
     this.dispose();
     }

   }
  public void generate(String fp,String efp) throws Exception
  {
	 try
	 {
	  System.out.println(".....generate method...."+fp);
       File file=new File(fp);
       crcfile=fp.substring(0,fp.lastIndexOf(".")+1) + "crc";
       String filename=file.getName();
       StringBuffer sb=new StringBuffer(filename);
	//String sb=new String(filename);
   // sb.setLength(20);
	//System.out.println(".......generate middle..."+fp);
    BufferedInputStream fin=new BufferedInputStream(new FileInputStream(efp));
	//System.out.println(".......generate middle. crcfile="+crcfile);
	DataOutputStream fout=new DataOutputStream(new FileOutputStream(crcfile,true));
	//System.out.println("....calling ....CRC32......."+l6.getText()+"..."+crcfile);
    fout.write(sb.toString().getBytes());	
	//System.out.println("....After writing into the file....");
    CRC32 crc=new CRC32();
	
    df.setText(l6.getText()+crcfile);    
    int b;
    while((b=fin.read())!=-1) {
      fout.write(b);
      crc.update(b);
    }

    long checksum=crc.getValue();
    fout.writeLong(checksum);
   // System.out.println("crcgen checksum "+checksum);
    fin.close();
    fout.close();
//	 System.out.println(".....generate last line successfully....");
	  }catch(Exception aes)
	  {
		 //System.out.println(aes);
		 aes.printStackTrace();
	  }
  }
  
}
