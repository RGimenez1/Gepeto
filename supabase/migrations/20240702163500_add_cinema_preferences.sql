--------------- CINEMA PREFERENCES ---------------

-- TABLE --

CREATE TABLE IF NOT EXISTS cinema_preferences (
    -- ID
    id SERIAL PRIMARY KEY,

    -- REQUIRED RELATIONSHIPS
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,

    -- METADATA
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- CINEMA PREFERENCES DATA
    title VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL,
    type VARCHAR(50) NOT NULL,
    genre TEXT[] NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('loved', 'liked', 'to_watch', 'disliked', 'strongly_disliked'))
);

-- INDEXES --

CREATE INDEX cinema_preferences_user_id_idx ON cinema_preferences(user_id);
CREATE INDEX cinema_preferences_status_idx ON cinema_preferences(status);

-- RLS --

ALTER TABLE cinema_preferences ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow full access to own cinema_preferences"
    ON cinema_preferences
    USING (user_id = auth.uid())
    WITH CHECK (user_id = auth.uid());

-- FUNCTIONS --

CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGERS --

CREATE TRIGGER update_cinema_preferences_updated_at
BEFORE UPDATE ON cinema_preferences
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();
