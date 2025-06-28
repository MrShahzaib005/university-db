use university_db;
-- For complaint search by title
CREATE INDEX idx_complaint_title ON complaints(title);

-- For inventory search by name/category
CREATE INDEX idx_inventory_name ON inventory(name);
CREATE INDEX idx_inventory_category ON inventory(category);

-- For user login (email)
CREATE INDEX idx_user_email ON users(email);
