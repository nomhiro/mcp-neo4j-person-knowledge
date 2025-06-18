
# ローカルNeo4jコンテナ


1. **JSONファイルを作成**  
   persons.json, domains.json, observations.json, relations.json を `neo4j-container/import/` ディレクトリに配置します。

2. **Neo4jコンテナを起動**  
   ```powershell
   cd neo4j-container
   docker compose up -d
   ```

<!-- 3. **Neo4j Browserにアクセス**  
   ブラウザで [http://localhost:7474](http://localhost:7474) を開き、ユーザー名・パスワードでログインします（初期値は`neo4j`/`neo4j`または`neo4j_auth.txt`参照）。 -->

1. **コンテナに入る**  
   ```powershell
   docker exec -it neo4j-container-neo4j-1 /bin/bash
   ```

2. **Cypher Shellでファイルを実行**  
   ```bash
   cypher-shell -u neo4j -p mypassword
   ```

3. **登録結果の確認**  
   ```bash
   cypher-shell -u neo4j -p mypassword "MATCH (n) RETURN n LIMIT 50;"
   ```

### importフォルダのJSONデータ登録手順

1. Neo4jコンテナに入る
```bash
# PowerShellの場合
# (コンテナ名は docker ps で確認)
docker exec -it neo4j-container-neo4j-1 /bin/bash
```

2. Cypher ShellでJSONを登録（例: persons.json）
```bash
cat /import/persons.cypher | cypher-shell -u neo4j -p mypassword
cat /import/domains.cypher | cypher-shell -u neo4j -p mypassword
cat /import/relations.cypher | cypher-shell -u neo4j -p mypassword
cat /import/observations.cypher | cypher-shell -u neo4j -p mypassword
```
※<パスワード>はneo4jのパスワードに置き換えてください。

3. 登録結果の確認**
```bash
cypher-shell -u neo4j -p mypassword "MATCH (n) RETURN n LIMIT 50;"
```

---

### Claude Desktopでの実行方法

まず、Pythonのmcp-neo4j-memoryモジュールをインストールしておきます。
```bash
pip install mcp-neo4j-memory
```

claude_desktop_config.json
```json
"mcpServers": {
  "neo4j": {
    "command": "uvx",
    "args": [
      "mcp-neo4j-memory@0.1.4",
      "--db-url",
      "neo4j+s://xxxx.databases.neo4j.io",
      "--username",
      "<your-username>",
      "--password",
      "<your-password>"
    ]
  }
}
```