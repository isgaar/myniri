#!/bin/bash
# Script para aislar las variables de entorno de Niri y solucionar el conflicto con KDE.

# 1. Eliminar archivo de entorno global de systemd
if [[ -f "$HOME/.config/environment.d/niri-session.conf" ]]; then
    rm -f "$HOME/.config/environment.d/niri-session.conf"
    echo "✔ Eliminado archivo global: ~/.config/environment.d/niri-session.conf"
else
    echo "ℹ El archivo ~/.config/environment.d/niri-session.conf ya no existe."
fi

# 2. Configurar las variables en niri-session de manera local
session_file="/usr/local/bin/niri-session"
if [[ -f "$session_file" ]]; then
    echo "Configurando variables locales de entorno en $session_file..."
    
    # Crear un archivo temporal
    tmp_session=$(mktemp)
    
    # Escribir cabecera con variables de exportación
    cat > "$tmp_session" <<'ENV_EOF'
#!/bin/sh

# === Variables de entorno locales para Niri ===
export XDG_CURRENT_DESKTOP=niri
export XDG_SESSION_DESKTOP=niri
export QT_QPA_PLATFORM="wayland;xcb"
export GDK_BACKEND="wayland,x11"
export MOZ_ENABLE_WAYLAND=1
export FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
export PATH="${HOME}/.local/bin:${PATH}"
# ==============================================
ENV_EOF

    # Quitar la línea #!/bin/sh del archivo original y añadirlo
    tail -n +2 "$session_file" >> "$tmp_session"

    # Reemplazar la línea de unset-environment para limpiar todas las variables al salir
    sed -i 's|systemctl --user unset-environment WAYLAND_DISPLAY DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP NIRI_SOCKET|systemctl --user unset-environment WAYLAND_DISPLAY DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP NIRI_SOCKET XDG_SESSION_DESKTOP QT_QPA_PLATFORM GDK_BACKEND MOZ_ENABLE_WAYLAND FREETYPE_PROPERTIES|g' "$tmp_session"

    # Copiar el archivo temporal de vuelta con sudo
    echo "Se requieren permisos de administrador (sudo) para actualizar $session_file"
    if sudo cp "$tmp_session" "$session_file" && sudo chmod +x "$session_file"; then
        echo "✔ Variables de entorno locales inyectadas correctamente en $session_file"
    else
        echo "❌ Error al copiar el archivo a $session_file"
    fi
    rm -f "$tmp_session"
else
    echo "❌ Error: No se encontró el archivo $session_file"
fi
