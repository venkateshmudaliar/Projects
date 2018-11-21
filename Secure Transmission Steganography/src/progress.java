import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.lang.reflect.*;

/*<applet code="progress" width=800 height=500>
</applet>*/

public class progress extends JFrame
{
 static JFrame f;
 public void prog()throws Exception 
   {
    f=new JFrame();
     
    ImageIcon ii=new ImageIcon("first1.jpg");
    JLabel l=new JLabel("progress",ii,JLabel.LEFT);
    l.setBounds(0,0,800,570);

    final JProgressBar aJProgressBar = new JProgressBar(20, 70);
    final JButton aJButton = new JButton("Start");
    Thread stepper = new BarThread(aJProgressBar);
    stepper.start();

    f.getContentPane().setLayout(null);
    f.getContentPane().add(l);
    f.getContentPane().add(aJProgressBar);
    f.show();
    f.setSize(800,580);
    f.setVisible(true);
    f.setResizable(false);
    try
    {
    Thread.sleep(2900);
    f.dispose();
    }
    catch(Exception e)
    {
     System.out.println(e);
    }
  }
 static class BarThread extends Thread 
  {
    private static int DELAY = 50;
    JProgressBar progressBar;

    public BarThread(JProgressBar bar)
    {
      progressBar = bar;
      
    }

    public void run()
    {
      int minimum = progressBar.getMinimum();
      int maximum = progressBar.getMaximum();
      Runnable runner = new Runnable()
       {
        public void run()
         {
          int value = progressBar.getValue();
          progressBar.setValue(value+1);

          progressBar.setSize(300,30);
          progressBar.setLocation(385,443);
          
         }
       };
      for (int i=minimum; i<maximum; i++)
       {
        try
         {
          SwingUtilities.invokeAndWait(runner);
                  // Our task for each step is to just sleep
          Thread.sleep(DELAY);
         
         }
        catch (InterruptedException ignoredException)
         {}
         catch (InvocationTargetException ignoredException)
          {}
       }
      
     }
      
    }
}
