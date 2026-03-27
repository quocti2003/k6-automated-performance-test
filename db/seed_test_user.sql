-- Insert test user for k6 performance test
-- Password: 1 (bcrypt hash)
INSERT INTO users (id, username, email, password, first_name, last_name, enabled, account_non_expired, account_non_locked, credentials_non_expired, failed_login_attempts, created_at, updated_at)
VALUES (9999, 'tile', 'tile@test.com', '$2b$12$r63.qslcePiKFnB5nn5.0eSpML3bjGvW8Kd87HC69uqM3p953WYXi', 'Ti', 'Le', true, true, true, true, 0, NOW(), NOW())
ON CONFLICT (username) DO UPDATE SET password = '$2b$12$r63.qslcePiKFnB5nn5.0eSpML3bjGvW8Kd87HC69uqM3p953WYXi';

-- Seed roles (neu chua co)
INSERT INTO roles (id, name, description, active, created_at, updated_at) VALUES
(1, 'USER', 'Basic user role', true, NOW(), NOW()),
(2, 'ADMIN', 'Admin role', true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Assign USER role to tile
INSERT INTO user_roles (user_id, role_id) VALUES (9999, 1)
ON CONFLICT DO NOTHING;
