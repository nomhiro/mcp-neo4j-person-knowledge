UNWIND [
{ name: "田中太郎", type: "Person", observations: ["制御設計:5", "業務自動化:4", "Excel処理:5", "RPA:3", "ソフトウェア設計:4", "テスト計画:4", "仕様策定:5", "ファイル入出力:3", "バックエンド:2", "レビュー:5"] },
{ name: "佐藤花子", type: "Person", observations: ["文書デジタル化:5", "データベース設計:5", "クラウド運用:4", "AI検索:4", "REST API設計:4", "フロントエンド:4", "Redux:3", "PowerAutomate:2", "CI/CD:2", "ナレッジ共有:3"] },
{ name: "鈴木健一", type: "Person", observations: ["Matlab:5", "数値計算:5", "データ可視化:3", "C#:3", "Python:3", "システム連携:4", "クラウド実装:3", "テスト自動化:4", "設計パターン:3", "Azure:3", "DevOps:2"] },
{ name: "山本美咲", type: "Person", observations: ["走行制御:5", "ベクトル検索:4", "Python:3", "API設計:4", "ExcelVBA:4", "テスト設計:5", "ロジック設計:4", "品質保証:3", "UI/UX:2", "コラボレーション:3"] },
{ name: "高橋悟", type: "Person", observations: ["マルチエージェント:5", "UI設計:4", "DX:4", "アジャイル:4", "プロジェクト管理:4", "scrum:3", "Redux:3", "ワークフロー設計:3", "フロントエンド開発:4", "ワークショップファシリテーション:3", "チームビルディング:3"] },
{ name: "中村彩", type: "Person", observations: ["データパイプライン:5", "AI検索:4", "データ変換:4", "API統合:3", "ステークホルダー調整:3", "業務自動化:4", "DevOps:3", "フレームワーク選定:2", "品質管理:3"] },
{ name: "小林大地", type: "Person", observations: ["マルチエージェント:4", "UI設計:3", "テスト計画:3", "画面設計:4", "ドキュメント化:3", "ワークフロー改善:3"] },
{ name: "松本恵", type: "Person", observations: ["走行制御:4", "AI活用:3", "データ分析:4", "Excel自動化:4", "API設計:4", "テスト自動化:3", "バックエンド:3", "品質保証:2", "パフォーマンス改善:3"] },
{ name: "渡辺光", type: "Person", observations: ["文書デジタル化:5", "AI応用:4", "機械学習:4", "日本語NLP:5", "DB設計:2", "PowerAutomate:3", "Python:3", "業務効率化:4", "データラベリング:3", "チーム教育:3"] },
{ name: "加藤優", type: "Person", observations: ["DB設計:4", "バックエンド:3", "Redux:2", "JavaScript:4", "自動テスト:3", "設計レビュー:2"] },
{ name: "石川絵里", type: "Person", observations: ["データ整形:3", "データパイプライン:3", "Excel操作:5", "日本語NLP:4", "フロントエンド開発:2", "テスト設計:3", "業務最適化:3"] },
{ name: "村上直樹", type: "Person", observations: ["Excel処理:5", "制御設計:4", "コーディング規約:4", "レビュー:4", "動作テスト:3", "バックエンド:3", "Python:3"] },
{ name: "斎藤 航", type: "Person", observations: ["プロジェクト管理:5", "AIモデル開発:4", "仕様書策定:4", "業務改革:3", "R&Dマネジメント:3"] },
{ name: "山田みき", type: "Person", observations: ["クラウド:4", "コラボレーション:3", "DB運用:5", "AI活用:4", "オペレーション改善:3"] },
{ name: "藤本剛", type: "Person", observations: ["ファイル処理:5", "ExcelVBA:5", "業務最適化:3", "コーディングレビュー:4", "テスト支援:3", "標準化:3", "バックエンド:3"] },
{ name: "三浦真理子", type: "Person", observations: ["仕様策定:4", "UI設計:4", "会議ファシリテート:3", "問題分析:4", "Excel操作:3"] }
] AS person
CREATE (p:Person { name: person.name, type: person.type })
WITH p, person.observations AS obs
UNWIND obs AS ob
MERGE (o:Observation { value: ob })
MERGE (p)-[:HAS_OBSERVATION]->(o);
