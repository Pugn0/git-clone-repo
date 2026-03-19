<div align="center">

```
 ██████╗ ██╗████████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗
 ██╔════╝ ██║╚══██╔══╝    ██╔════╝╚██╗ ██╔╝████╗  ██║██╔════╝
 ██║  ███╗██║   ██║       ███████╗ ╚████╔╝ ██╔██╗ ██║██║
 ██║   ██║██║   ██║       ╚════██║  ╚██╔╝  ██║╚██╗██║██║
 ╚██████╔╝██║   ██║       ███████║   ██║   ██║ ╚████║╚██████╗
  ╚═════╝ ╚═╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═══╝ ╚═════╝
```

**⚡ Git Sync Tool v2.0** — Copie repositórios GitHub em segundos

![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?style=flat-square&logo=windows)
![Git](https://img.shields.io/badge/Git-Obrigatório-F05032?style=flat-square&logo=git)
![GitHub](https://img.shields.io/badge/GitHub-Conta%20Necessária-181717?style=flat-square&logo=github)
![Gratuito](https://img.shields.io/badge/Licença-MIT-green?style=flat-square)

</div>

---

## 📌 O que é isso?

Um script `.bat` para Windows que **copia todos os arquivos de um repositório GitHub para outro** com apenas alguns cliques — sem precisar saber Git a fundo.

**Caso de uso típico:**
> Você tem um repositório base (ex: `zapvoice-unlimited`) com sua estrutura padrão e quer replicar tudo para um novo repositório (ex: `modvoice`). O script faz tudo sozinho.

---

## 🛠️ Pré-requisitos

### 1. Instalar o Git

> Se você já tem o Git instalado, pule para o passo 2.

1. Acesse: **https://git-scm.com/download/win**
2. Baixe e execute o instalador
3. Clique em **Next** em todas as telas — as opções padrão funcionam

**Verificar se instalou corretamente:**

Abra o Prompt de Comando (`Win + R` → digite `cmd` → Enter) e rode:

```bash
git --version
```

Se aparecer algo como `git version 2.x.x` ✔

---

### 2. Criar uma conta no GitHub

> Se já tem conta, pule para o passo 3.

1. Acesse **https://github.com** e crie sua conta gratuitamente
2. Crie os dois repositórios que você vai usar:
   - O **pai** (de onde vêm os arquivos)
   - O **destino** (para onde vão os arquivos)

---

### 3. Configurar suas credenciais do Git

Abra o Prompt de Comando e rode os dois comandos abaixo com seus dados:

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

---

### 4. Autenticação com o GitHub

Na primeira vez que rodar o script, o Windows vai abrir uma janela pedindo login no GitHub — basta fazer login normalmente.

> ⚠️ **Se der erro de autenticação**, instale o [GitHub CLI](https://cli.github.com) e rode:
> ```bash
> gh auth login
> ```

---

## 🚀 Como usar

### Passo a passo

**1.** Coloque o arquivo `git-clone-repo.bat` em qualquer pasta do seu computador

**2.** Dê **dois cliques** no arquivo — uma janela do terminal vai abrir

**3.** Preencha as informações solicitadas:

| Campo | Descrição | Exemplo |
|-------|-----------|---------|
| **URL do repositório PAI** | De onde vêm os arquivos | `https://github.com/Pugn0/zapvoice-unlimited.git` |
| **URL do repositório DESTINO** | Para onde vão os arquivos | `https://github.com/Pugn0/modvoice.git` |
| **Nome da pasta** | Pasta temporária a ser criada | `modvoice` |
| **Mensagem do commit** | Texto do commit (Enter = `restore`) | `primeira versão` |

**4.** Confirme com `S` quando o script mostrar o resumo

**5.** Aguarde as 7 etapas concluírem:

```
  [1/7] Criando pasta de destino ......... ✔
  [2/7] Clonando repositório PAI ......... ✔
  [3/7] Copiando arquivos ................ ✔
  [4/7] Removendo temporários ............ ✔
  [5/7] Configurando repositório local ... ✔
  [6/7] Commitando arquivos .............. ✔
  [7/7] Enviando para o GitHub ........... ✔
```

**6.** Ao finalizar, escolha o que fazer com a pasta criada:

```
  [1] Apagar a pasta
  [2] Manter a pasta
  [3] Abrir no Explorer
```

✅ **Pronto!** Acesse seu repositório no GitHub e atualize a página — todos os arquivos estarão lá.

---

## ⚠️ Problemas comuns

<details>
<summary><b>"git" não é reconhecido como comando</b></summary>

O Git não foi instalado corretamente. Reinstale pelo link acima e **reinicie o computador** antes de tentar novamente.

</details>

<details>
<summary><b>Erro de autenticação no push</b></summary>

Instale o [GitHub CLI](https://cli.github.com) e rode no Prompt de Comando:

```bash
gh auth login
```

Siga as instruções na tela para autenticar via navegador.

</details>

<details>
<summary><b>A pasta já existe</b></summary>

Escolha um nome diferente quando o script perguntar, ou delete manualmente a pasta existente antes de rodar novamente.

</details>

<details>
<summary><b>URL inválida</b></summary>

Certifique-se de copiar a URL completa com `.git` no final:

```
✔  https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
✖  https://github.com/SEU_USUARIO/SEU_REPOSITORIO
```

</details>

---

## 📁 Estrutura do projeto

```
git-clone-repo/
└── git-clone-repo.bat   # Script principal
└── README.md            # Este arquivo
```

---

<div align="center">

Feito por **[Pugn0](https://github.com/Pugn0)** • Git Sync Tool v2.0

</div>
