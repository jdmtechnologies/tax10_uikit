<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

### Dependencia desde otro proyecto (Git)

En el `pubspec.yaml` del proyecto que usa este paquete:

```yaml
dependencies:
  tax10_uikit:
    git:
      url: https://github.com/TU_USUARIO/tax10_uikit.git  # o la URL de tu repo
      ref: main   # usa la rama principal (o un tag) para tener todos los widgets
```

**Importante:** usa siempre `ref: main` (o la rama/tag actual), no un commit antiguo.

### Si ves errores "Not found: package:tax10_uikit/..."

Eso indica que pub está usando una versión antigua en caché. En el **otro proyecto** ejecuta:

```bash
flutter pub cache repair
flutter pub get
```

Y en su `pubspec.yaml` asegúrate de que la dependencia apunte a la rama actual (`ref: main`) y no a un commit viejo.

## Diseño: paleta y componentes "tributa"

La paleta de colores y tipografía de `AppColors`/`AppTypography` fue
adaptada del mockup "tributa" (generado con v0, en
`tax-management-dashboard/`): fondo cálido tipo arena, `primary` azul marino
oscuro, y tres acentos de marca (`accentCoral`, `accentTeal`, `accentGold`,
cada uno con su variante `...Soft` para fondos de chips/badges). El resto de
widgets (botones, inputs, tarjetas existentes) heredan estos colores
automáticamente porque ya usaban `AppColors`/`AppTypography`.

Los colores/fondos "médicos" heredados de `iatros_uikit` (`medicalBlue`,
`botanicalGreen`, `leafGreen`, `turquoise`, `coral`, `peach`) se dejaron sin
tocar — solo los usan los widgets decorativos de fondo (`medicalBackground`,
`backgroundExample`), que quedan pendientes de una limpieza posterior.

**Tipografía**: `AppTypography` ahora usa `google_fonts` (DM Sans para texto,
DM Mono para datos tabulares/numéricos vía `AppTypography.mono`), en vez de
`SourceCodePro`. `google_fonts` descarga y cachea los `.ttf` la primera vez
que se usan (necesita red); si tu app debe funcionar sin conexión, se pueden
empaquetar los archivos como assets en su lugar (ver la documentación del
paquete `google_fonts`).

**Componentes nuevos**, disponibles vía `Tax10Ui.widget.*`:

- `Tax10Ui.widget.cards.statCard(...)` — tarjeta de métrica (ícono + valor + detalle).
- `Tax10Ui.widget.data.statusBadge(...)` — chip de estado (punto + etiqueta).
- `Tax10Ui.widget.data.recordListItem(...)` — fila de lista/tabla con avatar de iniciales.
- `Tax10Ui.widget.data.summaryBanner(...)` — banner destacado con estadísticas.
- `Tax10Ui.widget.navigation.appTopBar(...)` — barra superior (subtítulo, acciones, usuario).
- `Tax10Ui.widget.navigation.appSidebar(...)` / `appDrawer(...)` — menú lateral de navegación (secciones + ítems + pie de usuario); `appSidebar` para un panel fijo en web/escritorio, `appDrawer` para `Scaffold(drawer: ...)` en móvil.
- `Tax10Ui.widget.navigation.sidebarUserFooter(...)` — fila de usuario para el pie del sidebar/drawer.
- `Tax10Ui.widget.popUp.showDetail(...)` — pop-up de detalle (avatar + título + cerrar + grilla de estadísticas + botón de acción), inspirado en el modal de detalle de cliente del mockup.

Todos reciben datos por parámetros (sin textos de dominio fiscal
hardcodeados), listos para usarse desde cualquier feature de `tax10`.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
