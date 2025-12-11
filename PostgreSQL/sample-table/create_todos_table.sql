-- ============================================
-- TODO管理テーブル (PostgreSQL)
-- ============================================

-- テーブル削除
DROP TABLE IF EXISTS todos;

-- テーブル作成
CREATE TABLE todos (
    id              SERIAL          NOT NULL,
    title           VARCHAR(200)    NOT NULL,
    description     TEXT            NOT NULL,
    category        VARCHAR(50),
    priority        SMALLINT        NOT NULL DEFAULT 2,
    status          SMALLINT        NOT NULL DEFAULT 0,
    due_date        DATE,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- コメント
COMMENT ON TABLE todos IS 'TODO管理';
COMMENT ON COLUMN todos.id IS 'ID';
COMMENT ON COLUMN todos.title IS 'タイトル';
COMMENT ON COLUMN todos.description IS '詳細';
COMMENT ON COLUMN todos.category IS 'カテゴリ';
COMMENT ON COLUMN todos.priority IS '優先度 (1:低, 2:中, 3:高)';
COMMENT ON COLUMN todos.status IS 'ステータス (0:未着手, 1:進行中, 2:完了)';
COMMENT ON COLUMN todos.due_date IS '期限日';
COMMENT ON COLUMN todos.created_at IS '作成日時';
COMMENT ON COLUMN todos.updated_at IS '更新日時';

-- テストデータ
INSERT INTO todos (id, title, description, category, priority, status, due_date, created_at, updated_at) VALUES
(1, '週次レポート作成', '先週の進捗をまとめて報告書を作成する', '業務', 3, 2, '2025-06-14', '2025-06-10 09:00:00', '2025-06-14 17:00:00'),
(2, 'ミーティング資料準備', '月曜の定例会議用のスライドを作成', '業務', 3, 1, '2025-06-17', '2025-06-12 10:00:00', '2025-06-15 14:00:00'),
(3, 'メール返信', '取引先からの問い合わせに回答する', '連絡', 2, 0, '2025-06-18', '2025-06-14 11:00:00', '2025-06-14 11:00:00'),
(4, '経費精算', '出張費の精算処理を行う', '経理', 1, 0, '2025-06-28', '2025-06-10 09:00:00', '2025-06-10 09:00:00'),
(5, 'システム設計書レビュー', '新機能の設計書を確認してフィードバック', '開発', 2, 1, '2025-06-20', '2025-06-13 15:00:00', '2025-06-17 10:00:00'),
(6, 'テストデータ作成', '結合テスト用のデータを準備する', '開発', 2, 0, '2025-06-21', '2025-06-15 09:00:00', '2025-06-15 09:00:00'),
(7, 'バグ修正 #1234', 'ログイン画面のバリデーションエラー対応', '開発', 3, 2, '2025-06-12', '2025-06-11 08:00:00', '2025-06-12 16:00:00'),
(8, 'ドキュメント更新', 'API仕様書に新エンドポイントを追記', 'その他', 1, 0, '2025-07-01', '2025-06-14 13:00:00', '2025-06-14 13:00:00');

-- 確認
SELECT * FROM todos ORDER BY id;
