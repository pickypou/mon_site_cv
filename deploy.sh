#!/bin/bash

echo "✨ 1. Compilation de l'application Flutter Web..."
flutter build web --base-href /app/ --no-wasm-dry-run

echo "📂 2. Copie de l'application vers le dossier public_site/app..."
rm -rf public_site/app
cp -r build/web public_site/app

echo "🚀 3. Déploiement sur Firebase Hosting..."
firebase deploy --only hosting

echo "✅ Déploiement terminé avec succès !"
