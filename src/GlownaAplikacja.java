import java.awt.GridLayout;
import java.awt.GraphicsEnvironment;
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
        if (GraphicsEnvironment.isHeadless()) {
            System.err.println("Nie można otworzyć okna: Java nie ma dostępu do ekranu graficznego (X11/XWayland).\n"
                    + "Uruchom program w sesji graficznej i sprawdź, czy zmienna DISPLAY jest ustawiona.\n"
                    + "W IntelliJ IDEA uruchom projekt lokalnie na komputerze z pulpitem, a nie w terminalu/środowisku headless.");
            System.exit(1);
        }

        SwingUtilities.invokeLater(() -> {
            OknoKolory okno = new OknoKolory();
            okno.setVisible(true);
        });
    }
}
