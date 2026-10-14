#!/bin/bash

echo "✨ 1. Compilation de l'application Flutter Web..."
flutter build web --no-wasm-dry-run

echo "🚀 2. Déploiement sur Firebase Hosting..."
firebase deploy --only hosting

echo "✅ Déploiement terminé avec succès !"
