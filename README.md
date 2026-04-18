# 💸 Denaro

**Denaro** é um Dashboard Financeiro Desktop nativo construído para Windows. O propósito central da aplicação é providenciar uma experiência de gestão de finanças **100% offline, altamente performática e estritamente criptografada** por padrão — mitigando sistematicamente o risco de exfiltração de dados locais ou travamentos de sistema.

### 🛡️ Engenharia Estrita (Clean Architecture + DDD)
* **Padrão Funcional & Imutável**: Nenhuma entidade em nosso Domínio é mutável. Implementamos **Value Objects** e `freezed` para garantir fronteiras estritas de domínio, neutralizando falhas silenciosas ou variáveis corrompidas (DDD puro).
* **Segurança e Persistência**: A arquitetura integra *SQLite* interceptado pelo framework **SQLCipher (Advanced C++ FFI)**. Nenhuma string em disco escapa à criptografia AES-256.
* **Erros de Forma Declarativa**: Exceptions genéricas (`throw`) não existem na regra. O app é inteiramente moldado por Monads (`Either<Failure, Success>` usando `fpdart`). A Falha é parte rastreável e visual da assinatura do método.
* **Multithreading em isolates**: A carga das RegEx de importação flui obrigatoriamente através de sub-threads in-memory (`compute` e isolates paralelos) para manter a UI desenhando quadros lisos a 120fps sem interrupção.

### ⚡ Desenvolvimento Vibecodado
> Aplicativo integralmente construído através de *"vibecoding"*. Arquitetado autônoma e interativamente através da **Antigravity IDE** sob o modelo orquestrador **Gemini 3.1 Pro (High)**.

---

## 📌 Roadmap de Execução (Contrato Restritivo)

O ciclo de vida trabalha estritamente com aprovação humana obrigatória por fase (Zero Código Surpresa).

- [x] **Fase 0: Infraestrutura e Segurança Base** 
  - Inicialização segura, `.gitignore` blindado para keys/.db, e `pre-commit` hook obrigatório de Linter e TDD.
  
- [x] **Fase 1: Fundação da Arquitetura e Provedores Data**
  - Scaffold Flutter Desktop. Abstrações FFI, logs locais isolados e setup arquitetural Clean-Arch/Riverpod.
  
- [x] **Fase 1.5: Sincronismo Funcional & DDD**
  - Injeção das restrições de imutabilidade escalar e Multithreading.

- [ ] **Fase 2: Motor de Domínio (Lógica Cega, Isolates e fPdart)**
  - TDD guiando conversores herméticos (*Value Objects*) contra `.CSV`, Isolates encarregados da sanitização/RegEx e motor analítico classificatório O(1) imutável encapsulado em retornos de seguridade `Either`.

- [ ] **Fase 3: Apresentação Minimalista (UI/UX)**
  - Refatoração Desktop Responsiva (Modo Escuro / Claro). Painel central em barras de faturamento, consumo via orçamentos dinâmicos e controle persistente anti-falha de _Disaster Recovery_.

- [ ] **Fase 4: Obfuscação e Compilação Desktop**
  - Definição do build release com minimização de *footprint*, compilação obfuskada `.exe` isolado.
