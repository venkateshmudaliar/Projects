import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*;
public class menu extends JFrame implements ActionListener
{ 
   JMenuItem it1,it2,it3,it4,it5,it6,it7,it8,it9;
   Calendar d=Calendar.getInstance();
   JLabel dl=new JLabel(" ",JLabel.LEFT);
   int day,mon,yr;
   String dt;
int x;
   
   public menu( )throws Exception
  {
  
     progress ps=new progress();
     ps.prog();
     login l=new login();
     l.prog();

     day=d.get(Calendar.DATE);
     mon=d.get(Calendar.MONTH)+1;
     yr=d.get(Calendar.YEAR);
     dt="DATE :- "+day+"/"+mon+"/"+yr;
     dl.setText(dt);
     dl.setSize(200,25);
     dl.setLocation(600,480);
     dl.setFont(new Font("Courier",Font.BOLD,15));
     dl.setForeground(Color.black);

     Container cp=getContentPane();
     cp.setLayout(null);


    JLabel label=new JLabel("D A T A   S E C U R I T Y",SwingConstants.CENTER);
    label.setFont(new Font("Courier",Font.BOLD+Font.ITALIC,35));
    label.setForeground(Color.darkGray);
           
    label.setSize(800,60);
    label.setLocation(0,0);
    cp.add(label);

    cp.setBackground(Color.pink);
    JMenuBar bar = new JMenuBar( );
     
     bar.setSize(250,20);
     bar.setLocation(260,80);
     cp.add(bar);
     cp.add(dl);

     JMenu data = new JMenu("   DATA   ");
     data.setMnemonic(KeyEvent.VK_D);

      it1 = new JMenuItem(" CRC ");
      it1.setMnemonic(KeyEvent.VK_C);


      it2 = new JMenuItem("EMBED");
      it2.setMnemonic(KeyEvent.VK_E);

      it3 = new JMenuItem("DE-EMBED");
      it3.setMnemonic(KeyEvent.VK_D);

     
       data.add(it1);
       data.add(it2);
       data.add(it3);
                  
       it1.addActionListener(this);     
       it2.addActionListener(this);     
       it3.addActionListener(this);     
   
      JMenu utilities = new JMenu("   UTILITIES   ");
      utilities.setMnemonic(KeyEvent.VK_U);

      it4 = new JMenuItem("COMPRESS");
      it4.setMnemonic(KeyEvent.VK_O);

      it5 = new JMenuItem("DECOMPRESS");
      it5.setMnemonic(KeyEvent.VK_P);

      utilities.add(it4);
      utilities.add(it5);
      it4.addActionListener(this);     
      it5.addActionListener(this);     

     
      JMenu help = new JMenu("   HELP   ");
      help.setMnemonic(KeyEvent.VK_H);

     it6 = new JMenuItem("ABOUT");
     it6.setMnemonic(KeyEvent.VK_A);
     help.add(it6);


     it7 = new JMenuItem("CONTENTS");
     it7.setMnemonic(KeyEvent.VK_N);
     help.add(it7);

     it8 = new JMenuItem("INDEX");
     it8.setMnemonic(KeyEvent.VK_I);
     help.add(it8);

     it6.addActionListener(this);
     it7.addActionListener(this);
     it8.addActionListener(this);  

     JMenu exit=new JMenu("EXIT");
     exit.setMnemonic(KeyEvent.VK_X);

     it9 = new JMenuItem( "EXIT ");
     it9.setMnemonic(KeyEvent.VK_T);
     exit.add(it9);
     
     it9.addActionListener(new ActionListener() {
       public void actionPerformed (ActionEvent e) {
         System.exit(0);
      }
    });


     bar.add(data);
     bar.add(utilities); 
     bar.add(help);
     bar.add(exit);
  
}
  

 
public void actionPerformed(ActionEvent ae)
   {
    if(ae.getSource()==it1)
     {
       //showStatus(it1.getActionCommand());
       crc x=new crc();
       repaint();
     }

    else if(ae.getSource()==it2)
     {
       //showStatus(it2.getActionCommand());
       embed x=new embed();
       repaint();

     }
    else if(ae.getSource()==it3)
     {
       //showStatus(it3.getActionCommand());
       dembed x=new dembed();
       repaint();
     }

    else if(ae.getSource()==it4)
     {
       //showStatus(it4.getActionCommand());
       compress x=new compress();
       repaint();
     }

    else if(ae.getSource()==it5)
     {
       //showStatus(it5.getActionCommand());
       decompress x=new decompress();
       repaint();
      }
    else if(ae.getSource()==it6)
     {
      //showStatus(it6.getActionCommand());
      about();
      }

    else if(ae.getSource()==it7)
     {
      // showStatus(it7.getActionCommand());
       tables x=new tables();
       repaint();

      }

    else if(ae.getSource()==it8)
     {
      // showStatus(it8.getActionCommand());
       index x=new index();
       repaint();

      }
	   else if(ae.getSource()==it9)
     {
       //showStatus(it9.getActionCommand());
       System.exit(0);

      }

  }
public void about()
 {
  JFrame f1=new JFrame();
    final JDialog dialog = new JDialog (f1, "About...", true);
    dialog.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {dialog.dispose();}
    });
    Container cp=getContentPane();
    JLabel  lab1  = new JLabel ("SECURE VIDEO DATA HIDING", JLabel.CENTER);
    lab1.setFont(new Font("TimesRoman",Font.BOLD+Font.ITALIC,16));
    lab1.setForeground(Color.darkGray);
    JLabel  lab2  = new JLabel ("Sequence of Modules Action", JLabel.CENTER);
    JLabel  lab3  = new JLabel ("1.CRC Generation", JLabel.CENTER);
    JLabel  lab4  = new JLabel ("2.Compression", JLabel.CENTER);
    JLabel  lab5  = new JLabel ("3.Embedding", JLabel.CENTER);
    JLabel  lab6  = new JLabel ("4.De-Embedding", JLabel.CENTER);
    JLabel  lab7  = new JLabel ("5.De-Compression", JLabel.CENTER);
    JLabel  lab8  = new JLabel ("6.CRC Verification", JLabel.CENTER);
    
    dialog.getContentPane().setLayout(new GridLayout(5,1,0,0));
    dialog.getContentPane().add (lab1);
    dialog.getContentPane().add (lab2);
    dialog.getContentPane().add (lab3);
    dialog.getContentPane().add (lab4);
    dialog.getContentPane().add (lab5);
    dialog.getContentPane().add (lab6);
    dialog.getContentPane().add (lab7);
    dialog.getContentPane().add (lab8);
    
    
    
    
    JButton butt = new JButton ("Close");
    JPanel p=new JPanel();
    p.add (butt);
    dialog.getContentPane().add(p);
    butt.addActionListener (new ActionListener () {
      public void actionPerformed(ActionEvent e) {
        dialog.setVisible(false);
        dialog.dispose();
      }
    });
    dialog.setBounds(190,170,390,370);
    //dialog.setSize (400, 300);
    dialog.setVisible(true);
  }
  public static void main(String args[])
	{
	  try{

	      menu m=new menu();
	      m.setSize(800,600);
	      m.setVisible(true);
	  }catch(Exception eas)
		{
		  System.out.println(eas);
		}
	}
 }


