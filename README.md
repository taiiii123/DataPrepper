# DataPrepper

テストデータの効率的な管理と自動投入を実現するExcel VBAツールです。

## 概要

DataPrepperは、Excelシート上でテストデータを構造化して管理し、SQL INSERT/DELETE文を自動生成してデータベースへ直接登録できるツールです。開発・テスト環境でのデータ準備作業を大幅に効率化します。

## 対応データベース

| データベース | ファイル名 | 詳細 |
|-------------|-----------|------|
| MySQL | `MySQL/mysql_input_test_data.xlsm` | [MySQL版 README](MySQL/README.md) |
| Oracle | `Oracle/oracle_input_test_data.xlsm` | [Oracle版 README](Oracle/README.md) |
| PostgreSQL | `PostgreSQL/postgresql_input_test_data.xlsm` | [PostgreSQL版 README](PostgreSQL/README.md) |

## 主要機能

- **SQLファイル自動生成** - ExcelデータからDELETE + INSERT文を自動生成
- **SQL文プレビュー** - 生成予定のSQL文を事前確認
- **データベース直接登録** - 生成したSQLをデータベースに直接実行
- **バックアップ機能** - データベースのバックアップを取得

## 動作要件

- Microsoft Excel（マクロ有効）
- Windows環境
- 各データベースのCLIツール
  - MySQL: `mysql.exe`、`mysqldump.exe`
  - Oracle: `sqlplus.exe`
  - PostgreSQL: `psql.exe`、`pg_dump.exe`

## 使用方法

### 基本的な流れ

1. **CLI確認** - データベースCLIツールが利用可能か確認
2. **DB接続設定** - ホスト名、ユーザー名、パスワード等を設定
3. **入力シート作成** - 雛形シートをコピーして`テーブル名_入力`形式で命名
4. **データ入力** - スキーマ名、テーブル名、WHERE句、カラム情報、テストデータを入力
5. **SQL確認** - 生成予定のSQLをプレビュー（任意）
6. **ファイル作成** - SQLファイルを出力
7. **バックアップ** - データベースをバックアップ（任意）
8. **データ登録** - SQLをデータベースに実行

### シート構成

| シート名 | 説明 |
|---------|------|
| タイトル | ツールのタイトル画面 |
| 変更履歴 | バージョン履歴と更新内容 |
| DB接続設定 | データベース接続情報の設定 |
| 操作 | メイン操作画面 |
| シナリオ | テストシナリオ管理 |
| 雛形テーブル_入力 | テーブル入力シートのサンプル |

### データ入力ルール

- **Group（A列）**: SQLファイル分割単位（1から開始）
- **No（B列）**: 各グループ内の行番号（1から開始）
- **NULL値**: `NULL`、`null`、`« NULL »` のいずれかで入力
- テストデータ間で1行以上空けると次のケースが作成されます

## 出力ファイル

```
./output/
├── input1_テーブル名.sql    # Group 1 のSQLファイル
├── input2_テーブル名.sql    # Group 2 のSQLファイル
├── backup/
│   └── backup_YYYYMMDD.sql  # バックアップファイル
└── mysql_log.txt            # 実行ログ
```

## 生成されるSQL例

```sql
DELETE FROM スキーマ名.テーブル名 WHERE 条件;
INSERT INTO スキーマ名.テーブル名(カラム1, カラム2, ...)
  VALUES ('値1', '値2', ...);
```

## 実行ステータス

各操作の実行状態を視覚的に確認できます。

| ステータス | 表示 | 説明 |
|-----------|------|------|
| 未実行 | ─ 未実行 | まだ実行されていない |
| 実行中 | ● 実行中 | 処理を実行中 |
| 完了 | ○ 完了 | 正常に完了 |
| エラー | × エラー | エラーが発生 |

## 使い方ガイド

各データベース版の詳細な使い方ガイドを参照してください。

- [MySQL版 使い方ガイド](MySQL/使い方ガイド/USER_GUIDE.md)
- [Oracle版 使い方ガイド](Oracle/使い方ガイド/USER_GUIDE.md)
- [PostgreSQL版 使い方ガイド](PostgreSQL/使い方ガイド/USER_GUIDE.md)
