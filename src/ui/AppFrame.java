package ui;

import javax.swing.*;
import java.awt.*;

public class AppFrame extends JFrame {

    private JMenuBar menuBar;
    private JList<Object> viewList;
    private JPanel viewPanel;
    private JLabel console;

    public interface ViewItem {
        /**
         * @return The name to display as a view item
         */
        Object getName();

        /**
         * @return The callback to call when view item is selected
         */
        Runnable getCallback();
    }

    private ViewItem[] viewItems;

    public AppFrame() {
        super("ForgetTheDeadline");

        this.menuBar = new JMenuBar();

        // View list
        this.viewList = new JList<>();
        this.viewList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        this.viewList.addListSelectionListener(e -> onViewSelect(viewList.getSelectedIndex()));
        this.setViewItems(new ViewItem[0]);

        // View container
        this.viewPanel = new JPanel(new BorderLayout());

        // Debug status bar
        this.console = new JLabel();
        this.console.setHorizontalAlignment(SwingConstants.LEFT);

        JScrollPane listScrollPane = new JScrollPane(viewList);

        this.setJMenuBar(this.menuBar);
        this.getContentPane().add(listScrollPane, BorderLayout.LINE_START);
        this.getContentPane().add(this.viewPanel, BorderLayout.CENTER);
        this.getContentPane().add(this.console, BorderLayout.PAGE_END);
    }

    public void setViewItems(ViewItem[] viewItems) {
        Object[] viewNames = new Object[viewItems.length];
        for (int i = 0; i < viewItems.length; i++) {
            viewNames[i] = viewItems[i].getName();
        }
        this.viewList.setListData(viewNames);
        this.viewItems = viewItems;
    }

    public ViewItem makeViewItem(Object label, Component component) {
        return new ViewItem() {
            @Override
            public Object getName() {
                return label;
            }

            @Override
            public Runnable getCallback() {
                return () -> setView(component);
            }
        };
    }

    private void onViewSelect(int index) {
        this.log(String.format("%s selected", this.viewItems[index].getName()));
        this.viewItems[index].getCallback().run();
    }

    public void clearView() {
        this.viewPanel.removeAll();
        this.viewPanel.updateUI();
    }

    public void setView(Component component) {
        this.viewPanel.removeAll();
        this.viewPanel.add(new JScrollPane(component));
        this.viewPanel.updateUI();
    }

    /**
     * @param message an html or plain string
     */
    public void log(String message) {
        this.console.setText(message);
    }
}
