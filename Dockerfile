# Image de base optimisée pour Flutter
FROM ghcr.io/cirruslabs/flutter:3.19.0

# Installation de dépendances supplémentaires si nécessaire
USER root
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# On passe en utilisateur "flutter" pour éviter les problèmes de droits
USER codespace

# Pré-téléchargement des artefacts pour le Web (pour éviter de le faire au lancement du Codespace)
RUN flutter precache --web

# Vérification de l'installation 
RUN flutter doctor
