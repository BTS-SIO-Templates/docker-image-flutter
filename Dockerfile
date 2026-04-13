# Image de base stable
FROM ghcr.io/cirruslabs/flutter:3.19.0

# On reste en root pour l'installation et le precache
USER root

# Installation des dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# Pré-téléchargement des artefacts pour le Web
# On le fait en root, les droits seront ajustés automatiquement plus tard
RUN flutter precache --web

# Désactive l'analyse des plateformes desktop dont on n'a pas besoin
RUN flutter config --no-enable-linux-desktop --no-enable-macos-desktop --no-enable-windows-desktop

# Force Flutter à considérer le web comme configuré
RUN flutter config --enable-web

# On lance un flutter doctor pour finaliser l'installation
RUN flutter doctor
