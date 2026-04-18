# 💸 Denaro

**Denaro** é um Dashboard Financeiro Desktop nativo construído para Windows. O propósito central da aplicação é providenciar uma experiência de gestão de finanças **100% offline, ágil e criptografada** por padrão — garantindo segurança imutável e mitigando ativamente o risco de exfiltração de dados no uso local.

Este projeto adota a premissa rigorosa de _Clean Architecture_ (separação cega e contínua do seu Domínio, Persistência de Dados e Apresentação visual). O armazenamento central utiliza banco de dados escalável SQLite interceptado proceduralmente pelo framework **SQLCipher** (AES-256 local).

### ⚡ Desenvolvimento Vibecodado

> Este aplicativo é um experimento e produto finalizado construído integralmente a partir da metodologia de *"vibecoding"*. Foi arquitetado e codado de forma autônoma e guiada utilizando a **Antigravity IDE**, orquestrado especificamente pelo modelo neural **Gemini 3.1 Pro (High)**.

---

## 📌 Roadmap de Execução (Contrato das 5 Fases)

O ciclo de vida deste projeto opera estritamente sob as diretrizes estruturais de um Engenheiro Chefe listadas abaixo, exigindo autorização humana rígida para transição entre camadas.

- [x] **Fase 0: Infraestrutura e Segurança Base** 
  - Git flow inicializado, bloqueios via `.gitignore` focados no isolamento de logs ou credenciais `.db`, hooks `pre-commit` rastreáveis configurados para forçar aprovação do linter e TDD. 
  
- [ ] **Fase 1: Fundação da Arquitetura e Provedores Data**
  - Scaffold Flutter (Windows Desktop). Estruturação e scaffold de pastas (_Domain / Data / Presentation_), container de gerência por Riverpod, setup da isolação de Thread para o banco local (`sqflite_common_ffi` + `sqlcipher`) e construção do logger circular em diretórios `%APPDATA%`.

- [ ] **Fase 2: Motor de Domínio (Logíca Cega e Regex)**
  - TDD guiando importações CSVs bancárias, parser por algoritmos de Regex seguros baseados em Instituições consolidadas, sistema de contenção anti-injection e Classificador via pesos numéricos baseados na abstração de descrições parciais.

- [ ] **Fase 3: Apresentação Minimalista (UI/UX)**
  - Refatorações de proporções desktop. Painel minimalista com Dashboard contendo barras de progresso orçamentárias unidas a gráficos comparativos ("Receita vs Despesa"). Modo Escuro Automático, e Central de Configurações com alertas assistidos localmente para _Disaster Recovery_ preventivo via `.bak`.

- [ ] **Fase 4: Obfuscação e Distribuição Edge**
  - Criptografia no release (`tree-shaking` e obfuscation passiva C++), compilação do executável no ambiente restritivo Windows para entrega final do binário `.exe`.
