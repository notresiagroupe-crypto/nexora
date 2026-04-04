# 🚀 Déploiement sur Cloudflare Pages

## 📋 Prérequis

- Un compte Cloudflare (gratuit)
- Le code de votre projet sur GitHub, GitLab ou Bitbucket
- OU utiliser le dossier `build/` généré localement

## 🎯 Option 1 : Déploiement via Git (Recommandé)

### Étape 1 : Pusher votre code sur GitHub

```bash
# Si vous n'avez pas encore de repo Git
git init
git add .
git commit -m "Initial commit - NEXORA Studio"
git branch -M main
git remote add origin https://github.com/VOTRE-USERNAME/VOTRE-REPO.git
git push -u origin main
```

### Étape 2 : Connecter à Cloudflare Pages

1. Allez sur [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Cliquez sur **Workers & Pages** dans le menu latéral
3. Cliquez sur **Create application**
4. Sélectionnez l'onglet **Pages**
5. Cliquez sur **Connect to Git**
6. Autorisez Cloudflare à accéder à votre repository
7. Sélectionnez votre repository

### Étape 3 : Configuration du Build

Utilisez ces paramètres :

```
Framework preset: Create React App
Build command: yarn build
Build output directory: build
Root directory: frontend
```

**Variables d'environnement (si nécessaire) :**
```
REACT_APP_BACKEND_URL=https://votre-backend.com
```

### Étape 4 : Déployer

1. Cliquez sur **Save and Deploy**
2. Attendez que le build se termine (environ 2-3 minutes)
3. Votre site sera disponible sur `https://votre-projet.pages.dev`

## 🎯 Option 2 : Déploiement Direct (Build Local)

### Étape 1 : Le build est déjà créé ! ✅

Le dossier `/app/frontend/build/` contient votre application prête à être déployée.

### Étape 2 : Installer Wrangler (CLI Cloudflare)

```bash
npm install -g wrangler
# ou
yarn global add wrangler
```

### Étape 3 : Se connecter à Cloudflare

```bash
wrangler login
```

### Étape 4 : Déployer

```bash
cd /app/frontend
wrangler pages deploy build --project-name=nexora-studio
```

Votre site sera disponible sur `https://nexora-studio.pages.dev`

## 🎯 Option 3 : Déploiement Drag & Drop

### Étape 1 : Compresser le dossier build

```bash
cd /app/frontend
zip -r nexora-build.zip build/*
```

### Étape 2 : Upload Manuel

1. Allez sur [Cloudflare Pages](https://pages.cloudflare.com/)
2. Cliquez sur **Create a project**
3. Sélectionnez **Direct Upload**
4. Glissez-déposez le dossier `build/` ou le fichier `nexora-build.zip`
5. Donnez un nom à votre projet : `nexora-studio`
6. Cliquez sur **Deploy**

## ⚙️ Configuration Avancée

### Fichier `_redirects` (pour le routing React)

Créez `/app/frontend/public/_redirects` :

```
/*    /index.html   200
```

Ce fichier garantit que toutes les routes React fonctionnent correctement.

### Fichier `_headers` (pour la sécurité)

Créez `/app/frontend/public/_headers` :

```
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  X-XSS-Protection: 1; mode=block
  Referrer-Policy: strict-origin-when-cross-origin
```

### Variables d'environnement dans Cloudflare

1. Allez dans votre projet Cloudflare Pages
2. Cliquez sur **Settings** > **Environment variables**
3. Ajoutez vos variables :
   - `REACT_APP_BACKEND_URL` : L'URL de votre backend

## 🔄 Déploiements Automatiques

Une fois connecté via Git, chaque push sur la branche `main` déclenchera automatiquement un nouveau déploiement !

```bash
git add .
git commit -m "Update NEXORA Studio"
git push
```

Cloudflare détectera le changement et redéploiera automatiquement. ⚡

## 🌍 Domaine Personnalisé

### Ajouter votre domaine

1. Dans votre projet Cloudflare Pages
2. Allez dans **Custom domains**
3. Cliquez sur **Set up a custom domain**
4. Entrez votre domaine : `nexora-studio.com`
5. Suivez les instructions pour configurer les DNS
6. Cloudflare activera automatiquement le SSL (HTTPS)

## 📊 Build Info

**Votre build actuel :**
- Taille après gzip : **65.67 kB** (JS) + **12.46 kB** (CSS)
- Status : ✅ Compilé avec succès
- Optimisé pour la production
- Emplacement : `/app/frontend/build/`

## 🎨 Votre Application

**NEXORA Studio Landing Page**
- Design : Dark/Acid Brutalism
- Features :
  - Custom cursor animations
  - Scroll reveal effects
  - Tab navigation
  - Responsive design
  - Google Fonts chargées
  - Animations CSS fluides

## 📝 Commandes Utiles

```bash
# Recréer le build
cd /app/frontend && yarn build

# Tester le build localement
yarn global add serve
serve -s build

# Déployer via Wrangler
wrangler pages deploy build --project-name=nexora-studio

# Voir les logs de déploiement
wrangler pages deployment list --project-name=nexora-studio
```

## ⚡ Performance

Votre site NEXORA Studio est optimisé pour :
- ⚡ **Speed** : Cloudflare CDN global
- 🔒 **Security** : SSL automatique, DDoS protection
- 🌍 **Global** : Déployé sur 275+ data centers
- 💰 **Free** : Plan gratuit généreux (illimité)

## 🎉 Résultat Final

Une fois déployé, votre site NEXORA Studio sera :
- Disponible 24/7
- Ultra rapide grâce au CDN Cloudflare
- Sécurisé avec HTTPS
- Accessible depuis n'importe où dans le monde

**URL de prévisualisation actuelle :**
`https://build-smart-26.preview.emergentagent.com`

**URL Cloudflare (après déploiement) :**
`https://nexora-studio.pages.dev`

---

💡 **Besoin d'aide ?** Consultez la [documentation Cloudflare Pages](https://developers.cloudflare.com/pages/)
