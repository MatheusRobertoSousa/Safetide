# 🚨 Safetide

[![Flutter](https://img.shields.io/badge/Flutter-v3.0-blue?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Integrated-orange?logo=firebase)](https://firebase.google.com)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![OpenWeather](https://img.shields.io/badge/OpenWeatherMap-API-yellow?logo=OpenWeather)](https://openweathermap.org/api)

**Safetide** é um aplicativo móvel inovador desenvolvido em **Flutter** que oferece suporte rápido e inteligente em situações de enchentes, com foco na **proteção da vida** e na **resposta emergencial coordenada** em diversas cidades do Brasil.

---

## 🌊 Visão Geral

O app centraliza informações dispersas e democratiza o acesso a **dados cruciais** durante emergências. Com ele, usuários podem:

- Receber [**alertas em tempo real**](https://defesacivil.gov.br/) da Defesa Civil.
- Localizar **abrigos seguros** próximos.
- Visualizar **áreas de risco no mapa**.
- Acionar um **botão SOS** com envio da localização para autoridades.
- **Relatar ocorrências** para auxiliar equipes de resgate e gestão.

---

## 🛠️ Tecnologias Utilizadas

### Linguagem:
- [**Dart**](https://dart.dev) (principal)

### Framework:
- [**Flutter**](https://flutter.dev) (UI multiplataforma para iOS e Android)

### Ferramentas:
- [**VS Code**](https://code.visualstudio.com/)
- [**GitHub**](https://github.com/)
- [**Figma**](https://figma.com)

---

## 🚀 Instruções para Executar o Projeto Localmente

### ✅ Pré-requisitos

Certifique-se de ter instalado:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) (com emulador) ou [Xcode](https://developer.apple.com/xcode/) (para iOS)
- [Node.js](https://nodejs.org/) (se for usar Firebase Functions)
- Uma conta no [Firebase Console](https://console.firebase.google.com/)

---

### 📁 Clonando o Projeto

```bash
git clone https://github.com/MatheusRobertoSousa/Safetide.git
cd safetide
📦 Instalando Dependências
bash
Copiar
Editar
flutter pub get

▶️ Executando o App
Inicie um emulador ou conecte um dispositivo físico.

Execute o projeto:

bash
Copiar
Editar
flutter run
Se necessário, use flutter doctor para diagnosticar o ambiente.

🧪 Firebase Functions (opcional)
Se quiser rodar localmente as funções Firebase:

bash
Copiar
Editar
cd firebase/functions
npm install
firebase emulators:start
Configure o app para se conectar ao emulador local do Firebase.

💡 Contribuições
Pull requests e sugestões são muito bem-vindas!
Abra uma issue se encontrar bugs ou tiver ideias de melhorias.

📄 Licença
Distribuído sob a licença MIT.