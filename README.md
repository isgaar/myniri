<div align="center">
  <h1>MySway Environment v4.0</h1>
  <p><strong>Un entorno premium para Linux construido con Sway, Waybar y Quickshell.</strong></p>

  ![Fedora](https://img.shields.io/badge/Fedora-51A2DA?style=for-the-badge&logo=fedora&logoColor=white)
  ![Debian](https://img.shields.io/badge/Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)
  ![Wayland](https://img.shields.io/badge/Wayland-2585A6?style=for-the-badge&logo=wayland&logoColor=white)
  
  <br>
  <img src="assets/screenshot.png" alt="MySway Desktop Screenshot" width="800"/>
</div>

---

## Visión General

Este repositorio contiene el setup personal de Ismael. Provee una experiencia de escritorio moderna, robusta y altamente estética diseñada para **Fedora** y **Debian**. Reemplaza los elementos crudos de la terminal por componentes gráficos avanzados inspirados en el diseño premium de Honey e iOS, construidos principalmente con `Quickshell` (QML/Qt6) y `Sway`.

## Características Principales

### Diseño Unificado y Elegante
* **Quickshell como Motor Principal:** Paneles de volumen, brillo, calendario, menú de apagado, notificaciones y configuración de sistema unificados mediante una sola fuente de verdad (`theme.json`).
* **TopBar QML nativa:** Barra superior con iconos animados (batería con fill por nivel y color, memoria con círculo Canvas de progreso, volumen con barra horizontal 300ms OutCubic, mic con transiciones de color 200ms).
* **Soporte Nativo de Modo Oscuro/Claro:** Transiciones dinámicas de colores y contraste inteligente en barras y menús.
* **Geometría Premium (Honey):** Bordes perfectamente redondeados en todas las esquinas y notificaciones sincronizadas dinámicamente con el tema de la shell.
* **Componentes Exclusivos:** Sliders en forma de píldora interactiva sin perillas para control de música, brillo y audio.

### Aplicaciones Integradas
* **Settings App (`Super + i`):** Aplicación completa de ajustes en QML con páginas de Conexiones (Wi-Fi/Ethernet/Bluetooth embebidos sin KDE), Audio (selector de sinks con iconos por tipo), Información del Sistema dinámica, y Personalización (colores, animaciones).
* **MemoryDetailPanel:** Panel de monitoreo de RAM con top 10 procesos al hacer clic en el indicador de memoria de la barra.
* **Notificaciones agrupadas estilo macOS:** Agrupación inteligente por app+tipo con badge numérico (+N más). Click en notificación enfoca/abre la app destino.
* **Launcher Moderno (`Ctrl + Space` o `Super + d`):** Reemplazo directo de `Wofi` con una cuadrícula de iconos elegante y responsiva.
* **Power Menu QML:** Menú de apagado y reinicio a medida para Sway, reemplazando Wlogout.

### Instalador Inteligente (`installer.sh`)
* **Gestor de Dependencias Autónomo:** Listas de paquetes unificadas y probadas tanto para **Fedora** (dnf) como para **Debian/Ubuntu** (apt).
* **Gestor de Archivos Flexible:** El instalador pregunta de forma interactiva qué explorador de archivos deseas usar (Dolphin, Nautilus, Thunar, PCManFM, Nemo) y configura tu atajo `Super + e` automáticamente.
* **Payload Auto-Contenido:** Todos los archivos de configuración (`mysway-configs.tar.gz`) están empaquetados en codificación Base64 dentro del mismo instalador. Con ejecutar un archivo, tienes todo el sistema listo.

## Atajos de Teclado Destacados

| Atajo | Acción |
| :--- | :--- |
| `Super + d` o `Ctrl + Space` | Abrir lanzador de aplicaciones (QML) |
| `Super + i` | Abrir configuración del sistema (Settings App) |
| `Super + t` | Abrir terminal (`kitty`) |
| `Super + e` | Abrir tu Gestor de Archivos seleccionado |
| `Super + Shift + c` | Recargar Sway |
| `Super + z` | Abrir navegador Zen |
| Clic en memoria (TopBar) | Abrir panel de top 10 procesos RAM |
| Rueda del ratón en TopBar | Navegar entre workspaces |

## Instalación

1. Clona o descarga este repositorio.
2. Asegúrate de tener permisos de ejecución en el instalador:
   ```bash
   chmod +x installer.sh
   ```
3. Ejecuta el instalador (no uses `sudo`, el script lo pedirá cuando sea necesario):
   ```bash
   ./installer.sh
   ```
4. Elige tu gestor de archivos cuando el instalador lo pregunte.
5. Disfruta de tu nuevo entorno.

---
*Creado y mantenido por Ismael.*
