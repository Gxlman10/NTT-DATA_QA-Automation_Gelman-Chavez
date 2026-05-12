package usuarios;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Tag;

@Tag("usuarios")
class UsuariosRunner {

    // corre todos los features de la carpeta usuarios/
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:usuarios").relativeTo(getClass());
    }

    // solo los @smoke, útil para correr rápido en cada commit
    @Karate.Test
    @Tag("smoke")
    Karate testSmoke() {
        return Karate.run("classpath:usuarios")
                     .tags("@smoke")
                     .relativeTo(getClass());
    }

}
