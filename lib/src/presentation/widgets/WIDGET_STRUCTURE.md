# Widget Structure Documentation

## Organización de Widgets

Los widgets de la aplicación están organizados en carpetas separadas según su uso, mejorando la mantenibilidad y escalabilidad.

### Estructura de Carpetas

```
lib/src/presentation/widgets/
├── common/                          # Widgets reutilizables
│   ├── card_shape_widget.dart      # Widget para mostrar tarjetas
│   ├── top_actions_widget.dart     # Barra superior con acciones (editar, eliminar)
│   ├── custom_rounded_button.dart  # Botón redondeado personalizado
│   ├── nav_bar_clipper.dart        # Clipper para bordes de navbar
│   ├── curved_nav_bar_painter.dart # Painter para navbar curvada
│   └── common.dart                 # Index que exporta todos
│
├── home/                            # Widgets específicos de Home Screen
│   ├── home_header_widget.dart     # Encabezado con título y avatar
│   ├── home_nav_bar_widget.dart    # Navbar con botón flotante de agregar
│   ├── card_list_stream_widget.dart# Grid de tarjetas con Stream
│   └── home.dart                   # Index que exporta todos
│
├── form/                            # Widgets específicos de Form Screen
│   ├── form_nav_bar_widget.dart    # Navbar con botones de color y acción
│   ├── create_edit_form_widget.dart# Formulario de crear/editar
│   └── form.dart                   # Index que exporta todos
│
└── widgets.dart                     # Index principal (punto de entrada)
```

## Categorías de Widgets

### 🔄 Common Widgets (Reutilizables)

Estos widgets se usan en múltiples pantallas:

- **CardShapeWidget**: Mostrador visual de tarjetas con Hero animations
- **TopActionsWidget**: Barra superior con botones de editar/eliminar (usado en detalles y formulario)
- **CustomRoundedButton**: Botón flotante circular personalizado
- **NavBarClipper**: Define la forma personalizada del navbar
- **CurvedNavBarPainter**: Pinta el efecto visual del navbar

### 🏠 Home Widgets (Screen Específicos)

Solo utilizados en la pantalla de inicio:

- **HomeHeaderWidget**: Encabezado con título "Quick Notes" y avatar del usuario
- **HomeNavbarWidget**: Navbar inferior con botón +Add y iconos de búsqueda y grid
- **CardsListStreamWidget**: StreamBuilder con GridView de tarjetas

### 📝 Form Widgets (Screen Específicos)

Solo utilizados en la pantalla de formulario:

- **FormNavbarWidget**: Navbar con selector de colores y botón de guardar/agregar
- **CreateEditFormWidget**: Formulario con validación de título y descripción

## Importación

### Opción 1: Importar todo desde el índice principal (Recomendado)

```dart
import 'package:cards_app/src/presentation/widgets/widgets.dart';

// Todos los widgets están disponibles
HomeHeaderWidget()
CardShapeWidget(...)
TopActionsWidget(...)
// etc.
```

### Opción 2: Importar desde la carpeta específica

```dart
// Solo si necesitas widgets de una carpeta específica
import 'package:cards_app/src/presentation/widgets/home/home.dart';
import 'package:cards_app/src/presentation/widgets/common/common.dart';
```

### Opción 3: Importar directamente

```dart
// Solo si necesitas un widget específico
import 'package:cards_app/src/presentation/widgets/common/card_shape_widget.dart';
```
