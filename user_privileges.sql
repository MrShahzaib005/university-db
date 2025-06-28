use university_db;
-- Read-only access for data viewers
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonly123';
GRANT SELECT ON university_db.* TO 'readonly_user'@'localhost';

-- Limited write access to asset management team
CREATE USER 'asset_manager'@'localhost' IDENTIFIED BY 'asset123';
GRANT SELECT, INSERT, UPDATE ON university_db.assets TO 'asset_manager'@'localhost';

-- Full access for system admin
CREATE USER 'sysadmin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON university_db.* TO 'sysadmin'@'localhost';

FLUSH PRIVILEGES;
