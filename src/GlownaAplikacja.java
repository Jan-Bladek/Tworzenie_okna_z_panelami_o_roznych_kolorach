import java.awt.GridLayout;
import javax.swing.JFrame;
import javax.swing.SwingUtilities;

class OknoKolory extends JFrame {
    public OknoKolory() {
        setTitle("Panele o różnych kolorach");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(700, 450);
        setLayout(new GridLayout(2, 3));

        add(new CzerwonyPanel());
        add(new ZielonyPanel());
        add(new NiebieskiPanel());
        add(new ZoltyPanel());
        add(new PomaranczowyPanel());
        add(new FioletowyPanel());

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
