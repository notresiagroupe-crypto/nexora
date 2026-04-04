#!/bin/bash

# 🚀 Script de déploiement Cloudflare Pages pour NEXORA Studio
# Usage: ./deploy-cloudflare.sh

set -e

echo "🎨 ========================================="
echo "   NEXORA Studio - Cloudflare Deployment"
echo "========================================="
echo ""

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Étape 1: Vérifier que nous sommes dans le bon répertoire
echo -e "${BLUE}📁 Vérification du répertoire...${NC}"
if [ ! -d "frontend" ]; then
    echo "❌ Erreur: Le dossier 'frontend' n'existe pas."
    echo "   Assurez-vous d'exécuter ce script depuis /app/"
    exit 1
fi
echo -e "${GREEN}✅ Répertoire validé${NC}"
echo ""

# Étape 2: Build de production
echo -e "${BLUE}🔨 Création du build de production...${NC}"
cd frontend
yarn build
cd ..
echo -e "${GREEN}✅ Build créé avec succès${NC}"
echo ""

# Étape 3: Vérifier que le build existe
if [ ! -d "frontend/build" ]; then
    echo "❌ Erreur: Le dossier 'frontend/build' n'a pas été créé."
    exit 1
fi
echo -e "${GREEN}✅ Build vérifié${NC}"
echo ""

# Étape 4: Afficher les options de déploiement
echo -e "${YELLOW}📋 Options de déploiement disponibles:${NC}"
echo ""
echo "1️⃣  Via Wrangler CLI (recommandé si installé):"
echo "    cd frontend"
echo "    wrangler pages deploy build --project-name=nexora-studio"
echo ""
echo "2️⃣  Via Git + Cloudflare (automatique):"
echo "    git add ."
echo "    git commit -m 'Deploy NEXORA Studio'"
echo "    git push"
echo ""
echo "3️⃣  Via Upload Manuel:"
echo "    - Allez sur https://dash.cloudflare.com/pages"
echo "    - Cliquez sur 'Create a project'"
echo "    - Sélectionnez 'Direct Upload'"
echo "    - Glissez-déposez le dossier: frontend/build/"
echo ""

# Étape 5: Demander à l'utilisateur
echo -e "${YELLOW}❓ Voulez-vous déployer maintenant via Wrangler? (y/n)${NC}"
read -r response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    # Vérifier si Wrangler est installé
    if ! command -v wrangler &> /dev/null; then
        echo -e "${YELLOW}📦 Wrangler n'est pas installé. Installation...${NC}"
        npm install -g wrangler
    fi
    
    echo -e "${BLUE}🚀 Déploiement en cours...${NC}"
    cd frontend
    wrangler pages deploy build --project-name=nexora-studio
    cd ..
    echo ""
    echo -e "${GREEN}🎉 Déploiement terminé !${NC}"
    echo -e "${GREEN}🌍 Votre site est maintenant en ligne !${NC}"
else
    echo ""
    echo -e "${BLUE}📦 Build prêt pour le déploiement manuel${NC}"
    echo -e "${BLUE}📂 Emplacement: $(pwd)/frontend/build/${NC}"
    echo ""
    echo -e "${YELLOW}Pour déployer manuellement:${NC}"
    echo "1. Compressez le dossier: cd frontend && zip -r nexora-build.zip build/*"
    echo "2. Allez sur https://dash.cloudflare.com/pages"
    echo "3. Créez un nouveau projet et uploadez le dossier 'build/'"
fi

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}   ✅ Script terminé avec succès !${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""
echo -e "${BLUE}📚 Pour plus d'infos, consultez:${NC}"
echo "   - cloudflare-deployment.md"
echo "   - https://developers.cloudflare.com/pages/"
echo ""
