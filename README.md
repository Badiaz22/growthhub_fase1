# 📱 Cards App - Flutter

Una aplicación Flutter moderna que implementa un gestor de tarjetas con interfaz elegante, arquitectura limpia y mejores prácticas de desarrollo.

## ✨ Características

- 📋 **Listado de Tarjetas**: Visualización en grid de todas las tarjetas
- 🔍 **Detalles**: Vista completa de cada tarjeta
- ➕ **Crear Tarjetas**: Formulario para agregar nuevas tarjetas
- ✏️ **Editar Tarjetas**: Modificar información existente
- 🗑️ **Eliminar Tarjetas**: Remover tarjetas con confirmación
- 🎨 **Colores Dinámicos**: 6 paletas de color predefinidas
- 🌈 **Animaciones Suaves**: Transiciones fade y scale
- ⚡ **Validación en Tiempo Real**: Validadores en formularios

## 🏗️ Arquitectura

El proyecto implementa **Clean Architecture** con separación clara de responsabilidades:

```
lib/
├── main.dart                 # Punto de entrada
├── router.dart              # Configuración de rutas
├── initial_data.dart        # Datos iniciales
└── src/
    ├── di/                  # Inyección de dependencias
    ├── domain/              # Lógica de negocio
    │   ├── entities/
    │   └── use_cases/
    ├── infrastructure/      # Acceso a datos
    │   └── repository/
    ├── presentation/        # UI e interacción
    │   ├── screens/
    │   ├── widgets/
    │   └── blocs/
    └── utils/               # Utilidades y constantes
```

## 🎯 Pantallas

### 1. **HomeScreen** 📱
- Listado en grid de tarjetas
- Botón para crear nueva tarjeta
- Estados de carga y lista vacía

### 2. **DetailsScreen** 🔍
- Vista completa de tarjeta
- Botones de editar y eliminar
- Confirmación al eliminar

### 3. **FormScreen** ✏️
- Formulario de crear/editar tarjeta
- Validación de campos
- Selector de color

## 🚀 Cómo Ejecutar

```bash
# Descargar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```
## 🛠️ Tecnologías

- **Arquitectura**: Clean Architecture
- **Estado**: BLoC pattern con Streams
- **Navegación**: Named Routes
- **Validación**: Validadores centralizados
