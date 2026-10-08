import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.SwingUtilities;

class OknoKolory extends JFrame {
    public OknoKolory() {
        setTitle("Panele o różnych kolorach");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(200, 400);
        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));

        add(new CzerwonyPanel());
        add(new ZielonyPanel());
        add(new NiebieskiPanel());
        add(new ZoltyPanel());

        setLocationRelativeTo(null);
    }
}

public class GlownaAplikacja {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            OknoKolory okno = new OknoKolory();
            okno.setVisible(true);
        });
    }
}
