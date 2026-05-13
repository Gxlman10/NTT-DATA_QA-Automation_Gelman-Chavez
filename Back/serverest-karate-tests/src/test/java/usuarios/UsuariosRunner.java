package usuarios;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Tag;

@Tag("usuarios")
class UsuariosRunner {

    // mvn test                                         → todos los escenarios
    // mvn test -Dkarate.options="--tags @smoke"        → happy path por endpoint
    // mvn test -Dkarate.options="--tags @negativo"     → solo casos de error
    // mvn test -Dkarate.options="--tags @regresion"    → suite completa
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:usuarios").relativeTo(getClass());
    }

}
