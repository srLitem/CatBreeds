# CatBreeds

CatBreeds es una aplicación móvil desarrollada con Flutter, diseñada para presentar diferentes razas de gatos. 

## Características

- **Rutas Nombradas**: Implementación de navegación a través de rutas nombradas para una mejor organización y mantenimiento del código.
- **Tema Personalizado**: Se usa un tema personalizado para proporcionar una experiencia de usuario coherente y atractiva.
- **Internacionalización**: Soporte para inglés y español, permitiendo a los usuarios elegir su idioma preferido de acuerdo al lenguaje de su dispositivo.
- **State Management con Riverpod**: Manejo eficiente del estado de la aplicación utilizando el paquete Riverpod.
- **Manejo de Variables de Entorno**: Uso de la librería `flutter_dotenv` para la gestión de variables de entorno, mejorando la seguridad y la configuración del proyecto.
- **Comentarios Descriptivos**: Cada archivo fuente incluye comentarios detallados en la parte superior para explicar su propósito y funcionalidad.
- **Interfaces Diferenciadas para iOS y Android**: Diseño de dos interfaces únicas para cada plataforma en la página de inicio, mejorando la experiencia del usuario en ambas plataformas. **Altamente recomendado probar en Android y iOS**
- **Icono y Nombre Personalizados**: La aplicación cuenta con un icono distintivo y un nombre personalizado, resaltando su identidad y propósito.

## Estructura del Proyecto

El proyecto sigue una estructura clara y bien organizada, con cada componente, pantalla y funcionalidad debidamente separados en archivos y carpetas específicos.

- `lib/`: Carpeta principal que contiene el código fuente de la aplicación.
  - `api`: Contiene el archivo utilizado para realizar las llamadas API necesarias.
  - `l10n`: Contiene los archivos .arb utilizados para la internacionalización. 
  - `models`: Define el modelo utilizado para almacenar los datos de la API e implementarlos en la UI.
  - `providers`: Carpeta que contiene los archivos con los provider implementados con Riverpod.
  - `servicdes`: Carpeta que contiene el archivo utilizado como intermediario entre la API y los Providers de Riverpod.
  - `settings`: Carpeta que contiene el archivo utilizado para configurar la app. En este caso, el tema.
  - `ui`: Contiene las carpetas con los archivos de UI
    - `generic`: Contiene el widget que se puede utilizar en varias partes de la UI
    - `pages`: Contiene la lista de páginas junto con su propio carpetado con los componentes de UI
- `assets/`: Carpeta que contiene los recursos gráficos y de diseño, como imágenes y fuentes.
- `.env`: Archivo para las variables de entorno gestionadas por `flutter_dotenv`.

## Requisitos

Para realizar esta aplicación, se utilizó:

- Flutter SDK (versión 3.13.9)
- Dart (3.1.5)

## Instalación

Para instalar y ejecutar CatBreeds en tu entorno local, sigue estos pasos:

1. Clona este repositorio en tu máquina local.
2. Abre el directorio del proyecto en tu editor de código.
3. Ejecuta `flutter pub get` para instalar todas las dependencias.
4. Crea un archivo `.env` en la raíz del proyecto y configura las variables de entorno necesarias (sigue la plantilla de `.env)
   - El .env debe tener el `CAT_API_KEY`con esta estructura. DOnde {API_KEY} corresponde a la llave.
  ```
  CAT_API_KEY={API_KEY}
  ```
