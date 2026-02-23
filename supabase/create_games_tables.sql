CREATE TABLE IF NOT EXISTS games (
  id VARCHAR(50) PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  subtitle VARCHAR(100),
  description TEXT,
  match_summary TEXT,
  how_it_works TEXT,
  step_by_step JSONB,
  example_round JSONB,
  how_to_win JSONB,
  common_mistakes JSONB,
  quick_tips JSONB,
  strategies JSONB,
  rules JSONB,
  min_players INT,
  max_players INT,
  duration VARCHAR(50),
  level VARCHAR(50),
  color VARCHAR(50),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS game_content (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  game_id VARCHAR(50) NOT NULL REFERENCES games(id) ON DELETE CASCADE,
  content_type VARCHAR(50) NOT NULL, -- e.g., 'word', 'question', 'spyfall_location', 'role', 'weapon'
  main_text TEXT NOT NULL,
  secondary_text JSONB, -- useful for arrays of hints
  category VARCHAR(50), 
  description TEXT,
  color VARCHAR(50),
  impostor_text TEXT, -- specifically for 'impostor-perguntas' game
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE games ENABLE ROW LEVEL SECURITY;
ALTER TABLE game_content ENABLE ROW LEVEL SECURITY;

-- Allow public read access to games and game content
CREATE POLICY "Allow public read access to games"
  ON games FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to game_content"
  ON game_content FOR SELECT
  USING (true);
