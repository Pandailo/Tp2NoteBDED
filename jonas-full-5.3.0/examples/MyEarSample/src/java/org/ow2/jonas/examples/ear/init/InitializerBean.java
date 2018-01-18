package org.ow2.jonas.examples.ear.init;

import javax.annotation.security.RunAs;
import javax.ejb.EJB;
import javax.ejb.Remote;
import javax.ejb.Stateless;

import org.ow2.jonas.examples.ear.entity.Author;
import org.ow2.jonas.examples.ear.entity.Book;
import org.ow2.jonas.examples.ear.reader.LocalReader;
import org.ow2.jonas.examples.ear.writer.LocalWriter;

/**
 * The {@link InitializerBean} EJB is here to initialize only once
 * the Database/Entities. It simply checks if there is some {@link Author}s
 * already persisted; if none are found, we will inject defaults values.
 * @author Guillaume Sauthier
 */
@Stateless(mappedName="myInitializerBean")
@Remote(Initializer.class)
@RunAs("earsample")
public class InitializerBean implements Initializer {

    /**
     * Injected reference to the {@link org.ow2.jonas.examples.ear.writer.Writer} EJB.
     */
    @EJB
    private LocalWriter writer;

    /**
     * Injected reference to the {@link org.ow2.jonas.examples.ear.reader.Reader} EJB.
     */
    @EJB
    private LocalReader reader;

    /**
     * Initialize the minimal set of entities needed by the sample.
     * @see org.ow2.jonas.examples.ear.init.Initializer#initializeEntities()
     */
    public void initializeEntities() {

        if (reader.findAuthor("Honore de Balzac") == null) {
            // Balzac was not persited, add it now.
            Author balzac = new Author("Honore de Balzac");
            Book pereGloriot = new Book("Le Pere Goriot", balzac);
            balzac.getBooks().add(pereGloriot);
            Book lesChouans = new Book("Les Chouans", balzac);
            balzac.getBooks().add(lesChouans);

            // Persists the Author and all of his books
            writer.addAuthor(balzac);
        }

        if (reader.findAuthor("Victor Hugo") == null) {
            // Hugo was not persited, add it now.
            Author hugo = new Author("Victor Hugo");
            hugo.addBook("Les Miserables");
            hugo.addBook("Notre-Dame de Paris");

            // Store
            writer.addAuthor(hugo);
        }
    }

}
