# Documentación de MyNiri

Este repositorio contiene la configuración unificada para el entorno de escritorio Niri con un diseño moderno estilo Honey, potenciado por Quickshell, Mako y WirePlumber.

## Arquitectura del Sistema

### 1. Niri (Gestor de Ventanas)
Niri es la pieza central que gestiona las ventanas en Wayland. La configuración (`~/.config/niri/config.kdl`) se encarga de:
- Inicializar el entorno, definir atajos de teclado e integrar utilidades como `polkit_agent.py`.
- Integración perfecta con `quickshell` para invocar lanzadores (ej: Ctrl+Space para el AppLauncher QML).
- Configurar reglas de renderizado flotante, de colores (extraídos mediante el script de acento), y de comportamiento de ventanas.

### 2. Quickshell (Interfaz QML)
Quickshell se usa para construir la UI premium interactiva, reemplazando herramientas tradicionales. Los QMLs están en `~/.config/quickshell/unified/`:
- **TopBar**: La barra de estado superior moderna con soporte para animaciones e iconos dinámicos (batería, RAM, CPU, volumen y micrófono).
- **SettingsWindow**: Una ventana de preferencias integrada que permite ajustar conexiones WiFi, redes, audio, etc.
- **Notificaciones**: Sistema inspirado en macOS con agrupación de notificaciones por aplicación, integrado dinámicamente.

### 3. Scripts (`~/scripts/`)
Los scripts en Python y Bash funcionan como intermediarios entre el sistema y la UI.
- `honey_network_status.sh`: Entrega a la TopBar el estado de Ethernet/Wi-Fi en formato TSV (`tipo`, `nombre`, `señal`, `IP`, `velocidad`). Siempre devuelve una línea válida, incluso sin conexión.
- `extract_color.py`: Analiza el fondo de pantalla actual y extrae una paleta de colores usando Pillow para inyectarla en Quickshell.
- `polkit_agent.py`: Proveedor de autenticación gráfica para acciones del sistema que requieren permisos.
- Diferentes scripts bash para toggles (wifi, bluetooth, paneles y calendarios).

### 4. Wireplumber & Pipewire
Para la gestión de audio, se incluye la configuración de `~/.config/wireplumber/` que personaliza perfiles de hardware (por ejemplo, perfiles duplicados u otras configuraciones concretas). Junto con `audio_monitor.py`, se asegura de que cualquier cambio hecho tanto en UI como en atajos de teclado se refleje de manera instantánea y estable en el servidor de audio y en los widgets.

## Instalación

El archivo `installer.sh` automatiza la configuración en distribuciones Fedora y Debian.
Contiene un *payload* que almacena todos los archivos mencionados arriba.
Al ejecutarse, extraerá estas configuraciones en su lugar correcto, instalará dependencias, modificará el renderizado de fuentes (Honey Core) y habilitará los servicios pertinentes.
Durante la instalación también repara el perfil de Discord para Niri: crea `~/.config/discord` y enlaza `~/.config/niri/xdg-config/discord` hacia ese directorio real, evitando symlinks rotos cuando Discord ejecuta su bootstrap con `XDG_CONFIG_HOME` aislado.
Además habilita `gnome-keyring-daemon.socket` en systemd de usuario y aplica `--password-store=basic` en los flags de Chromium/Brave/Electron y en el lanzador `.desktop` de Brave para que esas apps no disparen prompts recurrentes de `gcr-prompter` cuando no hay keyring inicializado.
